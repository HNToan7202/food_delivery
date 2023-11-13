import '../../../../../core/models/common_response.dart';
import '../../data/model/dish_req.dart';
import '../../data/model/dish_response.dart';

abstract class DishRepository {
  Future<CommonResponse<DishResponse>> getDishByCateId(
      DishByCategoryReq request);
}
