// This is code generated via package:base_application/initialize.dart
 
import 'package:example/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:example/src/utils/color_util.dart';

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
