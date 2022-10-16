import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider extends ChangeNotifier {
  String title = 'Self Noti';
  List<NotificationItemModel> notiItems = [];
  late final SharedPreferences localStorage;

  NotificationProvider() {
    initStorage().then((_) => initNotiItems());
  }

  Future<void> initStorage() async => localStorage = await SharedPreferences.getInstance();

  void initNotiItems() async {
    if (localStorage.containsKey('notificationItems')) {
      List<String>? data = localStorage.getStringList('notificationItems');
      if(data == null){
        return;
      }
      notiItems = data.map((e) {
        Map<String, dynamic> jsonData = json.decoder.convert(e);
        return  NotificationItemModel.fromJson(json.decode(e));
      }).toList();
    }
    notifyListeners();
  }

  void addNotiItem(NotificationItemModel item) {
    item = item.copyWith(createdAt: DateTime.now());
    notiItems.add(item);
    localStorage.setStringList('notificationItems', convertNotificationItemModelToString());
    notifyListeners();
  }

  void updateNotiItem(NotificationItemModel item, int index) {
    item = item.copyWith(updatedAt: DateTime.now());
    notiItems.replaceRange(index, index + 1, [item]);
    localStorage.setStringList('notificationItems', convertNotificationItemModelToString());
    notifyListeners();
  }

  List<String> convertNotificationItemModelToString() {
    List<Map<String, dynamic>> jsonList= notiItems.map((e) => e.toJson()).toList();
    return jsonList.map((e) => json.encode(e)).toList();
  }
}
