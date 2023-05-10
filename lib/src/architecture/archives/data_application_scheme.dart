import '../../architecture/architecture.dart';

const SCHEME_BASE_VIEW_MODEL = '''
// This is code generated via package:base_application/initialize.dart

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:packageName/src/injection/injection.dart';
import 'package:packageName/src/domain/core/navigator/navigation_service.dart'; 

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _${'\$BaseViewModel'};

abstract class _BaseViewModel with Store {
  NavigationService get _navigation => inject<NavigationService>();

  @observable
  bool _isBusy = false;

  @computed
  bool get isBusy => _isBusy;

  final RefreshController refresh = new RefreshController(
    initialRefresh: false,
  );

  void onRefresh({bool value = false}) {
    if (value) {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => refresh.requestRefresh());
    } else {
      WidgetsBinding.instance!.addPostFrameCallback(
          (_) => refresh.refreshCompleted(resetFooterState: true));

      WidgetsBinding.instance!
          .addPostFrameCallback((_) => refresh.loadComplete());
    }
  }

  @action
  void setBusy(bool state) {
    _isBusy = state;
  }

  Future<dynamic> navigateToPushNamedAndRemoveUntil(
      {required String routeName, Object? arguments}) async {
    return await _navigation.navigateToPushNamedAndRemoveUntil(routeName,arguments: arguments);
  }

  Future<dynamic> navigateToPushNamed(
      {required String routeName, Object? arguments}) async {
    return await _navigation.navigateToPushNamed(routeName,
        arguments: arguments);
  }

  Future<dynamic> navigateToPop({Object? obj}) async {
    return await _navigation.navigateToPop(object: obj);
  }

  Future<dynamic> navigateToPush(
      {required Widget page, bool replace = false}) async {
    return await _navigation.navigatePush(page: page);
  }
}
''';
