// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_body.freezed.dart';
part 'login_body.g.dart';

@freezed
class LoginBody with _$LoginBody {
  const factory LoginBody({
    required String username,
    required String password,
  }) = _LoginBody;

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      _$LoginBodyFromJson(json);
}
