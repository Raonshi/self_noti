// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationItemModel _$$_NotificationItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationItemModel(
      uid: json['uid'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      expiredAt: json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String),
    );

Map<String, dynamic> _$$_NotificationItemModelToJson(
        _$_NotificationItemModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'expiredAt': instance.expiredAt?.toIso8601String(),
    };
