import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/color_extension.dart';
import '../../../restaurant/data/model/res_dish_response.dart';

class PopularRestaurantRow extends StatelessWidget {
  final Dish menuItems;
  final VoidCallback onTap;
  const PopularRestaurantRow(
      {super.key, required this.menuItems, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              menuItems.image,
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItems.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColorScheme.primaryText,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
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
                        "menuItems.rate.toString()",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.kPrimary, fontSize: 11),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Ratings)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.secondaryText, fontSize: 11),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        menuItems.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.secondaryText, fontSize: 11),
                      ),
                      Text(
                        " . ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.kPrimary, fontSize: 11),
                      ),
                      Text(
                        menuItems.price.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColorScheme.secondaryText, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
