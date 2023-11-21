import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/cart/presentation/widgets/cart_body.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status_req.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()
        ..getOrderByStatus(OrderStatus(
            page: "1", size: "10", status: OrderStatusState.UNPURCHASED.name)),
      child: const Scaffold(
        body: CartBody(),
      ),
    );
  }
}
