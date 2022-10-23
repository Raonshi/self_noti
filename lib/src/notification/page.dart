import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_noti/src/global/components/empty_widget.dart';
import 'package:self_noti/src/notification/components/notification_dialog.dart';
import 'package:self_noti/src/notification/components/notification_list_item.dart';
import 'package:self_noti/src/notification/provider/notification_provider.dart';
import 'package:self_noti/style/styles.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ],
        child: Column(
          children: [
            Expanded(child: Consumer<NotificationProvider>(
              builder: (BuildContext context, NotificationProvider provider, Widget? child) {
                return provider.notiItems.isEmpty
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
                      );
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: [
                Expanded(
                  child: Consumer<NotificationProvider>(
                    builder: (BuildContext context, NotificationProvider provider, Widget? child) {
                      return ElevatedButton(
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
                      );
                    },
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
