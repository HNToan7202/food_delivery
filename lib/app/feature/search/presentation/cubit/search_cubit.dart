import 'package:bloc/bloc.dart';
import 'package:food_delivery/app/feature/restaurant/data/repo/restaurant_repository_impl.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../../restaurant/data/model/search_restaurant_req.dart';
import '../../../restaurant/data/model/search_restaurant_response.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String keyword) async {
    emit(SearchLoading());
    final res = await locator
        .get<RestaurantRepositoryImpl>()
        .searchRestaurant(SearchReq(nameCategory: keyword));

    if (res is SuccessRessponse) {
      emit(SearchLoaded(res.data?.restaurant ?? []));
    } else {
      emit(SearchError());
    }
  }
}
