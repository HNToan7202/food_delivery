import 'package:flutter/material.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/common/text_theme.dart';

class NewPassWordPage extends StatefulWidget {
  const NewPassWordPage({super.key});

  static const routeName = "/new-password";

  @override
  State<NewPassWordPage> createState() => _NewPassWordPageState();
}

class _NewPassWordPageState extends State<NewPassWordPage> {
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
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
