

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_pallete.dart';

extension Scale on BuildContext {
  double get textScale => MediaQuery.of(this).textScaleFactor;
}

class Styles {
  static double _textScale(
      BuildContext context,
      ) {
    //print(MediaQuery.of(context).textScaleFactor);
    return MediaQuery.of(context).textScaleFactor > 1.0
        ? 0.9
        : MediaQuery.of(context).textScaleFactor;
  }

  // static TextStyle plusJakartaSansBlack(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     color: color ?? AppColors.blackColor,
  //     fontFamily: "Lato Black",
  //   );
  // }

  static TextStyle openSansStdBold(BuildContext context,
      {double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        double? letterSpacing}) {
    return TextStyle(
        fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.whiteColor,
        fontFamily: "OpenSans Bold",
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle openSansRegular(BuildContext context,
      {double? fontSize,
        Color? color,
        FontStyle? fontStyle,
        double height = 1.4,
        FontWeight fontWeight = FontWeight.normal,
        double? letterSpacing}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? 0,
        fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
        color: color ?? AppColors.whiteColor,
        fontFamily: "OpenSans Regular",
        height: height,
        fontStyle: fontStyle,
        fontWeight: fontWeight);
  }

  static TextStyle openSansStdMedium(BuildContext context,
      {double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      color: color ?? AppColors.whiteColor,
      fontFamily: "OpenSans Medium",
    );
  }
}
