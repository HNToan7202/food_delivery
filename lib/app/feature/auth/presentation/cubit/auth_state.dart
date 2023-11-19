part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthForgotPasswordState extends AuthState {
  final String email;
  AuthForgotPasswordState({required this.email});
}

class AuthCheckOtpSuccess extends AuthState {
  final String otp;
  final String email;
  AuthCheckOtpSuccess({required this.otp, required this.email});
}

class AuthLoginSuccessState extends AuthState {
  final String accessToken;
  final String refreshToken;
  AuthLoginSuccessState({
    required this.accessToken,
    required this.refreshToken,
  });
}

class GetDoneUserState extends AuthLoginSuccessState {
  UserResponseData user;
  GetDoneUserState(
      {required super.accessToken,
      required super.refreshToken,
      required this.user});
  GetDoneUserState copyWith({
    String? accessToken,
    String? refreshToken,
    UserResponseData? user,
  }) {
    return GetDoneUserState(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

class AuthLoginErrorState extends AuthState {}

class AuthLoginLoadingState extends AuthState {}

class AuthLogOutState extends AuthState {}

class AuthLogoutErrorState extends AuthState {}

class AuthForgotErrorState extends AuthState {
  final String message;
  AuthForgotErrorState({required this.message});
}
