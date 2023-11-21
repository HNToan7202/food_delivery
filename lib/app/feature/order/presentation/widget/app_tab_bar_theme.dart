import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static ThemeData getTabUnderlineIndicatorBoldText(
    BuildContext context, {
    EdgeInsetsGeometry? labelPadding,
  }) {
    return AppTabBarTheme.getTabUnderlineIndicator(
      context,
      labelStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w500),
      labelPadding: labelPadding,
    );
  }

  static ThemeData getTabUnderlineIndicator(
    BuildContext context, {
    TextStyle? labelStyle,
    TextStyle? unselectedLabelStyle,
    EdgeInsetsGeometry? labelPadding,
  }) {
    return Theme.of(context).copyWith(
      highlightColor: AppColorScheme.kPrimary,
      splashColor: AppColorScheme.kPrimary,
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3.0,
            color: AppColorScheme.kPrimary,
          ),
          insets: EdgeInsets.symmetric(horizontal: 0.0),
        ),
        labelColor: AppColorScheme.kPrimary,
        labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
        unselectedLabelStyle:
            unselectedLabelStyle ?? Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
