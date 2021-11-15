import 'package:flutter/material.dart';

class CustomLable extends StatelessWidget {
  const CustomLable({
    Key? key,
    required this.title,
    this.color = Colors.white,
    this.fontSize =18,
    this.fontWeight=FontWeight.normal
  }) : super(key: key);

  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
