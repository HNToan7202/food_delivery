import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
