import 'package:food_delivery/app/feature/dish/domain/repo/dish_repository.dart';
import 'package:food_delivery/core/base_url.dart';
import 'package:food_delivery/core/models/common_response.dart';

import '../../../../../core/service/api_service_impl.dart';
import '../model/dish_req.dart';
import '../model/dish_response.dart';

class DishRepositoryImpl implements DishRepository {
  static String BASE_URL = BaseURL.BASE_URL;
  static String BASE_URL2 = BaseURL.BASE_URL2;
  final ApiServiceImpl service;

  DishRepositoryImpl({
    required this.service,
  });

  @override
  Future<CommonResponse<DishResponseData>> getDishByCateId(
      DishByCategoryReq request) {
    return service.get<DishByCategoryReq, DishResponseData>(
      path: "$BASE_URL/v1/dish-category/detail",
      params: request,
      tFromMap: DishResponseData.fromMap,
    );
  }
}
