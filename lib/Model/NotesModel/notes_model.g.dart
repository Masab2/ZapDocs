// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => _NotesModel(
      content: json['content'] as String? ?? "",
      docType: json['docType'] as String? ?? "",
    );

Map<String, dynamic> _$NotesModelToJson(_NotesModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'docType': instance.docType,
    };
