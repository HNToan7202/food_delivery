import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery/app/feature/profile/data/model/change_avatar_req.dart';
import 'package:food_delivery/app/feature/profile/data/model/change_password_request.dart';
import 'dart:io';

import 'package:food_delivery/app/feature/profile/data/model/update_profile_req.dart';
import 'package:food_delivery/app/feature/profile/domain/repo/user_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../../../core/base_url.dart';
import '../../../../../core/service/api_service_impl.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiServiceImpl service;

  static String BASE_URL = BaseURL.BASE_URL;
  static String BASE_URL2 = BaseURL.BASE_URL2;

  UserRepositoryImpl({required this.service});
  @override
  Future<CommonResponse<Object>> updateProfile(
      {required UpdateProfileReq requestBody}) {
    return service.put<UpdateProfileReq, Object>(
        path: "$BASE_URL/v1/auth/update-profile",
        requestBody: requestBody,
        tFromMap: null);
  }

  @override
  Future<CommonResponse<Object>> changePassword(
      {required ChangePasswordReq requestBody}) {
    return service.put<ChangePasswordReq, Object>(
        path: "$BASE_URL/v1/auth/change-password",
        requestBody: requestBody,
        tFromMap: null);
  }

  @override
  Future<String> updateAvatar({required ChangeAvatarReq requestBody}) async {
    Dio dio = Dio();
    Response response;
    String fileName = requestBody.imageFile.path.split('/').last;
    var data = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(
          requestBody.imageFile.path,
          filename: fileName,
        )
      ]
    });
    final Dio dioX = dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    response = await dioX.put(
      "$BASE_URL/v1/auth/change-avatar",
      data: data,
    );
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return "ok";
    }
    return "error";
  }
}
