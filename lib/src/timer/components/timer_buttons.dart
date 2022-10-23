import 'package:flutter/material.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/timer/components/timer_dialog.dart';
import 'package:self_noti/src/timer/provider/timer_provider.dart';
import 'package:self_noti/style/styles.dart';

class TimerButtons extends StatelessWidget {
  const TimerButtons({super.key, required this.provider});
  final TimerProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: mainButtonStyleForm,
            onPressed: () async {
              bool isTimeSetted = await showDialog(
                context: context,
                builder: (_) {
                  return TimerDialog(provider: provider);
                },
              );

              if (isTimeSetted) {
                provider.setTimer();
              }
              provider.clearTime();
            },
            child: Text('타이머 추가', style: buttonTextLargeStyle),
          ),
        ),
      ],
    );
  }
}
