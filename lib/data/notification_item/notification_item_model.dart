import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_item_model.freezed.dart';
part 'notification_item_model.g.dart';

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    String? uid,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiredAt,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, Object?> json)
  => _$NotificationItemFromJson(json);
}