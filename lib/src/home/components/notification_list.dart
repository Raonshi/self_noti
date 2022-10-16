import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:self_noti/src/home/provider/notification_provider.dart';
import 'package:self_noti/src/widgets/notification_dialog.dart';
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
              ? const Text('알림이 없습니다')
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.notiItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(color: index % 2 == 0 ? Colors.grey.shade50 : Colors.grey.shade100),
                      child: _NotificationListItem(
                        item: provider.notiItems[index],
                        onTap: () {},
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

class _NotificationListItem extends StatelessWidget {
  const _NotificationListItem({Key? key, this.item, this.onTap}) : super(key: key);

  final NotificationItem? item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item?.title ?? '', style: titleSmallStyle),
          Text(
            item?.expiredAt == null ? '' : DateFormat('yyyy년 MM월 dd일 종료').format(item!.expiredAt!),
            style: labelStyle,
          ),
        ],
      ),
      subtitle: Text(
        (item?.content ?? '').replaceAll('\n', '. '),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: IconButton(
        constraints: const BoxConstraints(),
        splashRadius: 0.1,
        padding: EdgeInsets.zero,
        onPressed: onTap,
        iconSize: 32.0,
        icon: const Icon(Icons.chevron_right_rounded, color: Colors.black),
      ),
    );
  }
}
