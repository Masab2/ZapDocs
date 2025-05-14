// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetAllNotesModel {
  @JsonKey(name: "notes")
  List<NotesDataList>? get data;

  /// Create a copy of GetAllNotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetAllNotesModelCopyWith<GetAllNotesModel> get copyWith =>
      _$GetAllNotesModelCopyWithImpl<GetAllNotesModel>(
          this as GetAllNotesModel, _$identity);

  /// Serializes this GetAllNotesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetAllNotesModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'GetAllNotesModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $GetAllNotesModelCopyWith<$Res> {
  factory $GetAllNotesModelCopyWith(
          GetAllNotesModel value, $Res Function(GetAllNotesModel) _then) =
      _$GetAllNotesModelCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: "notes") List<NotesDataList>? data});
}

/// @nodoc
class _$GetAllNotesModelCopyWithImpl<$Res>
    implements $GetAllNotesModelCopyWith<$Res> {
  _$GetAllNotesModelCopyWithImpl(this._self, this._then);

  final GetAllNotesModel _self;
  final $Res Function(GetAllNotesModel) _then;

  /// Create a copy of GetAllNotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotesDataList>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GetAllNotesModel implements GetAllNotesModel {
  _GetAllNotesModel({@JsonKey(name: "notes") final List<NotesDataList>? data})
      : _data = data;
  factory _GetAllNotesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllNotesModelFromJson(json);

  final List<NotesDataList>? _data;
  @override
  @JsonKey(name: "notes")
  List<NotesDataList>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of GetAllNotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetAllNotesModelCopyWith<_GetAllNotesModel> get copyWith =>
      __$GetAllNotesModelCopyWithImpl<_GetAllNotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetAllNotesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetAllNotesModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'GetAllNotesModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$GetAllNotesModelCopyWith<$Res>
    implements $GetAllNotesModelCopyWith<$Res> {
  factory _$GetAllNotesModelCopyWith(
          _GetAllNotesModel value, $Res Function(_GetAllNotesModel) _then) =
      __$GetAllNotesModelCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: "notes") List<NotesDataList>? data});
}

/// @nodoc
class __$GetAllNotesModelCopyWithImpl<$Res>
    implements _$GetAllNotesModelCopyWith<$Res> {
  __$GetAllNotesModelCopyWithImpl(this._self, this._then);

  final _GetAllNotesModel _self;
  final $Res Function(_GetAllNotesModel) _then;

  /// Create a copy of GetAllNotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_GetAllNotesModel(
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotesDataList>?,
    ));
  }
}

/// @nodoc
mixin _$NotesDataList {
  @JsonKey(name: "_id")
  String get id;
  @JsonKey(name: "title")
  String get title;
  @JsonKey(name: "content")
  String get content;
  @JsonKey(name: "user")
  String get userId;
  @JsonKey(name: "documentType")
  String get docType;
  @JsonKey(name: "documentUrl")
  String get docUrl;
  @JsonKey(name: "date")
  String get date;

  /// Create a copy of NotesDataList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotesDataListCopyWith<NotesDataList> get copyWith =>
      _$NotesDataListCopyWithImpl<NotesDataList>(
          this as NotesDataList, _$identity);

  /// Serializes this NotesDataList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotesDataList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docType, docType) || other.docType == docType) &&
            (identical(other.docUrl, docUrl) || other.docUrl == docUrl) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, userId, docType, docUrl, date);

  @override
  String toString() {
    return 'NotesDataList(id: $id, title: $title, content: $content, userId: $userId, docType: $docType, docUrl: $docUrl, date: $date)';
  }
}

/// @nodoc
abstract mixin class $NotesDataListCopyWith<$Res> {
  factory $NotesDataListCopyWith(
          NotesDataList value, $Res Function(NotesDataList) _then) =
      _$NotesDataListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "user") String userId,
      @JsonKey(name: "documentType") String docType,
      @JsonKey(name: "documentUrl") String docUrl,
      @JsonKey(name: "date") String date});
}

/// @nodoc
class _$NotesDataListCopyWithImpl<$Res>
    implements $NotesDataListCopyWith<$Res> {
  _$NotesDataListCopyWithImpl(this._self, this._then);

  final NotesDataList _self;
  final $Res Function(NotesDataList) _then;

  /// Create a copy of NotesDataList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? userId = null,
    Object? docType = null,
    Object? docUrl = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docType: null == docType
          ? _self.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String,
      docUrl: null == docUrl
          ? _self.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotesDataList implements NotesDataList {
  _NotesDataList(
      {@JsonKey(name: "_id") this.id = "",
      @JsonKey(name: "title") this.title = "",
      @JsonKey(name: "content") this.content = "",
      @JsonKey(name: "user") this.userId = "",
      @JsonKey(name: "documentType") this.docType = "",
      @JsonKey(name: "documentUrl") this.docUrl = "",
      @JsonKey(name: "date") this.date = ""});
  factory _NotesDataList.fromJson(Map<String, dynamic> json) =>
      _$NotesDataListFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "content")
  final String content;
  @override
  @JsonKey(name: "user")
  final String userId;
  @override
  @JsonKey(name: "documentType")
  final String docType;
  @override
  @JsonKey(name: "documentUrl")
  final String docUrl;
  @override
  @JsonKey(name: "date")
  final String date;

  /// Create a copy of NotesDataList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotesDataListCopyWith<_NotesDataList> get copyWith =>
      __$NotesDataListCopyWithImpl<_NotesDataList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotesDataListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotesDataList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docType, docType) || other.docType == docType) &&
            (identical(other.docUrl, docUrl) || other.docUrl == docUrl) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, userId, docType, docUrl, date);

  @override
  String toString() {
    return 'NotesDataList(id: $id, title: $title, content: $content, userId: $userId, docType: $docType, docUrl: $docUrl, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$NotesDataListCopyWith<$Res>
    implements $NotesDataListCopyWith<$Res> {
  factory _$NotesDataListCopyWith(
          _NotesDataList value, $Res Function(_NotesDataList) _then) =
      __$NotesDataListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "content") String content,
      @JsonKey(name: "user") String userId,
      @JsonKey(name: "documentType") String docType,
      @JsonKey(name: "documentUrl") String docUrl,
      @JsonKey(name: "date") String date});
}

/// @nodoc
class __$NotesDataListCopyWithImpl<$Res>
    implements _$NotesDataListCopyWith<$Res> {
  __$NotesDataListCopyWithImpl(this._self, this._then);

  final _NotesDataList _self;
  final $Res Function(_NotesDataList) _then;

  /// Create a copy of NotesDataList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? userId = null,
    Object? docType = null,
    Object? docUrl = null,
    Object? date = null,
  }) {
    return _then(_NotesDataList(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docType: null == docType
          ? _self.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String,
      docUrl: null == docUrl
          ? _self.docUrl
          : docUrl // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
