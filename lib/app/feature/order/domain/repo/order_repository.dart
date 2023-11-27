import 'package:food_delivery/core/models/common_response.dart';

import '../../data/model/add_dish_req.dart';
import '../../data/model/order_request.dart';
import '../../data/model/order_status_req.dart';
import '../../data/model/remove_dish.dart';

abstract class OrderRepository {
  Future<CommonResponse> addDish({required AddDishReq addDishReq});

  Future<CommonResponse> getOrderByStatus(OrderStatus orderStatus);

  Future<CommonResponse> confirmOrder(ConfirmOrderReq confirmOrderReq);

  Future<CommonResponse> removeDish({required RemoveDishReq removeDishReq});

  Future<CommonResponse> cancelOrder();
}
