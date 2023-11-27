import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/otp_page.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/reset_password_body.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    super.key,
  });

  static const routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        body: ResetPasswordBody(),
      ),
    );
  }
}
