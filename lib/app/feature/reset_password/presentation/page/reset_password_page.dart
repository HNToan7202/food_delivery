import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/otp_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  static const routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                hintText: "Your Email",
                hintStyle: TextStyle(
                    color: AppColorScheme.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
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
            BtnDefault(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColorScheme.kPrimary,
                  borderRadius: BorderRadius.circular(28),
                ),
                title: "Send",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpPage(),
                    ),
                  );

                  btnSubmit();
                }),
          ],
        ),
      )),
    );
  }

  void btnSubmit() {}
}
