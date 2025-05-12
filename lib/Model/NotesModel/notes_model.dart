import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

@freezed
abstract class NotesModel with _$NotesModel {
  factory NotesModel({
    @JsonKey(name: "content") @Default("") String? content,
    @JsonKey(name: "docType") @Default("") String? docType,
  }) = _NotesModel;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);
}
