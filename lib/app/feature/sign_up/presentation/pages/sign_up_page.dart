import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/login/presentation/page/login_page.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/common/utils/validator_util.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = "/signUp";

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
                "Sign Up",
                style: TextStyle(
                    color: AppColorScheme.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to sign up",
                style: TextStyle(
                    color: AppColorScheme.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              InputDefault(
                controller: context.read<SignUpCubit>().nameController,
                validator: ValidatorUtils.nameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Name",
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
                // controller: txtName,
              ),
              const SizedBox(
                height: 25,
              ),
              InputDefault(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Email",
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
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              InputDefault(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Mobile No",
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
                // controller: txtMobile,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 25,
              ),
              InputDefault(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Password",
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
                // controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              InputDefault(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  hintText: "Confirm Password",
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
                // controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 25,
              ),
              BtnDefault(
                padding: const EdgeInsets.symmetric(vertical: 20),
                title: "Sign Up",
                decoration: BoxDecoration(
                  color: AppColorScheme.kPrimary,
                  borderRadius: BorderRadius.circular(28),
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const LoginPage(),
                  //   ),
                  // );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Already have an Account? ",
                        style: tStyle.PrM(
                            color: AppColorScheme.secondaryText,
                            fontWeight: FontWeight.w500)),
                    Text("Login",
                        style: tStyle.PrM(
                            color: AppColorScheme.kPrimary,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
