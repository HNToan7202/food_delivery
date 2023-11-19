import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/text_theme.dart';
import '../../data/model/order_response.dart';
import '../../data/model/order_status.dart';
import '../widget/order_item.dart';
import 'order_app_bar.dart';
import 'order_body.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> items = [
    'UnPurchased',
    'Pending',
    'Confirmed',
    'Shipping',
    'Delivered',
    'Finished',
    'Cancelled',
  ];
  List<Order> orders = [];
  final List<Widget> _widgetOptions = const [
    OrdersBody(orderStatus: OrderStatusState.UNPURCHASED),
    OrdersBody(orderStatus: OrderStatusState.PENDING),
    OrdersBody(orderStatus: OrderStatusState.CONFIRMED),
    OrdersBody(orderStatus: OrderStatusState.SHIPPING),
    OrdersBody(orderStatus: OrderStatusState.DELIVERED),
    OrdersBody(orderStatus: OrderStatusState.FINISHED),
    OrdersBody(orderStatus: OrderStatusState.CANCELLED),
  ];

  int current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColorScheme.inkWhite,
          iconTheme: const IconThemeData(color: AppColorScheme.inkDark),
          title: Text(
            "Order",
            style: tStyle.H4(),
          )),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                tapBar(),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(child: _widgetOptions[current])
          ],
        ),
      ),
    );
  }

  SizedBox tapBar() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  height: 42,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    // border: current == index
                    //     ? Border.all(color: AppColorScheme.inkDark, width: 1)
                    //     : null,
                    color: current == index
                        ? AppColorScheme.kPrimary
                        : AppColorScheme.inkLightGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      items[index],
                      style: TextStyle(
                        color: current == index
                            ? AppColorScheme.inkWhite
                            : AppColorScheme.inkDarkGray,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
