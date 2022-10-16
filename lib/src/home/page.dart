import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/home/components/notification_list.dart';
import 'package:self_noti/src/home/components/timer.dart';
import 'package:self_noti/src/home/provider/home_provider.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';
import 'package:self_noti/style/styles.dart';

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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider provider, Widget? child) =>
                Text(Provider.of<HomeProvider>(context).title, style: appBarTitleStyle),
          ),
          actions:const [
            // IconButton(
            //     onPressed: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            //           behavior: SnackBarBehavior.floating,
            //           dismissDirection: DismissDirection.up,
            //           elevation: 30,
            //           content: Row(
            //             children: [Text('아직 구현되지 않')],
            //           ),
            //         ),
            //       );
            //     },
            //     icon: const Icon(Icons.menu)),
          ],
        ),
        body: Column(
          children: [
            Consumer<TimerProvider>(
              builder: (BuildContext context, TimerProvider provider, Widget? child) =>
                  TimerComponent(provider: provider),
            ),
            const SizedBox(height: 4.0),
            Divider(
              thickness: 2.0,
              color: Theme.of(context).colorScheme.surface,
              height: 1.0,
            ),
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
