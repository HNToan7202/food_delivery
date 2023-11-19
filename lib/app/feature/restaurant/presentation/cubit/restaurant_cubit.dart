import 'package:bloc/bloc.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/cubit/restaurant_state.dart';
import 'package:food_delivery/core/models/common_response.dart';
import 'package:meta/meta.dart';
import '../../../../../di.dart';
import '../../../dish/data/model/dish_model.dart';
import '../../data/model/restaurant_dish_req.dart';
import '../../data/repo/restaurant_repository_impl.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  Future<void> getDishByRestaurantId(
      String restId, String page, String size) async {
    final res = await locator
        .get<RestaurantRepositoryImpl>()
        .getDishByRestaurantId(RestaurantDishReq(
          restaurantId: restId,
          page: page,
          size: size,
        ));
    if (res is SuccessRessponse) {
      if (res.code == 20401) {
        emit(RestaurantNoData());
      }
      emit(RestaurantDishLoaded(res.data?.dishes ?? []));
    }
  }
}
