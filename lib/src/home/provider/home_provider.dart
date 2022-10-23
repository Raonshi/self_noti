import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  String title = '셀 티';

  late PageController pageController;
  int currentPageIndex = 0;

  HomeProvider() {
    pageController = PageController(initialPage: currentPageIndex);
  }

  void onClickBottomTap(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    currentPageIndex = index;
    notifyListeners();
  }
}
