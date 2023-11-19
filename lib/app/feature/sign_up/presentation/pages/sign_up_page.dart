import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/pages/signup_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeName = "/signUp";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpBody(),
    );
  }
}
