import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/cubit/restaurant_cubit.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../widgets/recent_item_row.dart';
import '../../data/model/restaurant_model.dart';
import '../cubit/restaurant_state.dart';

class ResDetailBody extends StatefulWidget {
  const ResDetailBody({super.key, required this.res});

  final Restaurant res;

  

  @override
  State<ResDetailBody> createState() => _ResDetailBodyState();
}

class _ResDetailBodyState extends State<ResDetailBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RestaurantInfo(widget: widget),
          const SizedBox(
            height: 8,
            width: double.infinity,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    Text("Menu", style: Theme.of(context).textTheme.headline6),
              ),
              const SizedBox(
                height: 8,
              ),
              MultiBlocListener(
                listeners: [
                  BlocListener<OrderCubit, OrderState>(
                    listener: (context, orderState) {
                      if (orderState is AddDishToOrderSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Add dish to order success")),
                        );
                      }
                    },
                  ),
                  BlocListener<RestaurantCubit, RestaurantState>(
                    listener: (context, restaurantState) {
                      // Xử lý sự kiện từ RestaurantCubit
                    },
                  ),
                ],
                child: BlocBuilder<RestaurantCubit, RestaurantState>(
                  builder: (context, restaurantState) {
                    if (restaurantState is RestaurantDishLoaded) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: restaurantState.dishes.length,
                        itemBuilder: (context, index) {
                          var dish = restaurantState.dishes[index];
                          return RecentItemRow(
                            dish: dish,
                            onTap: () {},
                          );
                        },
                      );
                    }
                    if (restaurantState is RestaurantNoData) {
                      return const Center(
                        child: Text("No data"),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ResDetailBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.images.res1.path),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.res.name,
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(
                height: 8,
              ),
              Text(widget.res.address,
                  style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(Assets.images.rate.path, width: 15, height: 15),
                  const SizedBox(
                    width: 4,
                  ),
                  Text("4.8", style: Theme.of(context).textTheme.caption),
                  const SizedBox(
                    width: 4,
                  ),
                  Text("(124 Review)",
                      style: Theme.of(context).textTheme.caption),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}