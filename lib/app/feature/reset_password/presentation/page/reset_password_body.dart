import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import '../../../../../common/btn/btn_default.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../common/input/input_default.dart';
import '../../../../../common/utils/validator_util.dart';
import '../../data/model/forgot_password_request.dart';
import '../cubit/reset_password_cubit.dart';
import 'otp_page.dart';

// ignore: must_be_immutable
class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});

  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is AuthForgotPasswordState) {
          EasyLoading.dismiss();
          Navigator.of(context)
              .pushNamedAndRemoveUntil(OtpPage.routeName, (route) => false);
        }
        if (state is AuthedMailSuccess) {
          EasyLoading.dismiss();
          OtpPageArg otpPageArg =
              OtpPageArg(email: state.email, otp: state.otp);
          Navigator.of(context).pushNamedAndRemoveUntil(
              OtpPage.routeName, arguments: otpPageArg, (route) => false);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                    color: AppColorScheme.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your email to receive a\n reset code to create a new password via email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColorScheme.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              InputDefault(
                controller: txtEmail,
                validator: ValidatorUtils.emailValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Your Email",
                  hintStyle: TextStyle(
                      color: AppColorScheme.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  //fillColor: AppColorScheme.inputBg,
                ),
                // controller: txtEmail,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthedMailSuccess) {
                    final data = state as AuthedMailSuccess;
                    OtpPageArg otpPageArg =
                        OtpPageArg(email: data.email, otp: data.otp);
                    EasyLoading.dismiss();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        OtpPage.routeName,
                        arguments: otpPageArg,
                        (route) => false);
                  }
                  if (state is AuthForgotErrorState) {
                    EasyLoading.dismiss();
                    EasyLoading.showError(state.message);
                  }
                },
                child: BtnDefault(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColorScheme.kPrimary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    title: "Send",
                    onTap: () {
                      EasyLoading.show(status: 'loading...');
                      context.read<ResetPasswordCubit>().forgotPassword(
                          ForgotPasswordRequest(email: txtEmail.text));
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
