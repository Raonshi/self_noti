import 'package:flutter/material.dart';
import 'package:self_noti/style/styles.dart';

/// Input Notification's String value
class NotificationInputField extends StatefulWidget {
  NotificationInputField({
    Key? key,
    this.label,
    this.onChanged,
    this.maxLength,
    this.maxLine,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final ValueChanged<String>? onChanged;
  final int? maxLine;
  final int? maxLength;
  final String? initialValue;

  final TextEditingController textEditingController = TextEditingController();

  @override
  State<NotificationInputField> createState() => _NotificationInputFieldState();
}

class _NotificationInputFieldState extends State<NotificationInputField> {
  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.textEditingController.text = widget.initialValue!;
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
          validator: (String? val) {
            if (val?.isEmpty ?? true) {
              return '${widget.label}을 입력해주세요';
            }
            return null;
          },
        ),
      ],
    );
  }

  OutlineInputBorder getBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: color, width: 1.0),
      );
}
