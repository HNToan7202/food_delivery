// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entities.freezed.dart';
part 'user_entities.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity(
      {required String id,
      required String userName,
      required String phone,
      required String email,
      required String fullName,
      required String avatar,
      required DateTime dateOfBirth,
      required String address,
      required String gender,
      required bool isActive,
      required bool isRegisterShipper,
      required DateTime createdAt,
      required DateTime updatedAt}) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
