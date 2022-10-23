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
        if (provider.state == TimerState.counting) ...[
          Expanded(
            child: ElevatedButton(
              style: mainButtonStyleForm,
              onPressed: provider.timerReset,
              child: Text('정지', style: buttonTextLargeStyle),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: ElevatedButton(
              style: mainButtonStyleForm,
              onPressed: provider.timerPause,
              child: Text('일시 정지', style: buttonTextLargeStyle),
            ),
          ),
        ],
        if (provider.state == TimerState.paused) ...[
          Expanded(
            child: ElevatedButton(
              style: mainButtonStyleForm,
              onPressed: provider.timerReset,
              child: Text('정지', style: buttonTextLargeStyle),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: ElevatedButton(
              style: mainButtonStyleForm,
              onPressed: provider.timerResume,
              child: Text('재개', style: buttonTextLargeStyle),
            ),
          )
        ],
        if (provider.state == TimerState.idle)
          Expanded(
            child: ElevatedButton(
              style: mainButtonStyleForm,
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) {
                    return TimerDialog(provider: provider);
                  },
                );
                provider.timerStart();
              },
              child: Text('시간 설정', style: buttonTextLargeStyle),
            ),
          ),
      ],
    );
  }
}
