import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/cubit/restaurant_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/page/res_detail_body.dart';
import 'package:food_delivery/common/color_extension.dart';
import '../../data/model/restaurant_model.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.res});
  static const routeName = "/restaurantDetail";

  final Restaurant res;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantCubit>(
          create: (context) =>
              RestaurantCubit()..getDishByRestaurantId(res.id, "0", "10"),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit()..getCart(res.name),
        ),
        // Add more BlocProviders if needed
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, color: AppColorScheme.inkDark),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          title: Text(res.name, style: Theme.of(context).textTheme.headline6),
          backgroundColor: AppColorScheme.white,
        ),
        body: ResDetailBody(
          res: res,
        ),
      ),
    );
  }
}
