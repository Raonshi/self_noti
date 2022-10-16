import 'package:flutter/material.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';

class NotificationProvider extends ChangeNotifier {
  String title = 'Self Noti';
  List<NotificationItem> notiItems = [];

  NotificationProvider(){
    // initNotiItems();
  }

  void initNotiItems() {
    notiItems = List.generate(
      10,
      (index) => NotificationItem(
        title: 'Test_$index',
        content: 'Super Contents_$index',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void addNotiItem(NotificationItem item) {
    item = item.copyWith(createdAt: DateTime.now());
    notiItems.add(item);
    notifyListeners();
  }
}