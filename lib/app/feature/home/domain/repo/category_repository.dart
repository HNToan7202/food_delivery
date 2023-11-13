import 'package:food_delivery/app/feature/home/data/model/categories_req.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_response.dart';
import '../../../../../core/models/common_response.dart';

abstract class CategoryRepository {
  Future<CommonResponse<CategoriesResponseData>> getCategory(
      CategoriesReq categoriesReq);
}
