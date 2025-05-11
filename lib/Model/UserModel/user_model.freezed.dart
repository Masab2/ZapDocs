// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'Status')
  bool? get status;
  @JsonKey(name: 'data')
  UserDataList? get data;
  @JsonKey(name: 'Success')
  String? get message;
  @JsonKey(name: 'token')
  String? get token;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data, message, token);

  @override
  String toString() {
    return 'UserModel(status: $status, data: $data, message: $message, token: $token)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Status') bool? status,
      @JsonKey(name: 'data') UserDataList? data,
      @JsonKey(name: 'Success') String? message,
      @JsonKey(name: 'token') String? token});

  $UserDataListCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
    Object? token = freezed,
  }) {
    return _then(_self.copyWith(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataList?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataListCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $UserDataListCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {@JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'Success') this.message,
      @JsonKey(name: 'token') this.token});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  @JsonKey(name: 'Status')
  final bool? status;
  @override
  @JsonKey(name: 'data')
  final UserDataList? data;
  @override
  @JsonKey(name: 'Success')
  final String? message;
  @override
  @JsonKey(name: 'token')
  final String? token;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data, message, token);

  @override
  String toString() {
    return 'UserModel(status: $status, data: $data, message: $message, token: $token)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Status') bool? status,
      @JsonKey(name: 'data') UserDataList? data,
      @JsonKey(name: 'Success') String? message,
      @JsonKey(name: 'token') String? token});

  @override
  $UserDataListCopyWith<$Res>? get data;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
    Object? message = freezed,
    Object? token = freezed,
  }) {
    return _then(_UserModel(
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataList?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataListCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $UserDataListCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$UserDataList {
  @JsonKey(name: '_id')
  String get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'role')
  String get role;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'gender')
  String get gender;
  @JsonKey(name: 'createdAt')
  String get createdDate;

  /// Create a copy of UserDataList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDataListCopyWith<UserDataList> get copyWith =>
      _$UserDataListCopyWithImpl<UserDataList>(
          this as UserDataList, _$identity);

  /// Serializes this UserDataList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDataList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, email, gender, createdDate);

  @override
  String toString() {
    return 'UserDataList(id: $id, name: $name, role: $role, email: $email, gender: $gender, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $UserDataListCopyWith<$Res> {
  factory $UserDataListCopyWith(
          UserDataList value, $Res Function(UserDataList) _then) =
      _$UserDataListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'createdAt') String createdDate});
}

/// @nodoc
class _$UserDataListCopyWithImpl<$Res> implements $UserDataListCopyWith<$Res> {
  _$UserDataListCopyWithImpl(this._self, this._then);

  final UserDataList _self;
  final $Res Function(UserDataList) _then;

  /// Create a copy of UserDataList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? email = null,
    Object? gender = null,
    Object? createdDate = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDataList implements UserDataList {
  const _UserDataList(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'role') this.role = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'gender') this.gender = '',
      @JsonKey(name: 'createdAt') this.createdDate = ''});
  factory _UserDataList.fromJson(Map<String, dynamic> json) =>
      _$UserDataListFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'role')
  final String role;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'gender')
  final String gender;
  @override
  @JsonKey(name: 'createdAt')
  final String createdDate;

  /// Create a copy of UserDataList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDataListCopyWith<_UserDataList> get copyWith =>
      __$UserDataListCopyWithImpl<_UserDataList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDataListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDataList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, role, email, gender, createdDate);

  @override
  String toString() {
    return 'UserDataList(id: $id, name: $name, role: $role, email: $email, gender: $gender, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$UserDataListCopyWith<$Res>
    implements $UserDataListCopyWith<$Res> {
  factory _$UserDataListCopyWith(
          _UserDataList value, $Res Function(_UserDataList) _then) =
      __$UserDataListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'role') String role,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'createdAt') String createdDate});
}

/// @nodoc
class __$UserDataListCopyWithImpl<$Res>
    implements _$UserDataListCopyWith<$Res> {
  __$UserDataListCopyWithImpl(this._self, this._then);

  final _UserDataList _self;
  final $Res Function(_UserDataList) _then;

  /// Create a copy of UserDataList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? email = null,
    Object? gender = null,
    Object? createdDate = null,
  }) {
    return _then(_UserDataList(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
