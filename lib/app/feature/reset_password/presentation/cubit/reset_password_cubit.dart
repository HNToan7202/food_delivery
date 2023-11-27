import 'package:bloc/bloc.dart';
import 'package:food_delivery/app/feature/reset_password/data/repo/reset_password_repository_impl.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../data/model/forgot_password_request.dart';
import '../../data/model/reset_password_request.dart';
import '../../data/model/verify_otp_request.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void forgotPassword(ForgotPasswordRequest request) async {
    final res = await locator
        .get<ResetPasswordRepositoryImpl>()
        .forgotPassword(requestBody: request);
    if (res is SuccessRessponse) {
      emit(AuthedMailSuccess(
        email: res.data?.email ?? "",
        otp: res.data?.otp ?? "",
      ));
    } else {
      emit(ResetPasswordError(message: res.message));
    }
  }

  void checkOtp(String otp) {
    if (state is AuthedMailSuccess) {
      if (otp == (state as AuthedMailSuccess).otp) {
        emit(CheckOtpState(
          email: (state as AuthedMailSuccess).email,
          otp: (state as AuthedMailSuccess).otp,
        ));
      }
    }
  }

  Future<bool> resetPassword(ResetPasswordRequest request) async {
    emit(LoadingResetPassword());
    final res = await locator
        .get<ResetPasswordRepositoryImpl>()
        .resetPassword(req: request);
    if (res is SuccessRessponse) {
      emit(ResetPasswordSuccessState(message: res.message));
      return true;
    } else {
      emit(ResetPasswordError(message: res.message));
      return false;
    }
  }
}
