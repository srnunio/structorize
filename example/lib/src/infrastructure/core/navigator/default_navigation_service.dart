// This is code generated via package:base_application/start.dart

import 'package:example/src/domain/core/navigator/navigation_service.dart';
import 'package:example/src/presentation/core/transparent_page_route.dart';
import 'package:flutter/material.dart';

class DefaultNavigationService extends NavigationService {
  DefaultNavigationService(GlobalKey<NavigatorState> navigator)
      : super(navigator);

  @override
  Future<dynamic> navigateToPushNamed(String routeName,
      {Object? arguments}) async {
    return await navigator.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceRouteName(String routeName,
      {Object? arguments}) async {
    return await navigator.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> navigateToPushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) async {
    return await navigator.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  @override
  Future navigateToPop({Object? object}) async {
    return navigator.currentState!.pop(object);
  }

  @override
  Future navigatePush({required Widget page}) async {
    return await navigator.currentState!.push(TransparentPageRoute(
      builder: (_) => page,
    ));
  }
}
