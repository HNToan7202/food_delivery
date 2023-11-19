import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status_req.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import '../../data/model/order_status.dart';
import '../widget/order_item.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  final OrderStatusState orderStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()
        ..getOrderByStatus(
            OrderStatus(page: "1", size: "10", status: orderStatus.name)),
      child: Scaffold(
        body: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoaded) {
              final orders = state.orders;
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    var order = orders[index];
                    return const OrderItem();
                  }),
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: orders.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
