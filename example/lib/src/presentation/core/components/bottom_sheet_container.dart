// This is code generated via package:base_application/initialize.dart
 
import 'package:example/src/utils/color_util.dart';
import 'package:flutter/material.dart';

/// A widget to use as a parent of a bottom sheet's content
/// This add rounded corners at topRight and topLeft.
/// You can also provide a custom background color.
class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer(
      {Key? key,
      required this.child,
      this.width,
      this.height = 240,
      this.duration,
      this.padding = EdgeInsets.zero,
      this.backgroundColor })
      : assert(child != null),
        assert(backgroundColor != null),
        super(key: key);

  static const double borderRadius = 8;

  final Widget child;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final Duration? duration;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        decoration: BoxDecoration(
            color:  backgroundColor??kBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            )),
        width: width,
        height: height,
        padding: padding,
        duration: duration ?? Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: child,
      );
}


