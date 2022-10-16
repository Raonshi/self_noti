import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/home/components/notification_list.dart';
import 'package:self_noti/src/home/components/timer.dart';
import 'package:self_noti/src/home/provider/home_provider.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider provider, Widget? child) =>
                Text(Provider.of<HomeProvider>(context).title),
          ),
        ),
        body: Column(
          children: [
            Consumer<TimerProvider>(
              builder: (BuildContext context, TimerProvider provider, Widget? child) =>
                  TimerComponent(provider: provider),
            ),
             Divider(thickness: 1.0, color: Colors.grey.shade300),
            Expanded(
              child: Consumer<NotificationProvider>(
                builder: (BuildContext context, NotificationProvider provider, Widget? child) =>
                    NotificationListComponent(provider: provider),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
