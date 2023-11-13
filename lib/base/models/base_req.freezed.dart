// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseReq _$BaseReqFromJson(Map<String, dynamic> json) {
  return _BaseReq.fromJson(json);
}

/// @nodoc
mixin _$BaseReq {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseReqCopyWith<$Res> {
  factory $BaseReqCopyWith(BaseReq value, $Res Function(BaseReq) then) =
      _$BaseReqCopyWithImpl<$Res, BaseReq>;
}

/// @nodoc
class _$BaseReqCopyWithImpl<$Res, $Val extends BaseReq>
    implements $BaseReqCopyWith<$Res> {
  _$BaseReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BaseReqCopyWith<$Res> {
  factory _$$_BaseReqCopyWith(
          _$_BaseReq value, $Res Function(_$_BaseReq) then) =
      __$$_BaseReqCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BaseReqCopyWithImpl<$Res>
    extends _$BaseReqCopyWithImpl<$Res, _$_BaseReq>
    implements _$$_BaseReqCopyWith<$Res> {
  __$$_BaseReqCopyWithImpl(_$_BaseReq _value, $Res Function(_$_BaseReq) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_BaseReq implements _BaseReq {
  const _$_BaseReq();

  factory _$_BaseReq.fromJson(Map<String, dynamic> json) =>
      _$$_BaseReqFromJson(json);

  @override
  String toString() {
    return 'BaseReq()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BaseReq);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseReqToJson(
      this,
    );
  }
}

abstract class _BaseReq implements BaseReq {
  const factory _BaseReq() = _$_BaseReq;

  factory _BaseReq.fromJson(Map<String, dynamic> json) = _$_BaseReq.fromJson;
}
