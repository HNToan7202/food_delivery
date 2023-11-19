import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_dish_req.dart';
import 'package:food_delivery/app/feature/restaurant/data/model/res_dish_response.dart';
import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_response.dart';
import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_req.dart';
import 'package:food_delivery/app/feature/restaurant/domain/repo/restaurant_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';
import '../../../../../core/base_url.dart';
import '../../../../../core/service/api_service_impl.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final ApiServiceImpl service;
  static String BASE_URL = BaseURL.BASE_URL;
  RestaurantRepositoryImpl({required this.service});

  @override
  Future<CommonResponse<RestaurantData>> getAll(RestaurantReq req) {
    return service.get<RestaurantReq, RestaurantData>(
      path: "$BASE_URL/v1/restaurant",
      params: req,
      tFromMap: RestaurantData.fromJson,
    );
  }

  @override
  Future<CommonResponse<ResDishResponseData>> getDishByRestaurantId(
      RestaurantDishReq req) {
    return service.get<RestaurantDishReq, ResDishResponseData>(
      path:
          "$BASE_URL/v1/dish/${req.restaurantId}/get-all?page=${req.page}&size=${req.size}",
      params: null,
      tFromMap: ResDishResponseData.fromJson,
    );
  }
}
