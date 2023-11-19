import 'package:bloc/bloc.dart';
import 'package:food_delivery/app/feature/reset_password/data/repo/reset_password_repository_impl.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../data/model/forgot_password_request.dart';
import '../../data/model/verify_otp_request.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void forgotPassword(ForgotPasswordRequest request) async {
    final res = await locator
        .get<ResetPasswordRepositoryImpl>()
        .forgotPassword(requestBody: request);
    // if (res is SuccessRessponse) {
    //   emit(AuthForgotPasswordState(email: request.email));
    // } else {
    //   emit(AuthForgotErrorState(
    //       message: res.message ?? "Error forgot password"));
    // }
  }

  void checkOtp(String otp) {
    if (state is AuthForgotPasswordState) {
      final req = CheckOtpReq(
          email: (state as AuthForgotPasswordState).email, otp: otp);
      final res = locator.get<ResetPasswordRepositoryImpl>().checkOtp(req: req);
      if (res is SuccessRessponse) {
        // emit(AuthCheckOtpSuccess(
        //     otp: otp, email: (state as AuthForgotPasswordState).email));
      }
    }
  }
}
