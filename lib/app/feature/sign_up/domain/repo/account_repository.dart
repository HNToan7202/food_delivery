import 'package:food_delivery/app/feature/sign_up/data/model/sign_up_req.dart';
import 'package:food_delivery/app/feature/sign_up/data/model/verify_account_req.dart';

import '../../../../../core/models/common_response.dart';

abstract class AccountRepository {
  Future<CommonResponse> createAccount({required SignUpReq req});

  Future<CommonResponse> verifyAccount({required VerifyAccountReq req});
}
