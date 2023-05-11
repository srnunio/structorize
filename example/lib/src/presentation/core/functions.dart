// This is code generated via package:base_application/start.dart
 
import 'package:flutter/material.dart';
import 'package:example/src/utils/color_util.dart';
import 'package:example/src/utils/constants.dart';
 
/// custom decoration
BoxDecoration decoration(
    {Color? color,
    BoxBorder? border,
    double borderRadius = 0,
    DecorationImage? image,
    BoxShape shape = BoxShape.rectangle}) {
  return BoxDecoration(
      image: image,
      color: (color == null) ? kPlaceholderColor : color,
      shape: shape,
      border: border,
      borderRadius: (shape == BoxShape.rectangle)
          ? BorderRadius.circular(borderRadius)
          : null);
}

/// custom text style
TextStyle styleText({
  Color? color,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration? decoration,
  String? font,
}) {
  return TextStyle(
      fontFamily: font ?? fontName,
      fontSize: fontSize,
      color: color ?? kTitleColor,
      decoration: decoration,
      fontWeight: fontWeight);
}
