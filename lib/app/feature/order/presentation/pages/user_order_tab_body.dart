import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/data/model/order_status_req.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/empty_page.dart';
import '../widget/order_item.dart';

class UserOrderTabBody extends StatefulWidget {
  const UserOrderTabBody({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  State<UserOrderTabBody> createState() => _UserOrderTabBodyState();
}

class _UserOrderTabBodyState extends State<UserOrderTabBody> {
  @override
  void initState() {
    super.initState();
    onFetchData();
  }

  void onFetchData() {
    context.read<OrderCubit>().getOrderByStatus(
          OrderStatus(
            page: "1",
            size: '10',
            status: widget.status,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfcf6ef),
      body: RefreshIndicator(
        color: AppColorScheme.kPrimary,
        onRefresh: () async {
          onFetchData();
        },
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoaded) {
              final orders = state.orders;
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
              return const PageEmpty();
            }
            return Shimmer.fromColors(
              baseColor: AppColorScheme.inkDarkGray,
              highlightColor: AppColorScheme.inkLightGray,
              child: const OrderRow(order: null),
            );
          },
        ),
      ),
    );
  }
}
