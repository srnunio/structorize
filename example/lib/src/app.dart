// This is code generated via package:base_application/start.dart
 
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:example/route.dart';
import 'package:example/src/domain/core/navigator/navigation_service.dart'; 
import 'package:example/src/utils/theme_util.dart';
import 'package:example/i18n/i18n.dart';
import 'package:example/src/injection/injection.dart';

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
