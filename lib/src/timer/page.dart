import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/timer/components/timer_buttons.dart';
import 'package:self_noti/src/timer/components/timer_clock.dart';
import 'package:self_noti/src/timer/components/timer_list_item.dart';
import 'package:self_noti/src/timer/provider/timer_provider.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Consumer<TimerProvider>(
                builder: (BuildContext context, TimerProvider provider, Widget? child) {
                  return TimerClock(provider: provider);
                },
              ),
            ),
            Consumer<TimerProvider>(
              builder: (BuildContext context, TimerProvider provider, Widget? child) {
                return TimerButtons(provider: provider);
              },
            ),
            const Divider(),
            Expanded(
              child: Consumer<TimerProvider>(
                builder: (BuildContext context, TimerProvider provider, Widget? child) {
                  return ListView.separated(
                    itemCount: provider.timerItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TimerListItem(
                        data: provider.timerItems[index],
                        onDelete: () {
                          provider.onDeleteTimerItem(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16.0);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
