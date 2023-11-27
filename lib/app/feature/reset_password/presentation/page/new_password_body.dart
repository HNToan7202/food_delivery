import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../common/btn/btn_default.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../common/input/input_default.dart';
import '../../../../../common/text_theme.dart';
import '../../../login/presentation/page/login_page.dart';
import '../../data/model/reset_password_request.dart';
import '../cubit/reset_password_cubit.dart';
import 'otp_page.dart';

class NewPasswordBody extends StatefulWidget {
  const NewPasswordBody({super.key, required this.arg});

  final OtpPageArg arg;

  @override
  State<NewPasswordBody> createState() => _NewPasswordBodyState();
}

class _NewPasswordBodyState extends State<NewPasswordBody> {
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Text(
                  "New Password",
                  style: TextStyle(
                      color: AppColorScheme.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Please enter your new password",
                  style: TextStyle(
                      color: AppColorScheme.secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 60,
                ),
                InputDefault(
                  controller: txtNewPassword,
                  validator: ((p0) {
                    if (p0!.isEmpty) {
                      return "Please enter new password";
                    }
                    if (p0.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    hintText: "New Password",
                    hintStyle: tStyle.PrM(color: AppColorScheme.secondaryText),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    //fillColor: AppColorScheme.inputBg,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                InputDefault(
                  controller: txtConfirmPassword,
                  validator: ((p0) {
                    if (p0!.isEmpty) {
                      return "Please enter confirm password";
                    }
                    if (p0.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    if (p0 != txtNewPassword.text) {
                      return "Password and confirm password not match";
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    hintText: "Confirm Password",
                    hintStyle: tStyle.PrM(color: AppColorScheme.secondaryText),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    //fillColor: AppColorScheme.inputBg,
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                BtnDefault(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColorScheme.kPrimary,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  title: "Reset Password",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      final request = ResetPasswordRequest(
                          email: widget.arg.email,
                          otp: widget.arg.otp,
                          newPassword: txtNewPassword.text);
                      context
                          .read<ResetPasswordCubit>()
                          .resetPassword(request)
                          .then(((value) {
                        if (value == true) {
                          EasyLoading.showSuccess("Reset password success");
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.routeName, (route) => false);
                        }
                      }));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
