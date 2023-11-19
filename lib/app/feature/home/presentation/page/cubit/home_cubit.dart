import 'package:bloc/bloc.dart';
import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_req.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/models/common_response.dart';
import '../../../../../../di.dart';

import '../../../../restaurant/data/model/restaurant_model.dart';
import '../../../../restaurant/data/repo/restaurant_repository_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getAllRestaurant(RestaurantReq req) async {
    emit(LoadingRestaurant());
    print("getAllRestaurant");
    final res = await locator.get<RestaurantRepositoryImpl>().getAll(req);
    if (res is SuccessRessponse) {
      emit(HomeGetAllRest(listRest: res.data?.restaurants ?? []));
    }
  }
}
