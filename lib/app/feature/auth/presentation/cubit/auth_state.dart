part of 'auth_cubit.dart';

class AuthState {
  final UserResponseData? user;
  const AuthState({this.user});
  AuthState copyWith({UserResponseData? user}) {
    return AuthState(user: user ?? this.user);
  }
}

class AuthInitial extends AuthState {}

class AuthLoginState extends AuthState {
  final bool isShow;
  AuthLoginState({this.isShow = false});
  AuthLoginState coppyWith({bool? isShow}) {
    return AuthLoginState(isShow: isShow ?? this.isShow);
  }
}

class AuthLoginSuccessState extends AuthState {
  final String accessToken;
  final String refreshToken;
  AuthLoginSuccessState(
      {required this.accessToken, required this.refreshToken});
}

class AuthLoginErrorState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}
