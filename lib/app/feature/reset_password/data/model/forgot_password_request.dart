import 'package:food_delivery/core/models/common_request_body.dart';

class ForgotPasswordRequest extends CommonRequsetBody {
  final String email;

  ForgotPasswordRequest({
    required this.email,
  });

  ForgotPasswordRequest copyWith({
    String? email,
  }) =>
      ForgotPasswordRequest(
        email: email ?? this.email,
      );

  @override
  Map<String, dynamic> toMap() => {
        "email": email,
      };

  @override
  String toString() => 'ForgotPasswordRequest(email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForgotPasswordRequest && other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
