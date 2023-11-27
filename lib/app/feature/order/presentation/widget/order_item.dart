// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:food_delivery/app/feature/order/data/model/order_response.dart';

import '../../../../../common/color_extension.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/text_theme.dart';
import '../../../checkout/presentation/page/checkout_page.dart';
import '../../data/model/order_status_req.dart';
import '../../data/model/remove_dish.dart';
import '../cubit/order_cubit.dart';

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
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Chi tiết",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColorScheme.kPrimary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CheckoutPage.routeName,
                            arguments: orderItem,
                          ).then((value) {
                            if (value != null) {
                              EasyLoading.showSuccess(
                                  "Đặt hàng thành công, vui lòng chờ xác nhận");
                              context.read<OrderCubit>().getOrderByStatus(
                                    OrderStatus(
                                      page: "1",
                                      size: '10',
                                      status: "UNPURCHASED",
                                    ),
                                  );
                            }
                          });
                        },
                        child: orderItem.status == "UNPURCHASED"
                            ? Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColorScheme.kPrimary,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Text("Đặt Hàng",
                                    style: TextStyle(
                                        color: AppColorScheme.inkWhite),
                                    textAlign: TextAlign.center),
                              )
                            : BtnHandler(
                                status: orderItem.status,
                                orderItem: orderItem,
                              )),
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

class BtnHandler extends StatelessWidget {
  const BtnHandler({
    Key? key,
    required this.status,
    required this.orderItem,
  }) : super(key: key);

  final String status;
  final Order orderItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (int i = 0; i < orderItem.dishes.length; i++) {
          context.read<OrderCubit>().removeDish(RemoveDishReq(
                dishId: orderItem.dishes[i].id.toString(),
                quantity: orderItem.dishes[i].quantity,
              ));
        }
        EasyLoading.showToast("Đã hủy đơn hàng");
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColorScheme.kPrimary,
            borderRadius: BorderRadius.circular(16)),
        child: const Text("Huỷ đơn hàng",
            style: TextStyle(color: AppColorScheme.inkWhite),
            textAlign: TextAlign.center),
      ),
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
              ],
            )
          ],
        )
      ],
    );
  }
}
