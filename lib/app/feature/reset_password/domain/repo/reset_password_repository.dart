import '../../../../../core/models/common_response.dart';
import '../../data/model/forgot_passresponse.dart';
import '../../data/model/forgot_password_request.dart';
import '../../data/model/reset_password_request.dart';
import '../../data/model/verify_otp_request.dart';

abstract class ResetPasswordRepository {
  Future<CommonResponse<ForgotPasswordReqData>> forgotPassword({
    required ForgotPasswordRequest requestBody,
  });

  Future<CommonResponse> checkOtp({required CheckOtpReq req});

  Future<CommonResponse> resetPassword({required ResetPasswordRequest req});
}
