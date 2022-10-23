import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String title = '셀 티';

  late PageController pageController;
  int currentPageIndex = 0;

  HomeProvider() {
    pageController = PageController(initialPage: currentPageIndex);
  }

  void onClickBottomTap(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
    currentPageIndex = index;
    notifyListeners();
  }
}
