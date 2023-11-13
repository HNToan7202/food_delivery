// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String,
      userName: json['userName'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      avatar: json['avatar'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      address: json['address'] as String,
      gender: json['gender'] as String,
      isActive: json['isActive'] as bool,
      isRegisterShipper: json['isRegisterShipper'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'address': instance.address,
      'gender': instance.gender,
      'isActive': instance.isActive,
      'isRegisterShipper': instance.isRegisterShipper,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
