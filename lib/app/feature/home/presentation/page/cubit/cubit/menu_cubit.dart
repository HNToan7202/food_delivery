import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_req.dart';
import 'package:food_delivery/app/feature/home/data/repo/category_repository_impl.dart';

import '../../../../../../../core/models/common_response.dart';
import '../../../../../../../di.dart';
import '../../../../data/model/categories_response.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  Future<void> getCategories(CategoriesReq categoriesReq) async {
    final res =
        await locator.get<CategoryRepositoryImpl>().getCategory(categoriesReq);

    if (res is SuccessRessponse<CategoriesResponseData>) {
      print("res.data ${res.data}");
      emit(MenuLoadedState(categories: res.data!));
    } else {
      emit(MenuErrorState());
    }
  }
}
