import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:self_noti/data/notification_item/notification_item_model.dart';
import 'package:self_noti/style/styles.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key, this.item, this.onTap}) : super(key: key);

  final NotificationItemModel? item;
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
        icon: Icon(Icons.chevron_right_rounded, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
