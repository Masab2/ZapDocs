// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      status: json['Status'] as bool?,
      data: json['data'] == null
          ? null
          : UserDataList.fromJson(json['data'] as Map<String, dynamic>),
      message: json['Success'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'data': instance.data,
      'Success': instance.message,
      'token': instance.token,
    };

_UserDataList _$UserDataListFromJson(Map<String, dynamic> json) =>
    _UserDataList(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      createdDate: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$UserDataListToJson(_UserDataList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'email': instance.email,
      'gender': instance.gender,
      'createdAt': instance.createdDate,
    };
