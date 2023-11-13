import 'package:flutter/material.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../../../common/color_extension.dart';

class RecentItemRow extends StatelessWidget {
  final Map rObj;
  final VoidCallback onTap;
  const RecentItemRow({super.key, required this.rObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                rObj["image"].toString(),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rObj["name"],
                    textAlign: TextAlign.center,
                    style: tStyle.PrL(
                        color: AppColorScheme.primaryText,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(rObj["type"],
                          textAlign: TextAlign.center,
                          style: tStyle.PrS(
                            color: AppColorScheme.secondaryText,
                          )),
                      Text(
                        " . ",
                        textAlign: TextAlign.center,
                        style: tStyle.PrS(
                          color: AppColorScheme.kPrimary,
                        ),
                      ),
                      Text(
                        rObj["food_type"],
                        textAlign: TextAlign.center,
                        style: tStyle.PrS(
                          color: AppColorScheme.secondaryText,
                        ),
                      )
                    ],
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
                      Text(rObj["rate"],
                          textAlign: TextAlign.center,
                          style: tStyle.PrS(
                            color: AppColorScheme.kPrimary,
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("(${rObj["rating"]} Ratings)",
                          textAlign: TextAlign.center,
                          style: tStyle.PrSS(
                            color: AppColorScheme.secondaryText,
                          )),
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
