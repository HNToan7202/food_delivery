import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/login/presentation/page/login_page.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/new_password_body.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/otp_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/common/text_theme.dart';

import '../../data/model/reset_password_request.dart';

class NewPassWordPage extends StatefulWidget {
  const NewPassWordPage({super.key, required this.arg});

  final OtpPageArg arg;

  static const routeName = "/new-password";

  @override
  State<NewPassWordPage> createState() => _NewPassWordPageState();
}

class _NewPassWordPageState extends State<NewPassWordPage> {
  @override
  Widget build(Object context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: NewPasswordBody(arg: widget.arg),
    );
  }
}
