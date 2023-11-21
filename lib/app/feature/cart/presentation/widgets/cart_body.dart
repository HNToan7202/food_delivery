import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status.dart';

import '../../../../../common/color_extension.dart';
import '../../../order/data/model/order_status_req.dart';
import '../../../order/presentation/cubit/order_cubit.dart';
import '../../../order/presentation/widget/order_item.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  void onFetchData() {
    context.read<OrderCubit>().getOrderByStatus(
          OrderStatus(
            page: "1",
            size: '10',
            status: OrderStatusState.UNPURCHASED.name,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Giỏ hàng",
          style: TextStyle(
              color: AppColorScheme.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: AppColorScheme.white,
      ),
      body: RefreshIndicator(
        color: AppColorScheme.kPrimary,
        onRefresh: () async {
          onFetchData();
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoaded) {
              final orders = state.orders;
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              //   // Call your overlay function here
              //   showOverlay(context, orders.first);
              // });

              return ListView.separated(
                  itemBuilder: ((context, index) {
                    var order = orders[index];
                    return OrderItem(
                      orderItem: order,
                    );
                  }),
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: orders.length);
            }
            if (state is OrderNodata) {
              return const Center(
                child: Text("No data"),
              );
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
