// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../../core/models/common_response.dart';



class LoginResponse<LoginResponseData> extends SuccessRessponse {
  LoginResponse({
    required super.time,
    required super.data,
    required super.code,
    required super.message,
    required super.status,
  });

  @override
  factory LoginResponse.fromMap(
    Map<String, dynamic> map, {
    required LoginResponseData Function(Map<String, dynamic> map)? tFromJson,
  }) {
    return LoginResponse<LoginResponseData>(
      time: map['time'],
      status: map['status'],
      message: map['message'],
      code: map['code'],
      data: map['data'] == null
          ? null
          : tFromJson?.call(jsonDecode(jsonEncode(map['data']))),
    );
  }

  @override
  String toString() {
    return 'LoginResponse(status: $status, message: $message, code: $code, time: $time, data: $data)';
  }
}

class LoginResponseData {
  final String accessToken;
  final String refreshToken;
  LoginResponseData({
    required this.accessToken,
    required this.refreshToken,
  });

  LoginResponseData copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return LoginResponseData(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  static LoginResponseData fromMap(Map<String, dynamic> map) {
    return LoginResponseData(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  @override
  String toString() =>
      'LoginResponseData(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant LoginResponseData other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
