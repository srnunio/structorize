// This is code generated via package:base_application/start.dart

import 'dart:io';
import 'package:example/src/presentation/core/animation_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:example/src/presentation/empty_screen.dart';
import 'package:example/src/presentation/splash_screen.dart';

class CustomRouter {

  static Widget _getPage(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return SplashScreen();
      case EmptyScreen.route:
        return EmptyScreen();
      default:
        return SplashScreen();
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var page = _getPage(settings);

    return Platform.isIOS
        ? CupertinoPageRoute(builder: (_) => page)
        : AnimationRouterPager(builder: (_) => page);
  }
}

