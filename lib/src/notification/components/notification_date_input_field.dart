import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:self_noti/style/styles.dart';

/// Input Notification Date value
class NotificationDateInputField extends StatefulWidget {
  NotificationDateInputField({
    Key? key,
    this.label,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final ValueChanged<DateTime>? onChanged;
  final DateTime? initialValue;

  final TextEditingController textEditingController = TextEditingController();

  @override
  State<NotificationDateInputField> createState() => _NotificationInputDateFieldState();
}

class _NotificationInputDateFieldState extends State<NotificationDateInputField> {
  late DateTime date;
  bool isCalendarOpen = false;

  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.textEditingController.text = DateFormat('yyyy년 MM월 dd일').format(widget.initialValue!);
    }
    super.initState();
  }

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
          validator: (String? val) {
            if (val?.isEmpty ?? true) {
              return '${widget.label}을 입력해주세요';
            }

            if (DateFormat('yyyy년 MM월 dd일').parse(val!).isBefore(DateTime.now())) {
              return '오늘 이후의 날짜로 설정해주세요';
            }

            return null;
          },
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
