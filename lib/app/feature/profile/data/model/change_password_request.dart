import '../../../../../core/models/common_request_body.dart';

class ChangePasswordReq extends CommonRequsetBody {
  final String oldPassword;
  final String newPassword;

  ChangePasswordReq({
    required this.oldPassword,
    required this.newPassword,
  });

  ChangePasswordReq copyWith({
    String? oldPassword,
    String? newPassword,
  }) =>
      ChangePasswordReq(
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  factory ChangePasswordReq.fromJson(Map<String, dynamic> json) =>
      ChangePasswordReq(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}
