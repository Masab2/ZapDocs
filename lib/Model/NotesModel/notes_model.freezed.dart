// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotesModel {
  @JsonKey(name: "content")
  String? get content;
  @JsonKey(name: "docType")
  String? get docType;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotesModelCopyWith<NotesModel> get copyWith =>
      _$NotesModelCopyWithImpl<NotesModel>(this as NotesModel, _$identity);

  /// Serializes this NotesModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotesModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.docType, docType) || other.docType == docType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, docType);

  @override
  String toString() {
    return 'NotesModel(content: $content, docType: $docType)';
  }
}

/// @nodoc
abstract mixin class $NotesModelCopyWith<$Res> {
  factory $NotesModelCopyWith(
          NotesModel value, $Res Function(NotesModel) _then) =
      _$NotesModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "docType") String? docType});
}

/// @nodoc
class _$NotesModelCopyWithImpl<$Res> implements $NotesModelCopyWith<$Res> {
  _$NotesModelCopyWithImpl(this._self, this._then);

  final NotesModel _self;
  final $Res Function(NotesModel) _then;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? docType = freezed,
  }) {
    return _then(_self.copyWith(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      docType: freezed == docType
          ? _self.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotesModel implements NotesModel {
  _NotesModel(
      {@JsonKey(name: "content") this.content = "",
      @JsonKey(name: "docType") this.docType = ""});
  factory _NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  @override
  @JsonKey(name: "content")
  final String? content;
  @override
  @JsonKey(name: "docType")
  final String? docType;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotesModelCopyWith<_NotesModel> get copyWith =>
      __$NotesModelCopyWithImpl<_NotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotesModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotesModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.docType, docType) || other.docType == docType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, docType);

  @override
  String toString() {
    return 'NotesModel(content: $content, docType: $docType)';
  }
}

/// @nodoc
abstract mixin class _$NotesModelCopyWith<$Res>
    implements $NotesModelCopyWith<$Res> {
  factory _$NotesModelCopyWith(
          _NotesModel value, $Res Function(_NotesModel) _then) =
      __$NotesModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "content") String? content,
      @JsonKey(name: "docType") String? docType});
}

/// @nodoc
class __$NotesModelCopyWithImpl<$Res> implements _$NotesModelCopyWith<$Res> {
  __$NotesModelCopyWithImpl(this._self, this._then);

  final _NotesModel _self;
  final $Res Function(_NotesModel) _then;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? content = freezed,
    Object? docType = freezed,
  }) {
    return _then(_NotesModel(
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      docType: freezed == docType
          ? _self.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
