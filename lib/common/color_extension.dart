// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery/common/theme_provider.dart';
import 'package:provider/provider.dart';

class AppColorScheme {
  final Color primary;
  final Color secondary;
  final Color success;
  final Color error;
  final Color warning;
  const AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.error,
    required this.warning,
  });
  static const AppColorScheme light = AppColorScheme(
    primary: Color(0XFFE3562A),
    secondary: Color(0XFF65AAEA),
    success: Color(0XFF5BA092),
    error: Color(0XFFEF4949),
    warning: Color(0XFFF2A03F),
  );
  static const AppColorScheme dark = AppColorScheme(
    primary: Color(0XFF2A2A6D),
    secondary: Color(0XFF65AAEA),
    success: Color(0XFF5BA092),
    error: Color(0XFFEF4949),
    warning: Color(0XFFF2A03F),
  );

  static const Color inkBlueAccent = Color(0XFFE6EDF4);
  static const Color inkDark = Color(0XFF3C3A36);
  static const Color inkDarkGray = Color(0XFF78746D);
  static const Color inkGray = Color(0XFFBEBAB3);
  static const Color inkLightGray = Color(0XFFF8F2EE);
  static const Color inkWhite = Color(0XFFFFFFFF);
  static const Color text = Color(0XFF10182B);
  static Color get kPrimary => const Color(0xffFC6011);
  static Color get primaryText => const Color(0xff4A4B4D);
  static Color get secondaryText => const Color(0xff7C7D7E);
  static Color get textfield => const Color(0xffF2F2F2);
  static Color get placeholder => const Color(0xffB6B7B7);
  static Color get white => const Color(0xffffffff);
  static Color get bg => const Color(0xFff5f5f5);
}
