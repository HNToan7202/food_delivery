part of 'menu_cubit.dart';

@immutable
class MenuState {}

class MenuInitial extends MenuState {}

class MenuErrorState extends MenuState {}

class MenuLoadedState extends MenuState {
  final CategoriesResponseData? categories;
  MenuLoadedState({
    this.categories,
  });
}

class MenuLoadingState extends MenuState {}
