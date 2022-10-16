import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';
import 'package:self_noti/src/widgets/timer_dialog.dart';
import 'package:self_noti/style/styles.dart';

class TimerComponent extends StatelessWidget {
  const TimerComponent({Key? key, required this.provider}) : super(key: key);

  final TimerProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: CircularCountDownTimer(
            controller: provider.countdownController,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.23,
            duration: provider.time,
            initialDuration: 0,
            fillColor: Theme.of(context).colorScheme.secondary,
            ringColor: Theme.of(context).colorScheme.surface,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            textFormat: getTimerTextFormat(provider.time),
            textStyle: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: getTimerTextColor(context, provider.state),
            ),
            isTimerTextShown: true,
            isReverse: true,
            isReverseAnimation: true,
            autoStart: false,
            onStart: () {
              if (provider.time != 0) provider.time = 0;
              provider.state = TimerState.counting;
            },
            onComplete: () {
              provider.state = TimerState.idle;
              provider.timerReset();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.state == TimerState.counting) ...[
                Expanded(
                  child: ElevatedButton(
                    style: mainButtonStyleForm,
                    onPressed: provider.timerReset,
                    child: Text('정지', style: buttonTextStyle),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    style: mainButtonStyleForm,
                    onPressed: provider.timerPause,
                    child: Text('일시 정지', style: buttonTextStyle),
                  ),
                ),
              ],
              if (provider.state == TimerState.paused) ...[
                Expanded(
                  child: ElevatedButton(
                    style: mainButtonStyleForm,
                    onPressed: provider.timerReset,
                    child: Text('정지', style: buttonTextStyle),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: ElevatedButton(
                    style: mainButtonStyleForm,
                    onPressed: provider.timerResume,
                    child: Text('재개', style: buttonTextStyle),
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
                    child: Text('시간 설정', style: buttonTextStyle),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Color getTimerTextColor(BuildContext context, TimerState state) {
    switch (state) {
      case TimerState.counting:
        return Theme.of(context).colorScheme.secondary;
      default:
        return Theme.of(context).colorScheme.surface;
    }
  }

  String getTimerTextFormat(int time) {
    if (time > 59) return 'mm:SS';
    if (time > 3600) return 'HH:mm:SS';
    return 'SS';
  }
}
