import '../../../../../core/models/common_request_body.dart';

class CheckOtpReq extends CommonRequsetBody {
  final String email;
  final String otp;

  CheckOtpReq({required this.email, required this.otp});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
    };
  }

  @override
  String toString() => 'CheckOtpReq(email: $email, otp: $otp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CheckOtpReq && other.email == email && other.otp == otp;
  }

  @override
  int get hashCode => email.hashCode ^ otp.hashCode;
}
