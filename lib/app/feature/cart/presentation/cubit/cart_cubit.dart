import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status_req.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../order/data/model/order_response.dart';
import '../../../order/data/repo/order_repository_impl.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCart(String resName) async {
    emit(CartLoading());
    final res = await locator.get<OrderRepositoryImpl>().getOrderByStatus(
        OrderStatus(
            page: "1", size: "10", status: OrderStatusState.UNPURCHASED.name));
    if (res is SuccessRessponse) {
      final order = res.data?.orders.first;
      if (order?.restaurantName == resName) {
        emit(CartHasData(order: order));
      } else {
        emit(CartNoData());
      }
    } else if (res.code == 20401) {
      emit(CartNoData());
    }
  }

  void removeDishFromCart(OrderResponse orderResponse) {
    emit(CartNoData());
  }

  void clearCart() {
    emit(CartNoData());
  }
}
