import 'package:flutter/material.dart';
import 'package:self_noti/src/notification/components/notification_list_item.dart';
import 'package:self_noti/src/notification/provider/notification_provider.dart';
import 'package:self_noti/src/global/components/empty_widget.dart';
import 'package:self_noti/src/notification/components/notification_dialog.dart';
import 'package:self_noti/style/styles.dart';

class NotificationListComponent extends StatelessWidget {
  const NotificationListComponent({Key? key, required this.provider}) : super(key: key);

  final NotificationProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: provider.notiItems.isEmpty
              ? const EmptyWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.notiItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: NotificationListItem(
                        item: provider.notiItems[index],
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) {
                              return NotificationDialog(provider: provider, index: index);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(children: [
            Expanded(
              child: ElevatedButton(
                style: mainButtonStyleForm,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return NotificationDialog(provider: provider);
                    },
                  );
                },
                child: Text('알림 추가', style: buttonTextStyle),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
