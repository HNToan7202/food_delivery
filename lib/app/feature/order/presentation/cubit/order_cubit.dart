import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../data/model/add_dish_req.dart';
import '../../data/model/order_request.dart';
import '../../data/model/order_response.dart';
import '../../data/model/order_status_req.dart';
import '../../data/model/remove_dish.dart';
import '../../data/repo/order_repository_impl.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  Future<void> addDishToOrder(AddDishReq addDishReq) async {
    emit(OnRestDish());
    final res = await locator
        .get<OrderRepositoryImpl>()
        .addDish(addDishReq: addDishReq);
    if (res is SuccessRessponse) {
      emit(AddDishToOrderSuccess());
    }
  }

  Future<void> getOrderByStatus(OrderStatus orderStatus) async {
    emit(OnLoadingOrder());
    final res =
        await locator.get<OrderRepositoryImpl>().getOrderByStatus(orderStatus);
    if (res is SuccessRessponse) {
      emit(OrderLoaded(res.data?.orders ?? []));
    }
    if (res.code == 20401) {
      emit(OrderNodata());
    }
  }

  Future<bool> confirmOrder(ConfirmOrderReq orderReq) async {
    final res = await locator.get<OrderRepositoryImpl>().confirmOrder(orderReq);
    if (res is SuccessRessponse) {
      emit(ConfirmOrderSuccess());
      return true;
    }
    return false;
  }

  Future<void> removeDish(RemoveDishReq removeDishReq) async {
    final res = await locator
        .get<OrderRepositoryImpl>()
        .removeDish(removeDishReq: removeDishReq);
    if (res is SuccessRessponse) {
      emit(RemoveDishSuccess());
    }
  }
}
