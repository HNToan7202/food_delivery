part of 'home_cubit.dart';

@immutable
class HomeState {}

class HomeInitial extends HomeState {}

class LoadingRestaurant extends HomeState {}

class HomeGetAllRest extends HomeState {
  List<Restaurant> listRest;
  HomeGetAllRest({required this.listRest});

  HomeGetAllRest copyWith({
    List<Restaurant>? listRest,
  }) {
    return HomeGetAllRest(
      listRest: listRest ?? this.listRest,
    );
  }
}
