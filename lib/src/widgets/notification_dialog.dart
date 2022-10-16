import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:self_noti/enum.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';
import 'package:self_noti/src/home/provider/timer_provider.dart';
import 'package:self_noti/style/styles.dart';

class NotificationDialog extends StatelessWidget {
  const NotificationDialog({Key? key, required this.provider}) : super(key: key);

  final NotificationProvider provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<NotificationProvider>(
        builder: (BuildContext context, NotificationProvider provider, Widget? child) {
          NotificationItem notiItem = const NotificationItem();
          return AlertDialog(
            title: const Text('알림 추가'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  _NotificationInputField(
                    label: '제목',
                    onChanged: (String value) {
                      notiItem = notiItem.copyWith(title: value);
                    },
                  ),

                  const SizedBox(height: 4.0),

                  // Content
                  _NotificationInputField(
                    label: '내용',
                    maxLine: 5,
                    maxLength: 300,
                    onChanged: (String value) {
                      notiItem = notiItem.copyWith(content: value);
                    },
                  ),
                  const SizedBox(height: 4.0),

                  // Expired Day
                  _NotificationDateInputField(
                    label: '종료 날짜',
                    onChanged: (DateTime? date) {
                      notiItem = notiItem.copyWith(expiredAt: date);
                    },
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style: mainButtonStyleForm,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('취소', style: buttonTextStyle.copyWith(fontSize: 16.0))),
              ElevatedButton(
                  style: mainButtonStyleForm,
                  onPressed: () {
                    provider.addNotiItem(notiItem);
                    Navigator.of(context).pop();
                  },
                  child: Text('생성', style: buttonTextStyle.copyWith(fontSize: 16.0))),
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        },
      ),
    );
  }
}

/// Input Notification's String value
class _NotificationInputField extends StatefulWidget {
  _NotificationInputField({
    Key? key,
    this.label,
    this.onChanged,
    this.maxLength,
    this.maxLine,
  }) : super(key: key);

  final String? label;
  final ValueChanged<String>? onChanged;
  final int? maxLine;
  final int? maxLength;

  final TextEditingController textEditingController = TextEditingController();

  @override
  State<_NotificationInputField> createState() => _NotificationInputFieldState();
}

class _NotificationInputFieldState extends State<_NotificationInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!, style: labelStyle),
        TextFormField(
          onChanged: (String value) {
            setState(() {
              widget.onChanged!(value);
            });
          },
          maxLength: widget.maxLength,
          maxLines: widget.maxLine,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            enabledBorder: getBorder(Colors.grey.shade300),
            focusedBorder: getBorder(Colors.black),
            focusedErrorBorder: getBorder(Colors.red.shade400),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: color, width: 1.0),
      );
}

/// Input Notification Date value
class _NotificationDateInputField extends StatefulWidget {
  _NotificationDateInputField({
    Key? key,
    this.label,
    this.onChanged,
  }) : super(key: key);

  final String? label;
  final ValueChanged<DateTime>? onChanged;

  final TextEditingController textEditingController = TextEditingController();

  @override
  State<_NotificationDateInputField> createState() => _NotificationInputDateFieldState();
}

class _NotificationInputDateFieldState extends State<_NotificationDateInputField> {
  late DateTime date;
  bool isCalendarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) Text(widget.label!, style: labelStyle),
        TextFormField(
          controller: widget.textEditingController,
          onTap: () async {
            setState(() {
              isCalendarOpen = true;
            });
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            enabledBorder: getBorder(Colors.grey.shade300),
            focusedBorder: getBorder(Colors.black),
            focusedErrorBorder: getBorder(Colors.red.shade400),
          ),
        ),
        if (isCalendarOpen)
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1970),
              lastDate: DateTime(2099, 12, 31),
              onDateChanged: (DateTime date) {
                widget.textEditingController.text = DateFormat('yyyy년 MM월 dd일').format(date);
                setState(() {
                  isCalendarOpen = false;
                  widget.onChanged!(date);
                });
              },
            ),
          ),
      ],
    );
  }

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: color, width: 1.0),
      );
}
