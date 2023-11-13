import 'package:food_delivery/app/feature/auth/data/models/user_info_request.dart';

abstract class LoginEvent {}

class LoginEventTogglePassword extends LoginEvent {}

class LoginEventSubmit extends LoginEvent {}

class LoginEventInitial extends LoginEvent {
  final String? userName;
  LoginEventInitial({this.userName});
}

class LoginEventGetProfile extends LoginEvent {
  final GetUserInfoRequest? accessToken;
  LoginEventGetProfile({this.accessToken});
}
