import '../../../../../core/models/common_response.dart';
import '../../data/model/forgot_password_request.dart';
import '../../data/model/verify_otp_request.dart';

abstract class ResetPasswordRepository {
  Future<CommonResponse> forgotPassword({
    required ForgotPasswordRequest requestBody,
  });

  Future<CommonResponse> checkOtp({required CheckOtpReq req});
}
