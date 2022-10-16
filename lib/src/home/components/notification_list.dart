import 'package:flutter/material.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';

class NotificationListComponent extends StatelessWidget {
  const NotificationListComponent({Key? key, required this.provider}) : super(key: key);

  final NotificationProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: provider.notiItems.isEmpty
              ? const Text('알림이 없습니다')
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
          child: const Text('알림 추가'),
        ),
      ],
    );
  }
}
