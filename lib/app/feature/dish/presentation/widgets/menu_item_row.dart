import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/home/domain/entities/menu_item.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../../../common/constants.dart';
import '../../data/model/dish_model.dart';
import '../../data/model/dish_response.dart';

class MenuItemRow extends StatelessWidget {
  final Dish? dish;
  final VoidCallback onTap;
  const MenuItemRow({super.key, required this.dish, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            (dish?.image == null
                ? Image.network(
                    "https://learn.microsoft.com/en-us/power-platform/guidance/creator-kit/media/shimmer.png",
                    width: double.maxFinite,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    dish?.image ?? "",
                    width: double.maxFinite,
                    height: 200,
                    fit: BoxFit.cover,
                  )),
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish?.name ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            Assets.images.rate.path,
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${dish?.quantity ?? 0}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorScheme.kPrimary, fontSize: 11),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Quantity : ${dish?.quantity ?? 0}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorScheme.white, fontSize: 11),
                          ),
                          Text(
                            " . ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorScheme.light.primary,
                                fontSize: 11),
                          ),
                          Text(
                            MoneyUtils.vndDong(dish?.price ?? 0),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorScheme.kPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
