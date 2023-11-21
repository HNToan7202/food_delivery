import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/order_body.dart';
import 'package:food_delivery/common/color_extension.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int current = 0;

  @override
  void initState() {
    super.initState();
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
        body: const OrderBody());
  }
}
