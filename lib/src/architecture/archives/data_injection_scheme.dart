const ABSTRANCT_INJECTION_MODULE_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'package:flutter/material.dart'; 
import 'package:injectable/injectable.dart'; 

@module
abstract class InjectableModule {
  @lazySingleton
  GlobalKey<NavigatorState> get key => GlobalKey<NavigatorState>(); 
}
''';

const  INJECTION_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'config.dart'; 

T inject<T extends Object>() => Config.getInstance().get<T>();

''';

const  CONFIG_APP_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:packageName/src/domain/core/navigator/navigation_service.dart'; 
import 'package:packageName/src/infrastructure/core/navigator/default_navigation_service.dart'; 
import 'injectable_module.dart';

final _injector = GetIt.instance;

class InjectorModule extends InjectableModule {}

class Config {
  final SharedPreferences _preferences;
  final Dio _dio;

  Config._(this._preferences, this._dio) {
    registerServices();
    registerRepositories();
    registerViewModels();
  }

  factory Config.initialize(SharedPreferences preferences, Dio dio) =>
      Config._(preferences, dio);

  static GetIt getInstance() => _injector;

  void registerServices() {
    final module = InjectorModule(); 

    _injector.registerLazySingleton<NavigationService>(
        () => DefaultNavigationService(module.key));
  }

  void registerViewModels() {
    // example
    // _injector.registerFactory(() => DemoViewModel(_injector.get<DemoRepository>()));
  }

  void registerRepositories() {
    // example
    // _injector.registerFactory<DemoRepository>(() => BaseDemoRepository(_dio)); 
  }
}

''';

