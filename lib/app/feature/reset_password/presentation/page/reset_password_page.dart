import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/reset_password_body.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  static const routeName = "/resetPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordBody(),
    );
  }
}
