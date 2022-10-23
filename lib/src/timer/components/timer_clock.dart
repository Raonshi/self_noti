import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/timer/provider/timer_provider.dart';

class TimerClock extends StatelessWidget {
  const TimerClock({super.key, required this.provider});

  final TimerProvider provider;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      controller: provider.countdownController,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      duration: provider.time,
      initialDuration: 0,
      fillColor: Theme.of(context).colorScheme.secondary,
      ringColor: Theme.of(context).colorScheme.surface,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textFormat: getTimerTextFormat(provider.time),
      textStyle: TextStyle(
        fontSize: 44.0,
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
