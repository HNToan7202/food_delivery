import 'package:food_delivery/app/feature/profile/data/model/update_profile_req.dart';
import 'package:food_delivery/app/feature/profile/domain/repo/user_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';
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
}
