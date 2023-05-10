// This is code generated via package:base_application/initialize.dart
import 'package:example/src/presentation/core/functions.dart';
import 'package:example/src/utils/color_util.dart'; 
import 'package:example/src/utils/size_util.dart';
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
