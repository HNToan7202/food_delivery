import 'package:food_delivery/app/feature/sign_up/data/model/sign_up_req.dart';
import 'package:food_delivery/app/feature/sign_up/data/model/verify_account_req.dart';
import 'package:food_delivery/app/feature/sign_up/domain/repo/account_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';
import 'package:food_delivery/core/service/api_service.dart';

import '../../../../../core/base_url.dart';

class AccountRepoSitoryImpl implements AccountRepository {
  final ApiService service;

  static String BASE_URL = BaseURL.BASE_URL;
  static String BASE_URL2 = BaseURL.BASE_URL2;

  AccountRepoSitoryImpl({required this.service});

  @override
  Future<CommonResponse> createAccount({required SignUpReq req}) {
    return service.post<SignUpReq, Object>(
      path: "$BASE_URL/v1/auth/signup-account",
      requestBody: req,
      tFromMap: null,
    );
  }

  @override
  Future<CommonResponse<Object>> verifyAccount(
      {required VerifyAccountReq req}) {
    return service.post<VerifyAccountReq, Object>(
      path: "$BASE_URL/v1/auth/verify-account",
      requestBody: req,
      tFromMap: null,
    );
  }
}
