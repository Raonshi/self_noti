import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/timer/provider/timer_provider.dart';

class TimerDialog extends StatelessWidget {
  const TimerDialog({Key? key, required this.provider}) : super(key: key);

  final TimerProvider provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<TimerProvider>(
        builder: (BuildContext context, TimerProvider provider, Widget? child) => AlertDialog(
          title: Text('Set Time'),
          content: Row(
            children: [
              // Hour
              Expanded(
                child: _TimeField(
                  type: TimerFieldType.hour,
                  onChanged: (int value) {
                    provider.hour = value;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(':'),
              ),

              // Minute
              Expanded(
                child: _TimeField(
                  type: TimerFieldType.minute,
                  onChanged: (int value) {
                    provider.minute = value;
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(':'),
              ),

              // Second
              Expanded(
                child: _TimeField(
                  type: TimerFieldType.second,
                  onChanged: (int value) {
                    provider.second = value;
                  },
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('취소')),
            ElevatedButton(
                onPressed: () {
                  provider.setTimer();
                  Navigator.of(context).pop();
                },
                child: const Text('시작')),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}

class _TimeField extends StatefulWidget {
  _TimeField({Key? key, this.type, this.onChanged}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();
  final TimerFieldType? type;
  final ValueChanged<int>? onChanged;

  @override
  State<_TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<_TimeField> {
  int count = 0;

  @override
  void initState() {
    widget.textEditingController.text = count.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            switch (widget.type) {
              case TimerFieldType.hour:
                if (count == 23) {
                  count = 0;
                } else {
                  count += 1;
                }
                break;
              case TimerFieldType.minute:
              case TimerFieldType.second:
                if (count == 59) {
                  count = 0;
                } else {
                  count += 1;
                }
                break;
              default:
                count = 0;
            }
            widget.textEditingController.text = count.toString();
            setState(() {
              widget.onChanged!(count);
            });
          },
          icon: const Icon(Icons.arrow_drop_up),
        ),
        TextField(
          controller: widget.textEditingController,
          readOnly: true,
          textAlign: TextAlign.center,
        ),
        IconButton(
          onPressed: () {
            switch (widget.type) {
              case TimerFieldType.hour:
                if (count == 0) {
                  count = 23;
                } else {
                  count -= 1;
                }
                break;
              case TimerFieldType.minute:
              case TimerFieldType.second:
                if (count == 0) {
                  count = 59;
                } else {
                  count -= 1;
                }
                break;
              default:
                count = 0;
            }
            widget.textEditingController.text = count.toString();
            setState(() {
              widget.onChanged!(count);
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
        )
      ],
    );
  }
}
