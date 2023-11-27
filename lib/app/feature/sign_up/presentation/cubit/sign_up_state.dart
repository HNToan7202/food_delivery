part of 'sign_up_cubit.dart';

@immutable
class SignUpState {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  SignUpState({
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  SignUpState copyWith({
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return SignUpState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}

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
