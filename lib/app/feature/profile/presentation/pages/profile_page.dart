import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/profile/presentation/cubit/user_cubit.dart';
import 'package:food_delivery/app/feature/profile/presentation/pages/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: const ProfileBody(),
    );
  }
}
