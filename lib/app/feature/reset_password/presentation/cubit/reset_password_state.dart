part of 'reset_password_cubit.dart';

@immutable
class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  ResetPasswordError({required this.message});
}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

class ResetPasswordLoading extends ResetPasswordState {}

class AuthedMailSuccess extends ResetPasswordState {
  final String email;
  final String otp;

  AuthedMailSuccess({
    required this.email,
    required this.otp,
  });
}

class CheckOtpState extends AuthedMailSuccess {
  CheckOtpState({
    required super.email,
    required super.otp,
  });

  @override
  String toString() => 'CheckOtpState(email: $email, otp: $otp)';

  CheckOtpState copyWith({
    String? email,
    String? otp,
  }) {
    return CheckOtpState(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }
}

class LoadingResetPassword extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final String message;

  ResetPasswordSuccessState({required this.message});
}
