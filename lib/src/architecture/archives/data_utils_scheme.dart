

const COLOR_UTIL_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'package:flutter/material.dart';

Color get kPrimaryColor => Color(0xFF00428D);

Color get kBackgroundColor => Colors.white;

Color get kIconColor => Color(0xFF00428D);

Color get kPlaceholderColor => Colors.grey[200]!;

Color get kTitleColor => Colors.black;

Color get kSubtitleTextColor => Colors.black;

Color get kProgressColor => Color(0xFF00428D);

''';

const SIZE_UTIL_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'package:flutter/material.dart';

const double _VerticalSpaceSmall = 10.0;

const double _VerticalSpaceMedium = 20.0;

const double _VerticalSpaceLarge = 60.0;

const double _HorizontalSpaceSmall = 10.0;

const double _HorizontalSpaceMedium = 20.0;

const double HorizontalSpaceLarge = 60.0;

const double kIconSize = 20.0;

const double kTitleSize = 16.0;

const double kSubtitleSize = 14.0;

const double kSize20 = 20.0;

const double kSize10 = 20.0;

const double kBorder = 8.0;

Widget verticalSpaceSmall() {
  return verticalSpace(_VerticalSpaceSmall);
}

Widget verticalSpaceMedium() {
  return verticalSpace(_VerticalSpaceMedium);
}

Widget verticalSpaceLarge() {
  return verticalSpace(_VerticalSpaceLarge);
}

Widget verticalSpace(double height) {
  return Container(height: height);
}

Widget horizontalSpaceSmall() {
  return horizontalSpace(_HorizontalSpaceSmall);
}

Widget horizontalSpaceMedium() {
  return horizontalSpace(_HorizontalSpaceMedium);
}

Widget horizontalSpaceLarge() {
  return horizontalSpace(HorizontalSpaceLarge);
}

Widget horizontalSpace(double width) {
  return Container(width: width);
}
''';


const THEME_UTIL_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
import 'package:flutter/material.dart';
import 'package:packageName/src/presentation/core/functions.dart';

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

''';

const CONSTANT_UTIL_SCHEME = '''
// This is code generated via package:structorize/start.dart
 
 String get fontName => 'Font';

 String get LOGO => 'image path';
 
''';
