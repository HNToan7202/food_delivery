import 'package:flutter/material.dart';

import '../../../../../common/color_extension.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/text_theme.dart';
import '../../../order/data/model/order_response.dart';
import 'btn_updown.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.dish,
  }) : super(key: key);

  final Dish? dish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(dish?.image ?? "",
                  width: 50, height: 50, fit: BoxFit.cover),
              const SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish?.dishName ?? ""),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    MoneyUtils.vndDong(dish?.price ?? 0),
                    style: tStyle.PrM(
                        fontWeight: FontWeight.bold,
                        color: AppColorScheme.kPrimary),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              const BtnUpDown(
                icon: Icon(
                  Icons.remove,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text("${dish?.quantity}"),
              const SizedBox(
                width: 10,
              ),
              const BtnUpDown(
                icon: Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
