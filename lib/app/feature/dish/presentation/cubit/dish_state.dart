part of 'dish_cubit.dart';

@immutable
class DishState {
  final List<DishResponseData> listDish;
  DishState({required this.listDish});
}

class DishInitial extends DishState {
  DishInitial({required super.listDish});
}

class DishLoading extends DishState {
  DishLoading({required super.listDish});
}

class DishLoaded extends DishState {
  DishLoaded({required super.listDish});
}
