// This is code generated via package:base_application/initialize.dart
 
import 'package:example/i18n/i18n.dart';
import 'package:example/src/app.dart';   
import 'package:example/src/infrastructure/core/http_client/api_endpoints.dart'; 
import 'package:example/src/infrastructure/core/http_client/dio_builder.dart'; 
import 'package:example/src/injection/config.dart'; 
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

