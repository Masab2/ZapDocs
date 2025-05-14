// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetAllNotesModel _$GetAllNotesModelFromJson(Map<String, dynamic> json) =>
    _GetAllNotesModel(
      data: (json['notes'] as List<dynamic>?)
          ?.map((e) => NotesDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllNotesModelToJson(_GetAllNotesModel instance) =>
    <String, dynamic>{
      'notes': instance.data,
    };

_NotesDataList _$NotesDataListFromJson(Map<String, dynamic> json) =>
    _NotesDataList(
      id: json['_id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      userId: json['user'] as String? ?? "",
      docType: json['documentType'] as String? ?? "",
      docUrl: json['documentUrl'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );

Map<String, dynamic> _$NotesDataListToJson(_NotesDataList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'user': instance.userId,
      'documentType': instance.docType,
      'documentUrl': instance.docUrl,
      'date': instance.date,
    };
