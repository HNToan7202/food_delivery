// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../../core/models/common_request_body.dart';

class LoginRequest extends CommonRequsetBody {
  final String username;
  final String password;
  LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'LoginRequest(username: $username, password: $password)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
