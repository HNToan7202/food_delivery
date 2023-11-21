import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

import 'app_tab_bar_theme.dart';

class TabBarWrapperUnderLine extends StatelessWidget {
  const TabBarWrapperUnderLine({
    super.key,
    required this.child,
    this.themeData,
    this.borderRadius,
    this.defaultLineColor,
    this.defaultLineWidth,
  });

  final Widget child;
  final ThemeData? themeData;
  final Color? defaultLineColor;
  final double? defaultLineWidth;

  // Wrapper style
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData ??
          AppTabBarTheme.getTabUnderlineIndicator(
            context,
          ).copyWith(
            highlightColor: AppColorScheme.kPrimary,
            splashColor: AppColorScheme.kPrimary,
          ),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColorScheme.inkWhite,
                  width: defaultLineWidth ?? 3,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
