import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_item_model.freezed.dart';
part 'timer_item_model.g.dart';

@freezed
class TimerItemModel with _$TimerItemModel {
  const factory TimerItemModel({
    String? uid,
    int? time,
  }) = _TimerItemModel;

  factory TimerItemModel.fromJson(Map<String, Object?> json) => _$TimerItemModelFromJson(json);
}
