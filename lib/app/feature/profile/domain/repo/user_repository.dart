import 'package:food_delivery/core/models/common_response.dart';

import '../../data/model/update_profile_req.dart';

abstract class UserRepository {
  Future<CommonResponse> updateProfile({required UpdateProfileReq requestBody});
}
