import 'dart:convert';

import 'package:food_delivery/core/models/common_response.dart';

class UserResponse<UserResponseData> extends SuccessRessponse {
  UserResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});
  @override
  factory UserResponse.fromMap(
    Map<String, dynamic> map, {
    required UserResponseData Function(Map<String, dynamic> map)? tFromJson,
  }) {
    return UserResponse<UserResponseData>(
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

class UserResponseData {
  final String id;
  final String userName;
  final String phone;
  final String email;
  final String fullName;
  final String avatar;
  final DateTime dateOfBirth;
  final String address;
  final String gender;
  final bool isActive;
  final bool isRegisterShipper;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserResponseData({
    required this.id,
    required this.userName,
    required this.phone,
    required this.email,
    required this.fullName,
    required this.avatar,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.isActive,
    required this.isRegisterShipper,
    required this.createdAt,
    required this.updatedAt,
  });

  UserResponseData copyWith({
    String? id,
    String? userName,
    String? phone,
    String? email,
    String? fullName,
    String? avatar,
    DateTime? dateOfBirth,
    String? address,
    String? gender,
    bool? isActive,
    bool? isRegisterShipper,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserResponseData(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        avatar: avatar ?? this.avatar,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        isActive: isActive ?? this.isActive,
        isRegisterShipper: isRegisterShipper ?? this.isRegisterShipper,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      UserResponseData(
        id: json["id"],
        userName: json["userName"],
        phone: json["phone"],
        email: json["email"],
        fullName: json["fullName"],
        avatar: json["avatar"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        address: json["address"],
        gender: json["gender"],
        isActive: json["isActive"],
        isRegisterShipper: json["isRegisterShipper"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  @override
  String toString() {
    return 'UserResponse{id: $id, userName: $userName, phone: $phone, email: $email, '
        'fullName: $fullName, avatar: $avatar, dateOfBirth: $dateOfBirth, '
        'address: $address, gender: $gender, isActive: $isActive, '
        'isRegisterShipper: $isRegisterShipper, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  factory UserResponseData.fromMap(Map<String, dynamic> map) {
    return UserResponseData(
      id: map["id"],
      userName: map["userName"],
      phone: map["phone"],
      email: map["email"],
      fullName: map["fullName"],
      avatar: map["avatar"],
      dateOfBirth: DateTime.parse(map["dateOfBirth"]),
      address: map["address"],
      gender: map["gender"],
      isActive: map["isActive"],
      isRegisterShipper: map["isRegisterShipper"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
    );
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        fullName.hashCode ^
        avatar.hashCode ^
        dateOfBirth.hashCode ^
        address.hashCode ^
        gender.hashCode ^
        isActive.hashCode ^
        isRegisterShipper.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  bool operator ==(covariant UserResponseData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.phone == phone &&
        other.email == email &&
        other.fullName == fullName &&
        other.avatar == avatar &&
        other.dateOfBirth == dateOfBirth &&
        other.address == address &&
        other.gender == gender &&
        other.isActive == isActive &&
        other.isRegisterShipper == isRegisterShipper &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }
}
