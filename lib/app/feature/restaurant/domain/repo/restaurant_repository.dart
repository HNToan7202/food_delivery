import '../../../../../core/models/common_response.dart';
import '../../data/model/res_dish_response.dart';
import '../../data/model/restaurant_dish_req.dart';
import '../../data/model/restaurant_req.dart';
import '../../data/model/restaurant_response.dart';

abstract class RestaurantRepository {
  Future<CommonResponse<RestaurantData>> getAll(RestaurantReq req);

  Future<CommonResponse<ResDishResponseData>> getDishByRestaurantId(
      RestaurantDishReq req);
}
