// This is code generated via package:base_application/start.dart
 
import 'package:example/src/utils/size_util.dart';
import 'package:example/src/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:example/src/presentation/core/components/base_component.dart';

class CustomIcon extends BaseComponent {
  double? size;
  Color? color;
  final bool isColor;

  CustomIcon(String icon, {this.size, this.color, this.isColor = false})
      : super(value: icon);

  @override
  Widget build(BuildContext context) {
   return SvgPicture.asset(
      'assets/icons/$value.svg',
      height: size ?? kIconSize,
      width: size ?? kIconSize,
      color: (isColor) ? null : color ?? kIconColor,
    );
  }
}

