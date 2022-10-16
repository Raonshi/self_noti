



import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';
import 'package:self_noti/src/widgets/timer_dialog.dart';

class TimerComponent extends StatelessWidget {
  const TimerComponent({Key? key, required this.provider}) : super(key: key);

  final TimerProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: CircularCountDownTimer(
            controller: provider.countdownController,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            duration: provider.time,
            initialDuration: 0,
            fillColor: Colors.green.shade400,
            ringColor: Colors.grey.shade200,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            textFormat: getTimerTextFormat(provider.time),
            isTimerTextShown: true,
            isReverse: true,
            isReverseAnimation: true,
            autoStart: false,
            onStart: () {
              if(provider.time != 0) provider.time = 0;
              provider.state = TimerState.counting;
            },
            onComplete: () {
              provider.state = TimerState.idle;
              provider.timerReset();
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (provider.state == TimerState.counting) ...[
              ElevatedButton(
                onPressed: provider.timerReset,
                child: const Text('정지'),
              ),
              const SizedBox(width: 12.0),
              ElevatedButton(
                onPressed: provider.timerPause,
                child: const Text('일시 정지'),
              ),
            ],
            if (provider.state == TimerState.paused)
              ...[
                ElevatedButton(
                  onPressed: provider.timerReset,
                  child: const Text('정지'),
                ),
                const SizedBox(width: 12.0),
                ElevatedButton(
                  onPressed:
                  provider.timerResume,
                  child: const Text('재개'),
                )],

            if(provider.state == TimerState.idle)
              ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return TimerDialog(provider: provider);
                    },
                  );
                  debugPrint('${provider.time}');
                  provider.timerStart();
                },
                child: const Text('시간 설정'),
              ),
          ],
        ),
      ],
    );
  }

  String getTimerTextFormat(int time){
    if(time > 59)return 'mm:SS';
    if(time > 3600)return 'HH:mm:SS';
    return 'SS';
  }
}
