import 'package:freezed_annotation/freezed_annotation.dart';

part 'success_model.freezed.dart';
part 'success_model.g.dart';

@freezed
abstract class SuccessModel with _$SuccessModel {
  factory SuccessModel({
    @JsonKey(name: "message") String? message,
  }) = _SuccessModel;

  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessModelFromJson(json);
}