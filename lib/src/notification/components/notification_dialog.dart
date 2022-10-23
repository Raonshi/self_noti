import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:self_noti/src/notification/components/notification_date_input_field.dart';
import 'package:self_noti/src/notification/components/notification_input_field.dart';
import 'package:self_noti/src/notification/provider/notification_provider.dart';
import 'package:self_noti/style/styles.dart';

class NotificationDialog extends StatelessWidget {
  NotificationDialog({Key? key, required this.provider, this.index}) : super(key: key);

  final NotificationProvider provider;
  final int? index;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Consumer<NotificationProvider>(
        builder: (BuildContext context, NotificationProvider provider, Widget? child) {
          NotificationItemModel notiItem = index == null ? const NotificationItemModel() : provider.notiItems[index!];

          return AlertDialog(
            title: const Text('알림 추가'),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      NotificationInputField(
                        label: '제목',
                        initialValue: index == null ? null : provider.notiItems[index!].title,
                        onChanged: (String value) {
                          notiItem = notiItem.copyWith(title: value);
                        },
                      ),

                      const SizedBox(height: 4.0),

                      // Content
                      NotificationInputField(
                        label: '내용',
                        maxLine: 5,
                        maxLength: 300,
                        initialValue: index == null ? null : provider.notiItems[index!].content,
                        onChanged: (String value) {
                          notiItem = notiItem.copyWith(content: value);
                        },
                      ),
                      const SizedBox(height: 4.0),

                      // Expired Day
                      NotificationDateInputField(
                        label: '종료 날짜',
                        initialValue: index == null ? null : provider.notiItems[index!].expiredAt,
                        onChanged: (DateTime? date) {
                          notiItem = notiItem.copyWith(expiredAt: date);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                style: mainButtonStyleForm,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소', style: buttonTextLargeStyle.copyWith(fontSize: 16.0)),
              ),
              ElevatedButton(
                style: mainButtonStyleForm,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (index == null) {
                      provider.addNotiItem(notiItem);
                    } else {
                      provider.updateNotiItem(notiItem, index!);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(index == null ? '생성' : '수정', style: buttonTextLargeStyle.copyWith(fontSize: 16.0)),
              ),
            ],
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        },
      ),
    );
  }
}
