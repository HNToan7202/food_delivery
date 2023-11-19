import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/auth/data/models/user_info_request.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../auth/data/models/login_request.dart';
import '../../../auth/data/models/login_response.dart';
import '../../../auth/data/models/user_response.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEventTogglePassword>((event, emit) {
      emit(state.copyWith(isShow: !state.isShow));
    });

    on<LoginEventInitial>(
      (event, emit) {
        userNameController.text = event.userName ?? "";
      },
    );
  }
}
