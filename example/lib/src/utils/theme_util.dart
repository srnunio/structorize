// This is code generated via package:base_application/start.dart
 
import 'package:flutter/material.dart';
import 'package:example/src/presentation/core/functions.dart';

import 'color_util.dart';
import 'constants.dart';

abstract class ThemeUtil {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: styleText(),
        headline2: styleText(),
        headline3: styleText(),
        headline4: styleText(),
        headline5: styleText(),
        headline6: styleText(),
        bodyText1: styleText(),
        bodyText2: styleText(),
        subtitle1: styleText(),
        subtitle2: styleText(),
        caption: styleText(),
      ).apply(bodyColor: kTitleColor, displayColor: kTitleColor),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: kBackgroundColor),
      accentColor: kPrimaryColor,
      primaryColor: kPrimaryColor,
      backgroundColor: kBackgroundColor,
      scaffoldBackgroundColor: kBackgroundColor,
      dialogBackgroundColor: kBackgroundColor,
      fontFamily: fontName,
      iconTheme: IconThemeData(color: kIconColor),
      textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: kBackgroundColor,
          iconTheme: IconThemeData(color: kIconColor)),
    );
  }
}

