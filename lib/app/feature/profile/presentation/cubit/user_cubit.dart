import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/profile/data/repo/user_repository_impl.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../data/model/update_profile_req.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<bool> updateProfile(UpdateProfileReq updateProfileReq) async {
    final res = await locator
        .get<UserRepositoryImpl>()
        .updateProfile(requestBody: updateProfileReq);
    if (res is SuccessRessponse) {
      emit(UserUpdateSuccess(message: res.message));
      return true;
    } else {
      UserUpdateError(message: res.message);
    }
    return false;
  }
}
