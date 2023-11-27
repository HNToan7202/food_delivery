part of 'user_cubit.dart';

@immutable
class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserUpdateSuccess extends UserState {
  final String message;
  UserUpdateSuccess({required this.message});
}

class UserUpdateError extends UserState {
  final String message;
  UserUpdateError({required this.message});
}

class UserChangePasswordError extends UserState {
  final String message;
  UserChangePasswordError({required this.message});
}

class ChangeAvatarSuccess extends UserState {}

class ChangeAvatarError extends UserState {}
