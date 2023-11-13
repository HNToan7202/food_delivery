import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';

import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/models/user_info_request.dart';
import '../../data/models/user_response.dart';

import '../../data/repositories/auth_repository_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserResponseData? get user => state.user;
  AuthCubit() : super(AuthInitial());

  Future<void> doLogin(LoginRequest request) async {
    emit(AuthLoginLoadingState());
    final res =
        await locator.get<AuthRepositoryImpl>().doLogin(requestBody: request);

    if (res is SuccessRessponse<LoginResponseData>) {
      emit(AuthLoginSuccessState(
          accessToken: res.data?.accessToken ?? "",
          refreshToken: res.data?.refreshToken ?? ""));
    } else {
      emit(AuthLoginErrorState());
    }
  }

  void getUserInfo(GetUserInfoRequest request) async {
    final res = await locator
        .get<AuthRepositoryImpl>()
        .getUserInfo(requestHeader: request);
    if (res is SuccessRessponse<UserResponseData>) {
      emit(state.copyWith(user: res.data!));
    } else {
      emit(AuthLoginErrorState());
    }
  }
}
