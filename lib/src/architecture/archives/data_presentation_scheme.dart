const BASE_COMPONENT_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:flutter/material.dart';

abstract class BaseComponent extends StatelessWidget {
  final String? value;

  BaseComponent({this.value});
}

''';

const ANIMATION_ROUTE_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
import 'package:flutter/material.dart';
 
class AnimationRouterPager extends MaterialPageRoute {
  WidgetBuilder builder;

  AnimationRouterPager({required this.builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
''';

const FUCNCTIONS_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:flutter/material.dart';
import 'package:packageName/src/utils/color_util.dart';
import 'package:packageName/src/utils/constants.dart';
 
/// custom decoration
BoxDecoration decoration(
    {Color? color,
    BoxBorder? border,
    double borderRadius = 0,
    DecorationImage? image,
    BoxShape shape = BoxShape.rectangle}) {
  return BoxDecoration(
      image: image,
      color: (color == null) ? kPlaceholderColor : color,
      shape: shape,
      border: border,
      borderRadius: (shape == BoxShape.rectangle)
          ? BorderRadius.circular(borderRadius)
          : null);
}

/// custom text style
TextStyle styleText({
  Color? color,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration? decoration,
  String? font,
}) {
  return TextStyle(
      fontFamily: font ?? fontName,
      fontSize: fontSize,
      color: color ?? kTitleColor,
      decoration: decoration,
      fontWeight: fontWeight);
}
''';

const APPBAR_WIDGET_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
import 'package:packageName/src/presentation/core/functions.dart';
import 'package:packageName/src/utils/color_util.dart'; 
import 'package:packageName/src/utils/size_util.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.customTitle,
    this.title = '',
    this.size = const Size(double.infinity, kToolbarHeight),
    this.bottom,
    this.style,
    this.backgroundColor,
    this.leading,
    this.actions,
    this.brightness,
    this.showHomeButton = true,
    this.centerTitle = true,
    this.showTransactionNotify = true,
  });

  final Widget? customTitle;
  final String title;
  final Size size;
  final List<Widget>? actions;
  final Widget? bottom;
  final TextStyle? style;
  final Widget? leading;
  final bool showHomeButton;
  final bool showTransactionNotify;
  final bool centerTitle;
  final Color? backgroundColor;
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    var backButton = BackButton(color: kPrimaryColor);

    return PreferredSize(
      child: AppBar(
        elevation: 0.0,
        brightness: brightness ?? Brightness.dark,
        backgroundColor: backgroundColor ?? kBackgroundColor,
        automaticallyImplyLeading: showHomeButton,
        centerTitle: centerTitle,
        leading:
            showHomeButton ? leading ?? BackButton(color: kPrimaryColor) : null,
        title: customTitle ??
            Text(
              title,
              style: style ?? styleText(fontSize: kSize20),
            ),
        actions: actions,
        bottom: PreferredSize(
          child: bottom ?? Container(),
          preferredSize: const Size(double.infinity, kSize10),
        ),
      ),
      preferredSize: size,
    );
  }

  @override
  Size get preferredSize => size;
}
''';

const SPLASH_SCREEN_SCHEME = '''
// This is code generated via package:base_application/initialize.dart

import 'dart:async';
import 'package:example/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:packageName/src/injection/injection.dart';
import 'package:packageName/src/domain/core/navigator/navigation_service.dart';
import 'package:packageName/src/presentation/empty_screen.dart';
import 'package:packageName/src/utils/color_util.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NavigationService _navigator = inject<NavigationService>();

  Future<Timer> goPage() async {
    return Timer(const Duration(seconds: 2), () async {
      _navigator.navigateToPushNamedAndRemoveUntil(EmptyScreen.route);
    });
  }

  @override
  void initState() {
    super.initState();
    goPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: kBackgroundColor),
        child: Container(
          color: kBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  LOGO,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

''';

const EMPTY_SCREEN_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:packageName/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:packageName/src/utils/color_util.dart';

class EmptyScreen extends StatefulWidget {
  static const route = '/emptyScreen';

  @override
  _EmptyScreenState createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('message'.translate)),
          ],
        ),
      ),
    );
  }
}
''';

const TRANSPARAENT_ROUTE_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:flutter/material.dart';

class TransparentPageRoute<T> extends PageRoute<T> {
  TransparentPageRoute({
    required this.builder,
    RouteSettings? routeSettings,
  })  : super(settings: routeSettings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final widget = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,

        explicitChildNodes: true,
        child: widget,
      ),
    );
  }
}


''';

const ICON_SVG_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:packageName/src/utils/size_util.dart';
import 'package:packageName/src/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:packageName/src/presentation/core/components/base_component.dart';

class CustomIcon extends BaseComponent {
  double? size;
  Color? color;
  final bool isColor;

  CustomIcon(String icon, {this.size, this.color, this.isColor = false})
      : super(value: icon);

  @override
  Widget build(BuildContext context) {
   return SvgPicture.asset(
      'assets/icons/\$value.svg',
      height: size ?? kIconSize,
      width: size ?? kIconSize,
      color: (isColor) ? null : color ?? kIconColor,
    );
  }
}

''';


const BOTTOM_SHEET_SCHEME = '''
// This is code generated via package:base_application/initialize.dart
 
import 'package:packageName/src/utils/color_util.dart';
import 'package:flutter/material.dart';

/// A widget to use as a parent of a bottom sheet's content
/// This add rounded corners at topRight and topLeft.
/// You can also provide a custom background color.
class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer(
      {Key? key,
      required this.child,
      this.width,
      this.height = 240,
      this.duration,
      this.padding = EdgeInsets.zero,
      this.backgroundColor })
      : assert(child != null),
        assert(backgroundColor != null),
        super(key: key);

  static const double borderRadius = 8;

  final Widget child;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final Duration? duration;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        decoration: BoxDecoration(
            color:  backgroundColor??kBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            )),
        width: width,
        height: height,
        padding: padding,
        duration: duration ?? Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: child,
      );
}


''';
