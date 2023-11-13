import 'package:food_delivery/app/feature/auth/data/models/user_info_request.dart';
import 'package:food_delivery/app/feature/auth/data/models/user_response.dart';
import 'package:food_delivery/app/feature/auth/domain/entities/user_entities.dart';

import '../../../../../core/models/common_response.dart';
import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/models/logout_request.dart';

abstract class AuthRepository {
  Future<CommonResponse<LoginResponseData>> doLogin({
    required LoginRequest requestBody,
  });

  Future<CommonResponse> doLogout({
    required LogoutRequest requestBody,
  });

  Future<CommonResponse<UserResponseData>> getUserInfo({
    required GetUserInfoRequest requestHeader,
  });
}
