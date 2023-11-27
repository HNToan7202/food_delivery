import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/new_password_page.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/reset_password_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpPageArg {
  final String email;
  final String otp;

  OtpPageArg({required this.email, required this.otp});
}

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.arg});

  static const routeName = "/otp";
  final OtpPageArg arg;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Text("We have sent an OTP to your email",
                  textAlign: TextAlign.center,
                  style: tStyle.H3(color: AppColorScheme.primaryText)),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please check your email \ncontinue to reset your password",
                textAlign: TextAlign.center,
                style: tStyle.PrM(color: AppColorScheme.secondaryText),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                    key: _otpPinFieldController,
                    autoFocus: true,
                    onSubmit: (newCode) {
                      /// return the entered pin
                    },
                    onChange: (newCode) {
                      /// return the entered pin
                    },
                    fieldWidth: 40,
                    fieldHeight: 40,

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(

                        /// border color for inactive/unfocused Otp_Pin_Field
                        defaultFieldBorderColor: Colors.transparent,

                        /// border color for active/focused Otp_Pin_Field
                        activeFieldBorderColor: Colors.transparent,

                        /// Background Color for inactive/unfocused Otp_Pin_Field
                        defaultFieldBackgroundColor: AppColorScheme.textfield,
                        activeFieldBackgroundColor: AppColorScheme.textfield

                        /// Background Color for active/focused Otp_Pin_Field
                        ),
                    maxLength: 6,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: AppColorScheme.placeholder,

                    /// to choose cursor color
                    upperChild: Column(
                      children: const [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    showCustomKeyboard: false,

                    ///bool which manage to show custom keyboard
                    // customKeyboard: Container(),  /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    // showDefaultKeyboard: true,  ///bool which manage to show default OS keyboard
                    cursorWidth: 3,

                    /// to select cursor width
                    mainAxisAlignment: MainAxisAlignment.center,

                    /// place otp pin field according to yourselft

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthCheckOtpSuccess) {
                    EasyLoading.dismiss();
                    Navigator.pushNamed(context, NewPassWordPage.routeName);
                  }
                },
                child: BtnDefault(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    title: "Next",
                    onTap: () {
                      if (_otpPinFieldController.currentState!.text ==
                          widget.arg.otp) {
                        EasyLoading.show(status: 'loading...');
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            NewPassWordPage.routeName,
                            arguments: widget.arg,
                            (route) => false);
                      } else {
                        EasyLoading.showError("OTP is not correct");
                      }
                    },
                    decoration: BoxDecoration(
                      color: AppColorScheme.kPrimary,
                      borderRadius: BorderRadius.circular(28),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
