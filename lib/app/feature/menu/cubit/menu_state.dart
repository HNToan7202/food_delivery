part of 'menu_cubit.dart';

@immutable
class MenuState {
  final CategoriesResponseData? categories;
  MenuState({
    this.categories,
  });
  MenuState copyWith({
    CategoriesResponseData? categories,
  }) {
    return MenuState(
      categories: categories ?? this.categories,
    );
  }
}

class MenuInitial extends MenuState {
  MenuInitial({super.categories});
}

class MenuErrorState extends MenuState {
  MenuErrorState({super.categories});
}

class MenuLoadedState extends MenuState {
  MenuLoadedState({super.categories});
}

class MenuLoadingState extends MenuState {
  MenuLoadingState({super.categories});
}
