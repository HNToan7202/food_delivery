part of 'verify_account_cubit.dart';

@immutable
class VerifyAccountState {}

class VerifyAccountInitial extends VerifyAccountState {}

class VerifyAccountLoading extends VerifyAccountState {}

class VerifyAccountError extends VerifyAccountState {
  final String message;

  VerifyAccountError({required this.message});
}

class SignUpSuccess extends VerifyAccountState {}
