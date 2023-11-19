import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/cubit/restaurant_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/page/res_detail_body.dart';
import '../../data/model/restaurant_model.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.res});
  static const routeName = "/restaurantDetail";

  final Restaurant res;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantCubit()..getDishByRestaurantId(res.id, "0", "10"),
      child: SafeArea(
        child: Scaffold(
          body: ResDetailBody(
            res: res,
          ),
        ),
      ),
    );
  }
}
