import 'package:food_delivery/app/feature/reset_password/data/model/verify_otp_request.dart';
import 'package:food_delivery/app/feature/reset_password/data/model/forgot_password_request.dart';
import 'package:food_delivery/app/feature/reset_password/domain/repo/reset_password_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';

import '../../../../../core/service/api_service_impl.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ApiServiceImpl service;

  ResetPasswordRepositoryImpl({required this.service});

  @override
  Future<CommonResponse<Object>> checkOtp({required CheckOtpReq req}) {
    // TODO: implement checkOtp
    throw UnimplementedError();
  }

  @override
  Future<CommonResponse<Object>> forgotPassword(
      {required ForgotPasswordRequest requestBody}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
