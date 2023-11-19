import '../../../../../core/models/common_request_body.dart';

class UpdateProfileReq extends CommonRequsetBody {
  final String phone;
  final String email;
  final String fullName;
  final DateTime dateOfBirth;
  final String address;
  final String gender;

  UpdateProfileReq({
    required this.phone,
    required this.email,
    required this.fullName,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
  });

  UpdateProfileReq copyWith({
    String? phone,
    String? email,
    String? fullName,
    DateTime? dateOfBirth,
    String? address,
    String? gender,
  }) =>
      UpdateProfileReq(
        phone: phone ?? this.phone,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        address: address ?? this.address,
        gender: gender ?? this.gender,
      );

  factory UpdateProfileReq.fromJson(Map<String, dynamic> json) =>
      UpdateProfileReq(
        phone: json["phone"],
        email: json["email"],
        fullName: json["fullName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        address: json["address"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "fullName": fullName,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "address": address,
        "gender": gender,
      };

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "phone": phone,
      "email": email,
      "fullName": fullName,
      "dateOfBirth":
          "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
      "address": address,
      "gender": gender,
    };
  }
}
