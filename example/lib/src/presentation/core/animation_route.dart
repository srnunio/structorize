// This is code generated via package:base_application/start.dart
import 'package:flutter/material.dart';
 
class AnimationRouterPager extends MaterialPageRoute {
  WidgetBuilder builder;

  AnimationRouterPager({required this.builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
