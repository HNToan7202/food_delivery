import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/profile/data/repo/user_repository_impl.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../profile/data/model/update_profile_req.dart';
import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/models/logout_request.dart';
import '../../data/models/user_info_request.dart';
import '../../data/models/user_response.dart';
import '../../data/repositories/auth_repository_impl.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with HydratedMixin {
  AuthCubit() : super(AuthInitial());

  Future<void> doLogin(LoginRequest request) async {
    emit(AuthLoginLoadingState());
    final res =
        await locator.get<AuthRepositoryImpl>().doLogin(requestBody: request);

    if (res is SuccessRessponse<LoginResponseData>) {
      final AuthLoginSuccessState authLoginSuccessState = AuthLoginSuccessState(
          accessToken: res.data?.accessToken ?? "",
          refreshToken: res.data?.refreshToken ?? "");
      print("authLoginSuccessState: ${authLoginSuccessState.accessToken}");
      emit(authLoginSuccessState);
    } else {
      emit(AuthLoginErrorState());
    }
  }

  void doLogOut(LogoutRequest request) {
    if (state is AuthLoginSuccessState) {
      final res =
          locator.get<AuthRepositoryImpl>().doLogout(requestBody: request);
      if (res is SuccessRessponse) {
        emit(AuthLogOutState());
      } else {}
    }
  }

  void getUserInfo(GetUserInfoRequest request) async {
    final res = await locator
        .get<AuthRepositoryImpl>()
        .getUserInfo(requestHeader: request);
    if (res is SuccessRessponse<UserResponseData>) {
      emit(GetDoneUserState(
          accessToken: (state as AuthLoginSuccessState).accessToken,
          refreshToken: (state as AuthLoginSuccessState).refreshToken,
          user: res.data!));
    } else {
      emit(AuthLogoutErrorState());
    }
  }

  Future<void> updateFullName(String fullName) async {
    if (state is GetDoneUserState) {
      UserResponseData user = (state as GetDoneUserState).user;
      final res = await locator.get<UserRepositoryImpl>().updateProfile(
          requestBody: UpdateProfileReq(
              phone: user.phone,
              email: user.email,
              fullName: fullName,
              dateOfBirth: user.dateOfBirth,
              address: user.address,
              gender: user.gender));
      if (res is SuccessRessponse) {
        emit((state as GetDoneUserState)
            .copyWith(user: user.copyWith(fullName: fullName)));
      }
    }
  }

  Future<void> updatePhone(String phone) async {
    if (state is GetDoneUserState) {
      UserResponseData user = (state as GetDoneUserState).user;
      final res = await locator.get<UserRepositoryImpl>().updateProfile(
          requestBody: UpdateProfileReq(
              phone: phone,
              email: user.email,
              fullName: user.phone,
              dateOfBirth: user.dateOfBirth,
              address: user.address,
              gender: user.gender));
      if (res is SuccessRessponse) {
        emit((state as GetDoneUserState)
            .copyWith(user: user.copyWith(phone: phone)));
      }
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      // Deserialize the saved state from storage
      return AuthLoginSuccessState(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is AuthLoginSuccessState) {
      // Serialize the current state to be saved
      return {
        'accessToken': state.accessToken,
        'refreshToken': state.refreshToken,
      };
    }
    return null;
  }
}
