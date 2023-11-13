import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../data/model/dish_req.dart';
import '../../data/model/dish_response.dart';
import '../../data/repo/dish_repository_impl.dart';

part 'dish_state.dart';

class DishCubit extends Cubit<DishState> {
  DishCubit() : super(DishInitial(listDish: []));

  Future<void> getDishByCateId(String categoryId) async {
    final res = await locator
        .get<DishRepositoryImpl>()
        .getDishByCateId(DishByCategoryReq(categoryId: categoryId));

    if (res is SuccessRessponse<DishResponse>) {
      print("res.data ${res.data}");
    }
  }
}
