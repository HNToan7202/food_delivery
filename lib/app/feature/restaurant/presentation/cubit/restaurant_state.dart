import 'package:flutter/material.dart';

import '../../data/model/res_dish_response.dart';

@immutable
class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantDishLoading extends RestaurantState {}

class RestaurantDishLoaded extends RestaurantState {
  final List<Dish> dishes;

  RestaurantDishLoaded(this.dishes);
}

class RestaurantNoData extends RestaurantState {}

class AddOrder extends RestaurantState {
  final Dish dish;
  final int quantity;
  AddOrder({required this.dish, required this.quantity});
}
