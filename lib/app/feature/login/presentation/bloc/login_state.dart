import 'package:food_delivery/app/feature/auth/data/models/user_response.dart';
import 'package:food_delivery/app/feature/login/domain/login_model.dart';

class LoginInitialState extends LoginState {
  final String? userName;
  LoginInitialState({this.userName});
}

class LoginState {
  final UserResponseData? userResponseData;
  final bool isShow;
  LoginState({this.isShow = false, this.userResponseData});
  LoginState copyWith({bool? isShow, UserResponseData? userResponseData}) {
    return LoginState(
        isShow: isShow ?? this.isShow,
        userResponseData: userResponseData ?? this.userResponseData);
  }
}

class LoginSuccessState extends LoginState {
  final String accessToken;
  final String refreshToken;
  LoginSuccessState({required this.accessToken, required this.refreshToken});
}

class LoginLoadingState extends LoginState {}

class LoginGetProfileState extends LoginState {
  final UserResponseData userResponseData;
  LoginGetProfileState({required this.userResponseData});
}
