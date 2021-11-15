import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorUtils {
  static void goTo({required BuildContext context, required Widget page}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
