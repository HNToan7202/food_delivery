import 'package:food_delivery/core/models/common_response.dart';

import '../../data/model/add_dish_req.dart';
import '../../data/model/order_status_req.dart';

abstract class OrderRepository {
  Future<CommonResponse> addDish({required AddDishReq addDishReq});

  Future<CommonResponse> getOrderByStatus(OrderStatus orderStatus);
}
