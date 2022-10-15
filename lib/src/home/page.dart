import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/home/provider/home_provider.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';
import 'package:self_noti/src/widgets/timer_dialog.dart';

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
        appBar: AppBar(
          title: Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider provider, Widget? child) =>
                Text(Provider.of<HomeProvider>(context).title),
          ),
        ),
        body: Column(
          children: [
            Consumer<TimerProvider>(
              builder: (BuildContext context, TimerProvider provider, Widget? child) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    child: CircularCountDownTimer(
                      controller: provider.countdownController,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      duration: provider.time,
                      fillColor: Colors.amber,
                      ringColor: Colors.red,
                      isTimerTextShown: true,
                      isReverse: true,
                      isReverseAnimation: true,
                      autoStart: false,
                      onStart: () {
                        debugPrint('Countdown Started');
                        provider.state = TimerState.counting;
                      },
                      onComplete: () {
                        debugPrint('Countdown Ended');
                        provider.state = TimerState.idle;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (provider.state == TimerState.counting) ...[
                        ElevatedButton(
                          onPressed: provider.timerReset,
                          child: Text('정지'),
                        ),
                        const SizedBox(width: 12.0),
                        ElevatedButton(
                          onPressed: provider.timerPause,
                          child: Text('일시 정지'),
                        ),
                      ],
                      if (provider.state == TimerState.paused)
                        ...[
                          ElevatedButton(
                            onPressed: provider.timerReset,
                            child: Text('정지'),
                          ),
                          const SizedBox(width: 12.0),
                          ElevatedButton(
                          onPressed:
                            provider.timerResume,
                          child: Text('재개'),
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
                            provider.timerStart();
                          },
                          child: Text('시간 설정'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<NotificationProvider>(
                builder: (BuildContext context, NotificationProvider provider, Widget? child) => Column(
                  children: [
                    Expanded(
                      child: context.read<NotificationProvider>().notiItems.isEmpty
                          ? const Text('There is no notification')
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.notiItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text(provider.notiItems[index].toString());
                              },
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.addNotiItem();
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
