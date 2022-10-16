// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationItemModel _$NotificationItemModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationItemModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationItemModel {
  String? get uid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get expiredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationItemModelCopyWith<NotificationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationItemModelCopyWith<$Res> {
  factory $NotificationItemModelCopyWith(NotificationItemModel value,
          $Res Function(NotificationItemModel) then) =
      _$NotificationItemModelCopyWithImpl<$Res, NotificationItemModel>;
  @useResult
  $Res call(
      {String? uid,
      String? title,
      String? content,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? expiredAt});
}

/// @nodoc
class _$NotificationItemModelCopyWithImpl<$Res,
        $Val extends NotificationItemModel>
    implements $NotificationItemModelCopyWith<$Res> {
  _$NotificationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationItemModelCopyWith<$Res>
    implements $NotificationItemModelCopyWith<$Res> {
  factory _$$_NotificationItemModelCopyWith(_$_NotificationItemModel value,
          $Res Function(_$_NotificationItemModel) then) =
      __$$_NotificationItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? title,
      String? content,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? expiredAt});
}

/// @nodoc
class __$$_NotificationItemModelCopyWithImpl<$Res>
    extends _$NotificationItemModelCopyWithImpl<$Res, _$_NotificationItemModel>
    implements _$$_NotificationItemModelCopyWith<$Res> {
  __$$_NotificationItemModelCopyWithImpl(_$_NotificationItemModel _value,
      $Res Function(_$_NotificationItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_$_NotificationItemModel(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationItemModel
    with DiagnosticableTreeMixin
    implements _NotificationItemModel {
  const _$_NotificationItemModel(
      {this.uid,
      this.title,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.expiredAt});

  factory _$_NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationItemModelFromJson(json);

  @override
  final String? uid;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? expiredAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationItemModel(uid: $uid, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, expiredAt: $expiredAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationItemModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('expiredAt', expiredAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationItemModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, title, content, createdAt, updatedAt, expiredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationItemModelCopyWith<_$_NotificationItemModel> get copyWith =>
      __$$_NotificationItemModelCopyWithImpl<_$_NotificationItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationItemModelToJson(
      this,
    );
  }
}

abstract class _NotificationItemModel implements NotificationItemModel {
  const factory _NotificationItemModel(
      {final String? uid,
      final String? title,
      final String? content,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? expiredAt}) = _$_NotificationItemModel;

  factory _NotificationItemModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationItemModel.fromJson;

  @override
  String? get uid;
  @override
  String? get title;
  @override
  String? get content;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get expiredAt;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationItemModelCopyWith<_$_NotificationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
