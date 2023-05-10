const APP_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:packageName/route.dart';
import 'package:packageName/src/domain/core/navigator/navigation_service.dart'; 
import 'package:packageName/src/utils/theme_util.dart';
import 'package:packageName/i18n/i18n.dart';
import 'package:packageName/src/injection/injection.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  @override
  Widget build(BuildContext context) {
    var navigatorKey = inject<NavigationService>().navigator;
    return MaterialApp(
      navigatorKey: navigatorKey,
      locale: I18n.currentLocate,
      supportedLocales: I18n.supportedLocales,
      localizationsDelegates: const [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback:
          (locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeUtil.lightTheme(),
      themeMode: ThemeMode.light ,
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
''';

const ROUTE_SCHEME = '''
// This is code generated via package:base_application/initialize.dart

import 'dart:io';
import 'package:packageName/src/presentation/core/animation_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:packageName/src/presentation/empty_screen.dart';
import 'package:packageName/src/presentation/splash_screen.dart';

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

''';

const MAIN_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:packageName/i18n/i18n.dart';
import 'package:packageName/src/app.dart';   
import 'package:packageName/src/infrastructure/core/http_client/api_endpoints.dart'; 
import 'package:packageName/src/infrastructure/core/http_client/dio_builder.dart'; 
import 'package:packageName/src/injection/config.dart'; 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';  


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
   
  await I18n.initialize(
      defaultLocale: Locale('en'),  
      supportLocales: [Locale('en'), Locale('pt')]  
  );
  
  var shared = await SharedPreferences.getInstance(); 

  final dio = DioBuilder()
    ..setBaseUrl(ApiEndpoints.apiBaseUrl) 
    ..setTimeout(const Duration(seconds: 20));

  Config.initialize(shared, dio.build());
 
  runApp(App());
}

''';

const PUBSPEC_SCHEME = ''' 
name: packageName
description: This is code generated via package:base_application/initialize.dart
publish_to: 'none' 

version: 1.0.0+1

environment:
  sdk: ">=2.16.1 <3.0.0"


dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # UI 
  cached_network_image: ^3.1.0
  cupertino_icons: ^1.0.5
  sliding_up_panel: ^2.0.0+1
  flutter_svg: ^1.1.6
  pull_to_refresh: ^2.0.0
  customized:
    git:
      url: https://github.com/EdvaldoMartins/customized

  # Dependency Injection
  get_it: ^7.1.2
  injectable:

  # Dart data class
  freezed_annotation: ^2.2.0
  freezed: ^2.3.2
  equatable: ^2.0.3

  # HTTP
  dio: ^5.0.2

  # Caching
  shared_preferences: ^2.0.13

  # State management
  mobx: ^2.0.1
  flutter_mobx: ^2.0.0

  # Misc
  dartz: ^0.10.0-nullsafety.1
  intl: ^0.17.0 
  json_annotation: ^4.0.1 

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0
  mobx_codegen: ^2.0.1+3
  build_runner: ^2.0.1
  json_serializable: ^6.6.1
  build_resolvers: ^2.0.1 
  gen_i18n: ^1.0.0
  
  # remove this 
  base_application:
    path: ../  

  # Testing
  mockito: ^5.0.10

# The following section is specific to Flutter.
flutter:
  uses-material-design: true
  assets:
    - assets/i18n/locale/
    - assets/images/
    - assets/icons/

  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto/Roboto-Light.ttf
        - asset: assets/fonts/Roboto/Roboto-Bold.ttf
          weight: 700
''';
