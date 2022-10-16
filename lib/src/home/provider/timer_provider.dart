import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:self_noti/enum.dart';

class TimerProvider extends ChangeNotifier {
  final int maxTime = 86399;
  int time = 0;

  int hour = 0;
  int minute = 0;
  int second = 0;

  CountDownController countdownController = CountDownController();
  TimerState state = TimerState.idle;

  void setTimer(){
    time = second + (60 * minute) + (3600 * hour);
    notifyListeners();
  }

  void timerStart() {
    countdownController.restart(duration: time);
    state = TimerState.counting;
    notifyListeners();
  }

  void timerPause() {
    countdownController.pause();
    state = TimerState.paused;
    notifyListeners();
  }

  void timerReset(){
    countdownController.reset();
    clearTime();
    state = TimerState.idle;
    notifyListeners();
  }

  void timerResume() {
    countdownController.resume();
    state = TimerState.counting;
    notifyListeners();
  }

  void clearTime(){
    time = 0;
    hour = 0;
    minute = 0;
    second = 0;
  }
}