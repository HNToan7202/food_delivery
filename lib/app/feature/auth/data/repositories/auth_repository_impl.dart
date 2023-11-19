import 'package:food_delivery/app/feature/auth/data/models/user_info_request.dart';
import 'package:food_delivery/app/feature/auth/data/models/user_response.dart';
import '../../../../../core/base_url.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../core/service/api_service_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/logout_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiServiceImpl service;

  static String BASE_URL = BaseURL.BASE_URL;
  static String BASE_URL2 = BaseURL.BASE_URL2;
  AuthRepositoryImpl({
    required this.service,
  });
  @override
  Future<CommonResponse<LoginResponseData>> doLogin({
    required LoginRequest requestBody,
  }) async {
    return service.post<LoginRequest, LoginResponseData>(
        path: "$BASE_URL/v1/auth/login",
        requestBody: requestBody,
        tFromMap: LoginResponseData.fromMap);
  }

  @override
  Future<CommonResponse> doLogout({
    required LogoutRequest requestBody,
  }) async {
    return service.post<LogoutRequest, Object>(
      path: "$BASE_URL/v1/auth/logout",
      requestBody: requestBody,
      tFromMap: null,
    );
  }

  @override
  Future<CommonResponse<UserResponseData>> getUserInfo(
      {required GetUserInfoRequest requestHeader}) async {
    return service.get<GetUserInfoRequest, UserResponseData>(
        path: "$BASE_URL/v1/auth/profile",
        params: requestHeader,
        tFromMap: UserResponseData.fromMap);
  }
}
