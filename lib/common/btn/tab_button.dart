import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isSelected;
  const TabButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 15,
              height: 15,
              color: isSelected
                  ? AppColorScheme.kPrimary
                  : AppColorScheme.placeholder,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColorScheme.kPrimary
                    : AppColorScheme.placeholder,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
