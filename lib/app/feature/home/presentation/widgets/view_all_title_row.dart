import 'package:flutter/material.dart';
import 'package:food_delivery/common/text_theme.dart';

import '../../../../../common/color_extension.dart';

class ViewAllTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const ViewAllTitleRow({super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: tStyle.PrL(
              color: AppColorScheme.primaryText, fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: onView,
          child: Text(
            "Xem thêm",
            style: tStyle.PrM(color: AppColorScheme.kPrimary),
          ),
        ),
      ],
    );
  }
}
