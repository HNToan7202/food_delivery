part of 'dish_cubit.dart';

@immutable
class DishState {}

class DishInitial extends DishState {}

class DishLoading extends DishState {}

class DishLoaded extends DishState {
  final List<Dish> listDish;
  DishLoaded({required this.listDish});
}
