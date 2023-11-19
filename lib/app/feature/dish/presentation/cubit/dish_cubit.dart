import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/common_response.dart';
import '../../../../../di.dart';
import '../../data/model/dish_model.dart';
import '../../data/model/dish_req.dart';
import '../../data/model/dish_response.dart';
import '../../data/repo/dish_repository_impl.dart';

part 'dish_state.dart';

class DishCubit extends Cubit<DishState> {
  DishCubit() : super(DishInitial());

  Future<void> getDishByCateId(String categoryId) async {
    emit(DishLoading());
    final res = await locator
        .get<DishRepositoryImpl>()
        .getDishByCateId(DishByCategoryReq(categoryId: categoryId));

    if (res is SuccessRessponse) {
      print("res.data?.dish: ${res.data?.dish}");
      emit(DishLoaded(listDish: res.data?.dish ?? []));
    }
  }
}
