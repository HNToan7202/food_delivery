import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/models/common_response.dart';
import '../../../../../../di.dart';
import '../../../data/model/verify_account_req.dart';
import '../../../data/repo/account_repository_impl.dart';

part 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit() : super(VerifyAccountInitial());

  Future<void> verifyAccount(
      {required String email, required String otp}) async {
    final res = await locator
        .get<AccountRepoSitoryImpl>()
        .verifyAccount(req: VerifyAccountReq(email: email, otp: otp));

    if (res is SuccessRessponse) {
      emit(SignUpSuccess());
    } else {
      emit(VerifyAccountError(message: res.message ?? "Error"));
    }
  }
}
