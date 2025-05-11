// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'success_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuccessModel {
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessModelCopyWith<SuccessModel> get copyWith =>
      _$SuccessModelCopyWithImpl<SuccessModel>(
          this as SuccessModel, _$identity);

  /// Serializes this SuccessModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SuccessModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SuccessModelCopyWith<$Res> {
  factory $SuccessModelCopyWith(
          SuccessModel value, $Res Function(SuccessModel) _then) =
      _$SuccessModelCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: "message") String? message});
}

/// @nodoc
class _$SuccessModelCopyWithImpl<$Res> implements $SuccessModelCopyWith<$Res> {
  _$SuccessModelCopyWithImpl(this._self, this._then);

  final SuccessModel _self;
  final $Res Function(SuccessModel) _then;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuccessModel implements SuccessModel {
  _SuccessModel({@JsonKey(name: "message") this.message});
  factory _SuccessModel.fromJson(Map<String, dynamic> json) =>
      _$SuccessModelFromJson(json);

  @override
  @JsonKey(name: "message")
  final String? message;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessModelCopyWith<_SuccessModel> get copyWith =>
      __$SuccessModelCopyWithImpl<_SuccessModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuccessModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuccessModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SuccessModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessModelCopyWith<$Res>
    implements $SuccessModelCopyWith<$Res> {
  factory _$SuccessModelCopyWith(
          _SuccessModel value, $Res Function(_SuccessModel) _then) =
      __$SuccessModelCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: "message") String? message});
}

/// @nodoc
class __$SuccessModelCopyWithImpl<$Res>
    implements _$SuccessModelCopyWith<$Res> {
  __$SuccessModelCopyWithImpl(this._self, this._then);

  final _SuccessModel _self;
  final $Res Function(_SuccessModel) _then;

  /// Create a copy of SuccessModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SuccessModel(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
