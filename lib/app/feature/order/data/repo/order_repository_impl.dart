import 'package:food_delivery/app/feature/order/data/model/add_dish_req.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status_req.dart';
import 'package:food_delivery/app/feature/order/data/model/remove_dish.dart';
import 'package:food_delivery/app/feature/order/domain/repo/order_repository.dart';
import 'package:food_delivery/core/models/common_response.dart';

import '../../../../../core/base_url.dart';
import '../../../../../core/service/api_service_impl.dart';
import '../model/cancel_order.dart';
import '../model/order_request.dart';
import '../model/order_response.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiServiceImpl service;
  static String BASE_URL = BaseURL.BASE_URL;
  OrderRepositoryImpl({required this.service});

  @override
  Future<CommonResponse<Object>> addDish({required AddDishReq addDishReq}) {
    return service.post<AddDishReq, Object>(
      path: "$BASE_URL/v1/customer/add-dish",
      requestBody: addDishReq,
      tFromMap: (json) => json,
    );
  }

  @override
  Future<CommonResponse<OrderResponseData>> getOrderByStatus(
      OrderStatus orderStatus) {
    return service.get<OrderStatus, OrderResponseData>(
      path: "$BASE_URL/v1/customer/order",
      params: orderStatus,
      tFromMap: OrderResponseData.fromJson,
    );
  }

  @override
  Future<CommonResponse<Object>> confirmOrder(ConfirmOrderReq confirmOrderReq) {
    return service.put<ConfirmOrderReq, Object>(
      path: "$BASE_URL/v1/customer/order/confirm",
      requestBody: confirmOrderReq,
      tFromMap: null,
    );
  }

  @override
  Future<CommonResponse<Object>> removeDish(
      {required RemoveDishReq removeDishReq}) {
    return service.put<RemoveDishReq, Object>(
      path: "$BASE_URL/v1/customer/remove-dish",
      requestBody: removeDishReq,
      tFromMap: null,
    );
  }

  @override
  Future<CommonResponse<Object>> cancelOrder() {
    return service.put<CancelOrderReq, Object>(
      path: "$BASE_URL/v1/customer/order/cancel",
      requestBody: null,
      tFromMap: null,
    );
  }
}
