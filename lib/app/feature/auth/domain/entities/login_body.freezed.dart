// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) {
  return _LoginBody.fromJson(json);
}

/// @nodoc
mixin _$LoginBody {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginBodyCopyWith<LoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginBodyCopyWith<$Res> {
  factory $LoginBodyCopyWith(LoginBody value, $Res Function(LoginBody) then) =
      _$LoginBodyCopyWithImpl<$Res, LoginBody>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginBodyCopyWithImpl<$Res, $Val extends LoginBody>
    implements $LoginBodyCopyWith<$Res> {
  _$LoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginBodyCopyWith<$Res> implements $LoginBodyCopyWith<$Res> {
  factory _$$_LoginBodyCopyWith(
          _$_LoginBody value, $Res Function(_$_LoginBody) then) =
      __$$_LoginBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginBodyCopyWithImpl<$Res>
    extends _$LoginBodyCopyWithImpl<$Res, _$_LoginBody>
    implements _$$_LoginBodyCopyWith<$Res> {
  __$$_LoginBodyCopyWithImpl(
      _$_LoginBody _value, $Res Function(_$_LoginBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginBody(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginBody implements _LoginBody {
  const _$_LoginBody({required this.username, required this.password});

  factory _$_LoginBody.fromJson(Map<String, dynamic> json) =>
      _$$_LoginBodyFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginBody(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginBody &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginBodyCopyWith<_$_LoginBody> get copyWith =>
      __$$_LoginBodyCopyWithImpl<_$_LoginBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginBodyToJson(
      this,
    );
  }
}

abstract class _LoginBody implements LoginBody {
  const factory _LoginBody(
      {required final String username,
      required final String password}) = _$_LoginBody;

  factory _LoginBody.fromJson(Map<String, dynamic> json) =
      _$_LoginBody.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginBodyCopyWith<_$_LoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}
