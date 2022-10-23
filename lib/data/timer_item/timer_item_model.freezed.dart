// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerItemModel _$TimerItemModelFromJson(Map<String, dynamic> json) {
  return _TimerItemModel.fromJson(json);
}

/// @nodoc
mixin _$TimerItemModel {
  String? get uid => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerItemModelCopyWith<TimerItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerItemModelCopyWith<$Res> {
  factory $TimerItemModelCopyWith(
          TimerItemModel value, $Res Function(TimerItemModel) then) =
      _$TimerItemModelCopyWithImpl<$Res, TimerItemModel>;
  @useResult
  $Res call({String? uid, int? time});
}

/// @nodoc
class _$TimerItemModelCopyWithImpl<$Res, $Val extends TimerItemModel>
    implements $TimerItemModelCopyWith<$Res> {
  _$TimerItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerItemModelCopyWith<$Res>
    implements $TimerItemModelCopyWith<$Res> {
  factory _$$_TimerItemModelCopyWith(
          _$_TimerItemModel value, $Res Function(_$_TimerItemModel) then) =
      __$$_TimerItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? uid, int? time});
}

/// @nodoc
class __$$_TimerItemModelCopyWithImpl<$Res>
    extends _$TimerItemModelCopyWithImpl<$Res, _$_TimerItemModel>
    implements _$$_TimerItemModelCopyWith<$Res> {
  __$$_TimerItemModelCopyWithImpl(
      _$_TimerItemModel _value, $Res Function(_$_TimerItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_TimerItemModel(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerItemModel implements _TimerItemModel {
  const _$_TimerItemModel({this.uid, this.time});

  factory _$_TimerItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimerItemModelFromJson(json);

  @override
  final String? uid;
  @override
  final int? time;

  @override
  String toString() {
    return 'TimerItemModel(uid: $uid, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerItemModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerItemModelCopyWith<_$_TimerItemModel> get copyWith =>
      __$$_TimerItemModelCopyWithImpl<_$_TimerItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerItemModelToJson(
      this,
    );
  }
}

abstract class _TimerItemModel implements TimerItemModel {
  const factory _TimerItemModel({final String? uid, final int? time}) =
      _$_TimerItemModel;

  factory _TimerItemModel.fromJson(Map<String, dynamic> json) =
      _$_TimerItemModel.fromJson;

  @override
  String? get uid;
  @override
  int? get time;
  @override
  @JsonKey(ignore: true)
  _$$_TimerItemModelCopyWith<_$_TimerItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
