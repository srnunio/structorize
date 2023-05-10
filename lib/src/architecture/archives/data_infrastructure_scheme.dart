const API_ENDPOINTS_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
abstract class ApiEndpoints { 
  static const String _host = 'WRITE HERE YOUR HOST';
  static const String _baseUrl = 'https://\$_host';
  static const String apiBaseUrl = '\$_baseUrl/CURRENT API VERSION';
}
''';

const DIO_BUILDER_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'api_endpoints.dart';

class DioBuilder {
  late String _baseUrl;
  final List<Interceptor> _interceptors = [];
  Duration _timeout = Duration.zero;

  void setBaseUrl(String baseUrl) {
    ArgumentError.checkNotNull(baseUrl, 'baseUrl');
    _baseUrl = baseUrl;
  }

  void addInterceptors(Iterable<Interceptor> interceptors) {
    ArgumentError.checkNotNull(interceptors, 'interceptors');
    _interceptors.addAll(interceptors);
  }

  void setTimeout(Duration timeout) {
    ArgumentError.checkNotNull(timeout, 'timeout');
    _timeout = timeout;
  }

  Dio build() {
    final dio = Dio();

    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = _timeout;
    dio.options.sendTimeout = _timeout;
    dio.options.receiveTimeout = _timeout;
    dio.interceptors.addAll(_interceptors);

    final defaultClient = DefaultHttpClientAdapter();
    defaultClient.onHttpClientCreate = (httpClient) {
      httpClient.badCertificateCallback =
          (_, host, __) => host == ApiEndpoints.apiBaseUrl;
    };

    dio.httpClientAdapter = defaultClient;
    return dio;
  }
}

''';


const IMPLEMENTATION_NAVIGATOR_SERVICE_SCHEME  = '''
// This is code generated via package:base_application/initialize.dart

import 'package:packageName/src/domain/core/navigator/navigation_service.dart';
import 'package:packageName/src/presentation/core/transparent_page_route.dart';
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
''';

const IMPLEMENTATION_NETWORK_INFO_SCHEME  = '''
// DO NOT EDIT. This is code generated via package:not_repeat/initialize.dart

import 'package:packageName/src/domain/core/network/network_info.dart';
import 'package:connectivity/connectivity.dart';

class DefaultNetworkInfo extends NetworkInfo {
  DefaultNetworkInfo(Connectivity connectivity) : super(connectivity);

  @override
  Future<bool> get isConnected async =>
      (await connectivity.checkConnectivity()) != ConnectivityResult.none;
}
''';