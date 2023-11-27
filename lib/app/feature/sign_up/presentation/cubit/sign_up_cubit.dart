import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/sign_up/data/model/sign_up_req.dart';
import 'package:food_delivery/app/feature/sign_up/data/repo/account_repository_impl.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  SignUpCubit() : super(SignUpInitial());

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
  }

  Future<void> signUpAccount() async {
    emit(SignUpLoading());

    SignUpReq req = SignUpReq(
        email: emailController.text,
        password: passwordController.text,
        fullName: nameController.text,
        phone: phoneController.text);

    final res =
        await locator.get<AccountRepoSitoryImpl>().createAccount(req: req);

    if (res is SuccessRessponse) {
      emit(VerifyAccountLoading());
    } else {
      emit(VerifyAccountError(message: res.message));
    }
  }

  void showPassword() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void showConfirmPassword() {
    emit(state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }
}
