import 'package:flutter/material.dart';

import '../../../../../common/color_extension.dart';
import '../../../../../common/text_theme.dart';
import '../../../../../gen/assets.gen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(Assets.images.item1.path),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Lemonade", style: tStyle.H5()),
                      const SizedBox(height: 8),
                      Text("2 items", style: tStyle.PrL()),
                      Text("Vị trí: 2.4km", style: tStyle.PrL()),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text(
                            "32.000đ",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16),
                          Container(
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
