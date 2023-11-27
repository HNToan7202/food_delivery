import 'package:flutter/material.dart';

import '../../../../../common/color_extension.dart';

class BtnUpDown extends StatelessWidget {
  const BtnUpDown({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {}),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: AppColorScheme.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColorScheme.kPrimary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
