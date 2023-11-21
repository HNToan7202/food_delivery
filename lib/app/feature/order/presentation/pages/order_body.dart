import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/user_order_tab.dart';
import '../../data/model/order_status.dart';
import '../widget/app_tab_bar.dart';
import '../widget/tab_bar_wrapper.dart';

// class OrdersBody extends StatelessWidget {
//   const OrdersBody({
//     Key? key,
//     required this.orderStatus,
//   }) : super(key: key);

//   final OrderStatusState orderStatus;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OrderCubit()
//         ..getOrderByStatus(
//             OrderStatus(page: "1", size: "10", status: orderStatus.name)),
//       child: Scaffold(
//         body: BlocBuilder<OrderCubit, OrderState>(
//           builder: (context, state) {
//             if (state is OrderLoaded) {
//               final orders = state.orders;
//               return ListView.separated(
//                   itemBuilder: ((context, index) {
//                     var order = orders[index];
//                     return const OrderItem();
//                   }),
//                   separatorBuilder: ((context, index) => const Divider()),
//                   itemCount: orders.length);
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class OrderBody extends StatefulWidget {
  const OrderBody({super.key});

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return DefaultTabController(
          length: OrderStatusState.values.length,
          child: Column(
            children: [
              TabBarWrapperUnderLine(
                child: AppTabBar(
                  onTap: (status) {
                    // context.read<OrderCubit>().tabStatus(status);
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  tabs: OrderStatusState.values.toList().asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return Tab(
                        child: BlocBuilder<OrderCubit, OrderState>(
                          builder: (context, state) {
                            // final count = state.orderStatusCountMap?[item];
                            // return '${item.displayValue} ${(count ?? 0) > 0 ? '($count)' : ''}'
                            //     .tr()
                            //     .text
                            //     .make();
                            return Text(item.displayValue);
                          },
                        ),
                      );
                    },
                  ).toList(),
                  isScrollable: true,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: OrderStatusState.values
                      .map<Widget>((orderStatus) =>
                          UserOrderTab(status: orderStatus.name))
                      .toList(), // Convert the Iterable<Widget> to List<Widget>
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
