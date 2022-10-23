import 'dart:async';

import 'package:flutter/material.dart';
import 'package:self_noti/data/timer_item/timer_item_model.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/style/styles.dart';

class TimerListItem extends StatefulWidget {
  const TimerListItem({super.key, required this.data, required this.onDelete});

  final TimerItemModel data;
  final VoidCallback onDelete;

  @override
  State<TimerListItem> createState() => TimerListItemState();
}

class TimerListItemState extends State<TimerListItem> {
  late Duration initialTime;
  late Duration currentTime;
  late Timer _timer;
  String timerText = '';
  TimerState state = TimerState.idle;

  @override
  void initState() {
    initialTime = Duration(seconds: widget.data.time ?? 0);
    currentTime = initialTime;
    timerText = _getTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(timerText, style: titleMediumStyle),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: onStart,
          child: Text('시작', style: buttonTextSmallStyle),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: onStop,
          child: Text('일시\n정지', style: buttonTextSmallStyle),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(48, 48),
          ),
          onPressed: widget.onDelete,
          child: Text(
            '삭제',
            style: buttonTextSmallStyle,
          ),
        ),
      ],
    );
  }

  String _getTime() {
    return '${currentTime.inHours.toString().padLeft(2, '0')}:${(currentTime.inMinutes % 60).toString().padLeft(2, '0')}:${(currentTime.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void onStart() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (initialTime.inSeconds - timer.tick <= 0) {
          state = TimerState.idle;
          timer.cancel();
        }
        state = TimerState.counting;

        currentTime = Duration(seconds: initialTime.inSeconds - timer.tick);
        timerText = _getTime();
      });
    });
  }

  void onStop() {
    initialTime = currentTime;
    state = TimerState.paused;
    _timer.cancel();
  }
}
