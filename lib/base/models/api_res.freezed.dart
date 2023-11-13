// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtimeType']) {
    case 'success':
      return SuccessRes<T>.fromJson(json, fromJsonT);
    case 'error':
      return ErrorRes<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ApiResponse<T> {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status, int code, String message, int time, T data)
        success,
    required TResult Function(String status, int code, String message, int time)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status, int code, String message, int time, T data)?
        success,
    TResult? Function(String status, int code, String message, int time)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int code, String message, int time, T data)?
        success,
    TResult Function(String status, int code, String message, int time)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRes<T> value) success,
    required TResult Function(ErrorRes<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessRes<T> value)? success,
    TResult? Function(ErrorRes<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRes<T> value)? success,
    TResult Function(ErrorRes<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({String status, int code, String message, int time});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessResCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$SuccessResCopyWith(
          _$SuccessRes<T> value, $Res Function(_$SuccessRes<T>) then) =
      __$$SuccessResCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, int time, T data});
}

/// @nodoc
class __$$SuccessResCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$SuccessRes<T>>
    implements _$$SuccessResCopyWith<T, $Res> {
  __$$SuccessResCopyWithImpl(
      _$SuccessRes<T> _value, $Res Function(_$SuccessRes<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? time = null,
    Object? data = freezed,
  }) {
    return _then(_$SuccessRes<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SuccessRes<T> implements SuccessRes<T> {
  const _$SuccessRes(
      {required this.status,
      required this.code,
      required this.message,
      required this.time,
      required this.data,
      final String? $type})
      : $type = $type ?? 'success';

  factory _$SuccessRes.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessResFromJson(json, fromJsonT);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int time;
  @override
  final T data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.success(status: $status, code: $code, message: $message, time: $time, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessRes<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, time,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessResCopyWith<T, _$SuccessRes<T>> get copyWith =>
      __$$SuccessResCopyWithImpl<T, _$SuccessRes<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status, int code, String message, int time, T data)
        success,
    required TResult Function(String status, int code, String message, int time)
        error,
  }) {
    return success(status, code, message, time, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status, int code, String message, int time, T data)?
        success,
    TResult? Function(String status, int code, String message, int time)? error,
  }) {
    return success?.call(status, code, message, time, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int code, String message, int time, T data)?
        success,
    TResult Function(String status, int code, String message, int time)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(status, code, message, time, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRes<T> value) success,
    required TResult Function(ErrorRes<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessRes<T> value)? success,
    TResult? Function(ErrorRes<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRes<T> value)? success,
    TResult Function(ErrorRes<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessResToJson<T>(this, toJsonT);
  }
}

abstract class SuccessRes<T> implements ApiResponse<T> {
  const factory SuccessRes(
      {required final String status,
      required final int code,
      required final String message,
      required final int time,
      required final T data}) = _$SuccessRes<T>;

  factory SuccessRes.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessRes<T>.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int get time;
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$SuccessResCopyWith<T, _$SuccessRes<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorResCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ErrorResCopyWith(
          _$ErrorRes<T> value, $Res Function(_$ErrorRes<T>) then) =
      __$$ErrorResCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, int time});
}

/// @nodoc
class __$$ErrorResCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ErrorRes<T>>
    implements _$$ErrorResCopyWith<T, $Res> {
  __$$ErrorResCopyWithImpl(
      _$ErrorRes<T> _value, $Res Function(_$ErrorRes<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? time = null,
  }) {
    return _then(_$ErrorRes<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ErrorRes<T> implements ErrorRes<T> {
  const _$ErrorRes(
      {required this.status,
      required this.code,
      required this.message,
      required this.time,
      final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorRes.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ErrorResFromJson(json, fromJsonT);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int time;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiResponse<$T>.error(status: $status, code: $code, message: $message, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorRes<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResCopyWith<T, _$ErrorRes<T>> get copyWith =>
      __$$ErrorResCopyWithImpl<T, _$ErrorRes<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status, int code, String message, int time, T data)
        success,
    required TResult Function(String status, int code, String message, int time)
        error,
  }) {
    return error(status, code, message, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status, int code, String message, int time, T data)?
        success,
    TResult? Function(String status, int code, String message, int time)? error,
  }) {
    return error?.call(status, code, message, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String status, int code, String message, int time, T data)?
        success,
    TResult Function(String status, int code, String message, int time)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(status, code, message, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessRes<T> value) success,
    required TResult Function(ErrorRes<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessRes<T> value)? success,
    TResult? Function(ErrorRes<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessRes<T> value)? success,
    TResult Function(ErrorRes<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ErrorResToJson<T>(this, toJsonT);
  }
}

abstract class ErrorRes<T> implements ApiResponse<T> {
  const factory ErrorRes(
      {required final String status,
      required final int code,
      required final String message,
      required final int time}) = _$ErrorRes<T>;

  factory ErrorRes.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ErrorRes<T>.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$$ErrorResCopyWith<T, _$ErrorRes<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
