import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:self_noti/src/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationProvider extends ChangeNotifier {
  String title = 'Self Noti';
  List<NotificationItemModel> notiItems = [];

  // Local Storage Access
  late final SharedPreferences localStorage;

  //Local Notification
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationProvider() {
    initStorage().then((_) async {
      await initNotiItems();
      await initLocalNotification();
    });
  }

  /// ## initStorage()
  /// Initialize [SharedPreferences].
  Future<void> initStorage() async => localStorage = await SharedPreferences.getInstance();

  /// ## initNotiItems()
  /// Initialize [NotificationItemModel] List which is stored in [SharedPreferences].
  Future<void> initNotiItems() async {
    if (localStorage.containsKey('notificationItems')) {
      List<String>? data = localStorage.getStringList('notificationItems');
      if (data == null) return;
      notiItems = data.map((e) {
        return NotificationItemModel.fromJson(json.decode(e));
      }).toList();

      for (NotificationItemModel item in notiItems) {
        if ((item.expiredAt?.isBefore(DateTime.now()) ?? true) || isSameDay(item.expiredAt ?? DateTime(1970), DateTime.now())) removeNotiItem(item);
      }
    }
    notifyListeners();
  }

  /// ## initLocalNotification()
  /// Initialize [FlutterLocalNotificationsPlugin].
  Future<void> initLocalNotification() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        const InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// ## removeNotiItem(NotificationItemModel)
  /// Remove [NotificationItemModel] in [notiItems].
  void removeNotiItem(NotificationItemModel item) {
    notiItems.remove(item);
    notifyListeners();
  }

  /// ## removeNotiItemFromIndex(int)
  /// Remove [NotificationItemModel] at [index] of [notiItems].
  void removeNotiItemFromIndex(int index) {
    notiItems.removeAt(index);
    notifyListeners();
  }

  /// ## addNotiItem(NotificationItemModel)
  /// Add [NotificationItemModel] at last of [notiItems].
  ///
  /// After adding, [notiItems] will be stored at [localStorage].
  void addNotiItem(NotificationItemModel item) {
    item = item.copyWith(createdAt: DateTime.now());
    notiItems.add(item);
    localStorage.setStringList('notificationItems', convertNotificationItemModelToString());
    notifyListeners();
  }

  /// ## updateNotiItem(NotificationItemModel, int)
  /// Update [NotificationItemModel] at [index] of [notiItems].
  void updateNotiItem(NotificationItemModel item, int index) {
    item = item.copyWith(updatedAt: DateTime.now());
    notiItems.replaceRange(index, index + 1, [item]);
    localStorage.setStringList('notificationItems', convertNotificationItemModelToString());

    createLocalNotification(item);
    notifyListeners();
  }

  /// ## convertNotificationItemModelToString()
  /// Convert [NotificationItemModel] to String.
  List<String> convertNotificationItemModelToString() {
    List<Map<String, dynamic>> jsonList = notiItems.map((e) => e.toJson()).toList();
    return jsonList.map((e) => json.encode(e)).toList();
  }

  /// ## calculateScheduleSeconds(NotificationItemModel)
  /// Calculate when notification will be displayed.
  Duration calculateScheduleSeconds(NotificationItemModel item) {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

    final DateTime expiredDay = DateTime(item.expiredAt!.year, item.expiredAt!.month, item.expiredAt!.day, 9);
    final DateTime today = DateTime.now();

     return Duration(seconds: expiredDay.difference(today).inSeconds);
  }


  /// ## createLocalNotification(NotificationItemModel)
  /// Create scheduled notification.
  /// - every notification will be announced 9:00A.M each day.
  void createLocalNotification(NotificationItemModel item) async {
    final notiTime = calculateScheduleSeconds(item);

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'st_001',
      'localNotification',
      channelDescription: 'This notification is made by NotificationItemModel',
      priority: Priority.max,
      importance: Importance.max,
      fullScreenIntent: true,
      enableVibration: true,
      playSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      '${item.title}',
      '${item.content}',
      tz.TZDateTime.now(tz.local).add(notiTime),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
