import 'package:dio/dio.dart';
import 'package:food_delivery/app/feature/dish/data/repo/dish_repository_impl.dart';
import 'package:food_delivery/app/feature/home/data/repo/category_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'core/service/api_service_impl.dart';

final locator = GetIt.instance;
Future<void> init() async {
  locator.registerSingleton<Dio>(Dio()); //todo: thêm Tnterceptor
  locator.registerSingleton<ApiServiceImpl>(
      ApiServiceImpl(dio: locator.get<Dio>()));
  locator.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<CategoryRepositoryImpl>(
      CategoryRepositoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<DishRepositoryImpl>(
      DishRepositoryImpl(service: locator.get<ApiServiceImpl>()));
}
