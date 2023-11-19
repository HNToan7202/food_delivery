import 'package:food_delivery/core/models/common_request_body.dart';

class VerifyAccountReq extends CommonRequsetBody {
  String email;
  String otp;

  VerifyAccountReq({required this.email, required this.otp});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
    };
  }
}
