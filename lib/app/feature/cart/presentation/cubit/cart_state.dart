// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

@immutable
class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartHasData extends CartState {
  Order? order;
  CartHasData({
    required this.order,
  });
}

class CartNoData extends CartState {}
