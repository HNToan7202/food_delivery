import 'package:food_delivery/core/models/common_request_body.dart';

class SignUpReq extends CommonRequsetBody {
  final String password;
  final String phone;
  final String email;
  final String fullName;

  SignUpReq(
      {required this.password,
      required this.phone,
      required this.email,
      required this.fullName});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'phone': phone,
      'email': email,
      'fullName': fullName,
    };
  }
}
