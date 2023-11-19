import 'package:dio/dio.dart';
import 'package:food_delivery/app/feature/dish/data/repo/dish_repository_impl.dart';
import 'package:food_delivery/app/feature/home/data/repo/category_repository_impl.dart';
import 'package:food_delivery/app/feature/order/data/repo/order_repository_impl.dart';
import 'package:food_delivery/app/feature/profile/data/repo/user_repository_impl.dart';
import 'package:food_delivery/app/feature/reset_password/data/repo/reset_password_repository_impl.dart';
import 'package:food_delivery/app/feature/restaurant/data/repo/restaurant_repository_impl.dart';
import 'package:food_delivery/app/feature/sign_up/data/repo/account_repository_impl.dart';
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
  locator.registerSingleton<RestaurantRepositoryImpl>(
      RestaurantRepositoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<ResetPasswordRepositoryImpl>(
      ResetPasswordRepositoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<AccountRepoSitoryImpl>(
      AccountRepoSitoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<OrderRepositoryImpl>(
      OrderRepositoryImpl(service: locator.get<ApiServiceImpl>()));
  locator.registerSingleton<UserRepositoryImpl>(
      UserRepositoryImpl(service: locator.get<ApiServiceImpl>()));
}
