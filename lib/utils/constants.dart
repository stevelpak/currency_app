import 'package:flutter/material.dart';

TextStyle kTextStyle(
    {Color? color,
    double size = 14,
    FontWeight fontWeight = FontWeight.w500,
    double? letterSpacing,
    double? height}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

ButtonStyle buttonStyle({
  Color? color,
  Color? shadowColor,
  double? elevation,
  EdgeInsets? padding,
  double? borderRadius,
  BorderSide? side,
  Size? size,
}) {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      shadowColor: MaterialStateProperty.all(shadowColor),
      elevation: MaterialStateProperty.all(elevation),
      padding: MaterialStateProperty.all(padding),
      minimumSize: MaterialStateProperty.all(size),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            side: side ?? BorderSide.none),
      ));
}
