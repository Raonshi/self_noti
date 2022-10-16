import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_item_model.freezed.dart';
part 'notification_item_model.g.dart';

@freezed
class NotificationItemModel with _$NotificationItemModel {
  const factory NotificationItemModel({
    String? uid,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? expiredAt,
  }) = _NotificationItemModel;

  factory NotificationItemModel.fromJson(Map<String, Object?> json)
  => _$NotificationItemModelFromJson(json);
}