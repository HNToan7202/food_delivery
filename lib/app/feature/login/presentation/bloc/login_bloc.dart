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

    // on<LoginEventSubmit>((event, emit) async {
    //   LoginRequest request = LoginRequest(
    //       username: userNameController.text, password: passwordController.text);
    //   final res =
    //       await locator.get<AuthRepositoryImpl>().doLogin(requestBody: request);

    //   if (res is SuccessRessponse<LoginResponseData>) {
    //     emit(LoginSuccessState(
    //         accessToken: res.data?.accessToken ?? "",
    //         refreshToken: res.data?.refreshToken ?? ""));
    //   } else {
    //     emit(LoginErrorState());
    //   }
    // });

    // on<LoginEventGetProfile>((event, emit) async {
    //   GetUserInfoRequest request =
    //       GetUserInfoRequest(accessToken: event.accessToken?.accessToken ?? "");
    //   final res = await locator
    //       .get<AuthRepositoryImpl>()
    //       .getUserInfo(requestHeader: request);
    //   if (res is SuccessRessponse<UserResponseData>) {
    //     print("res.data name ${res.data?.fullName}");
    //     emit(LoginGetProfileState(userResponseData: res.data!));
    //   } else {
    //     emit(LoginErrorState());
    //   }
    // });
  }
}
