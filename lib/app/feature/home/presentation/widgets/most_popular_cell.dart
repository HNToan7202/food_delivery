import 'package:flutter/material.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../../../common/color_extension.dart';
import '../../../restaurant/data/model/restaurant_model.dart';

class MostPopularCell extends StatelessWidget {
  final Restaurant? mObj;
  final VoidCallback onTap;
  const MostPopularCell({super.key, required this.mObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mObj?.logo == null
                ? Image.asset(
                    Assets.images.logo.path,
                    width: 220,
                    height: 130,
                    fit: BoxFit.cover,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      mObj?.logo,
                      width: 220,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(
              height: 8,
            ),
            Text(
              mObj?.name ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColorScheme.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  mObj?.address ?? "",
                  textAlign: TextAlign.center,
                  style: tStyle.PrS(color: AppColorScheme.secondaryText),
                ),
                Text(" . ",
                    textAlign: TextAlign.center,
                    style: tStyle.PrS(
                      color: AppColorScheme.kPrimary,
                    )),
                Text(
                  mObj?.description ?? "",
                  textAlign: TextAlign.center,
                  style: tStyle.PrS(color: AppColorScheme.secondaryText),
                ),
                const SizedBox(
                  width: 8,
                ),
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
                  "5",
                  textAlign: TextAlign.center,
                  style: tStyle.PrS(color: AppColorScheme.kPrimary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
