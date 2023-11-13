import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/login/presentation/bloc/login_bloc.dart';
import 'package:food_delivery/app/feature/login/presentation/bloc/login_state.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/reset_password_page.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/pages/sign_up_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/common/utils/validator_util.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../auth/data/models/login_request.dart';
import '../../../auth/data/models/user_info_request.dart';
import '../../../home/presentation/page/nav_bar.dart';
import '../bloc/login_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(LoginEventInitial());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          EasyLoading.showSuccess(
            'Đăng Nhập Thành Công!',
          );
          GetUserInfoRequest request =
              GetUserInfoRequest(accessToken: state.accessToken);

          context.read<AuthCubit>().getUserInfo(request);

          Navigator.of(context).pushNamedAndRemoveUntil(
            NavBar.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Text(AppLocalizations.of(context)!.login,
                      style: tStyle.H3(color: AppColorScheme.primaryText)),
                  Text(AppLocalizations.of(context)!.addYourDetailsToLogin,
                      style: tStyle.PrM(color: AppColorScheme.secondaryText)),
                  const SizedBox(
                    height: 25,
                  ),
                  InputDefault(
                    controller: context.read<LoginBloc>().userNameController,
                    validator: ValidatorUtils.usernameValidator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      hintText: AppLocalizations.of(context)!.username,
                      hintStyle:
                          tStyle.PrM(color: AppColorScheme.secondaryText),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      //fillColor: AppColorScheme.inputBg,
                    ),
                    //controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return InputDefault(
                        controller:
                            context.read<LoginBloc>().passwordController,
                        obscureText: !state.isShow,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ValidatorUtils.passwordValidator,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 25,
                          ),

                          suffixIcon: GestureDetector(
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginEventTogglePassword());
                            },
                            child: Image.asset(
                              !state.isShow
                                  ? Assets.images.passwordIcons
                                      .path // Hiển thị biểu tượng cho mật khẩu hiển thị
                                  : Assets.images.hidePassword
                                      .path, // Hiển thị biểu tượng cho mật khẩu ẩn
                            ),
                          ),
                          hintText: AppLocalizations.of(context)!.password,
                          hintStyle:
                              tStyle.PrM(color: AppColorScheme.secondaryText),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          //fillColor: AppColorScheme.inputBg,
                        ),
                        //controller: txtPassword,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BtnDefault(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    title: AppLocalizations.of(context)!.login,
                    decoration: BoxDecoration(
                      color: AppColorScheme.kPrimary,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show(status: 'loading...');
                        LoginRequest request = LoginRequest(
                            username: context
                                .read<LoginBloc>()
                                .userNameController
                                .text,
                            password: context
                                .read<LoginBloc>()
                                .passwordController
                                .text);
                        context.read<AuthCubit>().doLogin(request);
                      }

                      // _incrementCounter();

                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   NavBar.routeName,
                      //   (route) => false,
                      // );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        ResetPasswordPage.routeName,
                        (route) => false,
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: TextStyle(
                          color: AppColorScheme.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "or Login With",
                    style: TextStyle(
                        color: AppColorScheme.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BtnDefault(
                    decoration: BoxDecoration(
                      color: const Color(0xff367FC0),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.facebookLogo.path,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Login with Facebook",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BtnDefault(
                    //icon: "assets/img/google_logo.png",
                    decoration: BoxDecoration(
                      color: const Color(0xffDD4B39),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    onTap: () {},
                    //icon: "assets/img/google_logo.png",
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.googleLogo.path,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.loginWithFacebook,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SignUpPage.routeName,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontHaveAccount,
                          style: TextStyle(
                              color: AppColorScheme.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppLocalizations.of(context)!.signUp,
                          style: TextStyle(
                              color: AppColorScheme.kPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
