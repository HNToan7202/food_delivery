import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/cubit/cubit/verify_account_cubit.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/pages/verify_body.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key, required this.email});

  final String email;

  static const routeName = "/verifyAccount";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyAccountCubit(),
      child: Scaffold(
        body: VerifyBody(
          email: email,
        ),
      ),
    );
  }
}
