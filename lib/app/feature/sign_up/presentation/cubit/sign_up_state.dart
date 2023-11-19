part of 'sign_up_cubit.dart';

@immutable
class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class VerifyAccountLoading extends SignUpState {}

class VerifyAccountError extends SignUpState {
  final String message;

  VerifyAccountError({required this.message});
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError({required this.message});
}
