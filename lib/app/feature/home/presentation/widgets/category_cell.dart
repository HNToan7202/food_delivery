import 'package:flutter/material.dart';
import 'package:food_delivery/common/text_theme.dart';

import '../../../../../common/color_extension.dart';

class CategoryCell extends StatelessWidget {
  final Map cObj;
  final VoidCallback onTap;
  const CategoryCell({super.key, required this.cObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                cObj["image"].toString(),
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              cObj["name"],
              textAlign: TextAlign.center,
              style: tStyle.PrM(
                  color: AppColorScheme.primaryText,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
