import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/home/provider/home_provider.dart';
import 'package:self_noti/src/notification/page.dart';
import 'package:self_noti/src/timer/page.dart';
import 'package:self_noti/style/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider provider, Widget? child) =>
                Text(Provider.of<HomeProvider>(context).title, style: appBarTitleStyle),
          ),
        ),
        body: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider provider, Widget? child) {
            return PageView(
              controller: provider.pageController,
              children: const [
                TimerPage(),
                NotificationPage(),
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (BuildContext context, HomeProvider provider, Widget? child) {
            return BottomNavigationBar(
                currentIndex: provider.currentPageIndex,
                onTap: (value) {
                  provider.onClickBottomTap(value);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.timer), label: '타이머'),
                  BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '알림'),
                ]);
          },
        ),
      ),
    );
  }
}
