import 'dart:convert';

import 'package:food_delivery/core/models/common_response.dart';

class ForgotPasswordReq extends SuccessRessponse {
  ForgotPasswordReq(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});
  @override
  factory ForgotPasswordReq.fromMap(
    Map<String, dynamic> map, {
    required ForgotPasswordReqData Function(Map<String, dynamic> map)?
        tFromJson,
  }) {
    return ForgotPasswordReq(
      time: map['time'],
      status: map['status'],
      message: map['message'],
      code: map['code'],
      data: map['data'] == null
          ? null
          : tFromJson?.call(jsonDecode(jsonEncode(map['data']))),
    );
  }
}

class ForgotPasswordReqData {
  final String? otp;
  final String? email;

  ForgotPasswordReqData({
    this.otp,
    this.email,
  });

  ForgotPasswordReqData copyWith({
    String? otp,
    String? email,
  }) =>
      ForgotPasswordReqData(
        otp: otp ?? this.otp,
        email: email ?? this.email,
      );

  factory ForgotPasswordReqData.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordReqData(
        otp: json["otp"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "email": email,
      };
}
