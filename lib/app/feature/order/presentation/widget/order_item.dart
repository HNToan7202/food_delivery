// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery/app/feature/order/data/model/order_response.dart';

import '../../../../../common/color_extension.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/text_theme.dart';
import '../../../../../gen/assets.gen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final Order orderItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OrderColum(
                order: orderItem,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "Xoá Đơn Hàng",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColorScheme.kPrimary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColorScheme.kPrimary,
                          borderRadius: BorderRadius.circular(16)),
                      child: const Text("Đặt Hàng",
                          style: TextStyle(color: AppColorScheme.inkWhite),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OrderColum extends StatelessWidget {
  const OrderColum({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return OrderRow(order: order);
  }
}

class OrderRow extends StatelessWidget {
  const OrderRow({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order? order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: order?.restaurantAvatar == null
              ? const SizedBox(
                  width: 170,
                  height: 140,
                )
              : Image.network(
                  order?.restaurantAvatar ?? "",
                  width: 170,
                  height: 140,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              order?.restaurantName ?? "",
              style: tStyle.H5(),
            ),
            const SizedBox(height: 8),
            Text("${order?.dishes.length ?? "Load"} món ăn",
                style: tStyle.PrL()),
            Text("Vị trí: 2.4km", style: tStyle.PrL()),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  MoneyUtils.vndDong(order?.totalPrice ?? 0),
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16),
                order?.status == "UNPURCHASED"
                    ? const SizedBox()
                    : Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColorScheme.kPrimary,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "Paid",
                          style: TextStyle(color: AppColorScheme.inkWhite),
                        ),
                      ),
              ],
            )
          ],
        )
      ],
    );
  }
}
