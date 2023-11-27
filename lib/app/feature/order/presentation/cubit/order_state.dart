part of 'order_cubit.dart';

@immutable
class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class AddDishToOrder extends OrderState {}

class OnRestDish extends OrderState {}

class AddDishToOrderFailure extends OrderState {
  final String message;
  AddDishToOrderFailure({required this.message});
}

class AddDishToOrderSuccess extends OrderState {}

class OnLoadingOrder extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> orders;
  OrderLoaded(this.orders);
}

class OrderNodata extends OrderState {}

class CartLoaded extends OrderState {
  final List<Order> carts;
  CartLoaded(this.carts);
}

class ConfirmOrderSuccess extends OrderState {}

class RemoveDishSuccess extends OrderState {}
