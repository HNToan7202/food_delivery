// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'color_extension.dart';

class AppTextTheme {
  final TextStyle regular;
  const AppTextTheme({required this.regular});

  factory AppTextTheme.create({color = Colors.white}) {
    return AppTextTheme(
      regular: TextStyle(
        height: 1.0,
        fontSize: 24,
        color: color,
      ),
    );
  }
}

const tStyle = TextStyle();

extension TextStyle$ on TextStyle {
  TextStyle H1({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 56,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w700,
        height: 1.05,
        letterSpacing: -1,
      );
  TextStyle H2({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 40,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -1,
      );

  TextStyle H3({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 32,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w700,
        height: 1.31,
        letterSpacing: -1,
      );
  TextStyle T3({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 28,
        fontFamily: 'Metropolis',
        fontWeight: FontWeight.w800,
        height: 1.31,
        letterSpacing: -1,
      );
  TextStyle H4(
          {Color color = AppColorScheme.text,
          FontWeight fontWeight = FontWeight.w500}) =>
      copyWith(
        color: color,
        fontSize: 24,
        fontFamily: 'Rubik',
        fontWeight: fontWeight,
        height: 1.33,
        letterSpacing: -0.50,
      );
  TextStyle H5(
          {Color color = AppColorScheme.text,
          FontWeight fontWeight = FontWeight.w500}) =>
      copyWith(
        color: color,
        fontSize: 20,
        fontFamily: 'Rubik',
        fontWeight: fontWeight,
        height: 1.30,
        letterSpacing: -0.50,
      );
  TextStyle PrL({
    Color color = AppColorScheme.text,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      copyWith(
        color: color,
        fontSize: 16,
        fontFamily: 'Rubik',
        fontWeight: fontWeight,
        height: 1.62,
        letterSpacing: -0.50,
      );
  TextStyle PrM(
          {Color color = AppColorScheme.text,
          FontWeight fontWeight = FontWeight.w400}) =>
      copyWith(
        color: color,
        fontSize: 14,
        fontFamily: 'Rubik',
        fontWeight: fontWeight,
        height: 1.50,
      );

  TextStyle PrS({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 12,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        height: 1.50,
      );
  TextStyle PrSS({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 11,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        height: 1.50,
      );
  TextStyle BtnL({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 18,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        height: 1.22,
        letterSpacing: -0.50,
      );
  TextStyle BtnM({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 16,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        height: 1.12,
      );
  TextStyle BtnS({Color color = AppColorScheme.text}) => copyWith(
        color: color,
        fontSize: 14,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        height: 1.14,
      );
}
