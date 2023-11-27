part of 'search_cubit.dart';

@immutable
class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Restaurant> restaurants;

  SearchLoaded(this.restaurants);
}

class SearchError extends SearchState {}
