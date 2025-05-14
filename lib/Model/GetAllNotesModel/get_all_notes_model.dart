import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_notes_model.freezed.dart';
part 'get_all_notes_model.g.dart';

@freezed
abstract class GetAllNotesModel with _$GetAllNotesModel {
  factory GetAllNotesModel({
    @JsonKey(name: "notes") List<NotesDataList>? data,
  }) = _GetAllNotesModel;

  factory GetAllNotesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotesModelFromJson(json);
}

@freezed
abstract class NotesDataList with _$NotesDataList {
  factory NotesDataList({
    @JsonKey(name: "_id") @Default("") String id,
    @JsonKey(name: "title") @Default("") String title,
    @JsonKey(name: "content") @Default("") String content,
    @JsonKey(name: "user") @Default("") String userId,
    @JsonKey(name: "documentType") @Default("") String docType,
    @JsonKey(name: "documentUrl") @Default("") String docUrl,
    @JsonKey(name: "date") @Default("") String date,
  }) = _NotesDataList;

  factory NotesDataList.fromJson(Map<String, dynamic> json) =>
      _$NotesDataListFromJson(json);
}
