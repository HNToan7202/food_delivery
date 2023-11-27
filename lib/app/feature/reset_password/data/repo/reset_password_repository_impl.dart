import 'package:food_delivery/app/feature/reset_password/data/model/reset_password_request.dart';
import 'package:food_delivery/app/feature/reset_password/data/model/verify_otp_request.dart';
import 'package:food_delivery/app/feature/reset_password/data/model/forgot_password_request.dart';
import 'package:food_delivery/app/feature/reset_password/domain/repo/reset_password_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';

import '../../../../../core/base_url.dart';
import '../../../../../core/service/api_service_impl.dart';
import '../model/forgot_passresponse.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ApiServiceImpl service;

  ResetPasswordRepositoryImpl({required this.service});

  static String BASE_URL = BaseURL.BASE_URL;
  static String BASE_URL2 = BaseURL.BASE_URL2;

  @override
  Future<CommonResponse<Object>> checkOtp({required CheckOtpReq req}) {
    // TODO: implement checkOtp
    throw UnimplementedError();
  }

  @override
  Future<CommonResponse<ForgotPasswordReqData>> forgotPassword(
      {required ForgotPasswordRequest requestBody}) {
    return service.post<ForgotPasswordRequest, ForgotPasswordReqData>(
        path: "$BASE_URL/v1/forgot-password",
        requestBody: requestBody,
        tFromMap: ForgotPasswordReqData.fromJson);
  }

  @override
  Future<CommonResponse<Object>> resetPassword(
      {required ResetPasswordRequest req}) {
    return service.put<ResetPasswordRequest, Object>(
      path: "$BASE_URL/v1/reset-password",
      requestBody: req,
      tFromMap: null,
    );
  }
}
