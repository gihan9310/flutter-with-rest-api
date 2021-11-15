import 'package:flutter/material.dart';

class CustomInuput extends StatelessWidget {
  const CustomInuput({
    required this.controller,
    this.icon,
    this.hintText,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  final controller;
  final IconData? icon;
  final hintText;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        // if(1==2)
        // prefixIcon: Icon(icon),
        hintText: hintText,
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(15),
        //     borderSide: BorderSide.none),
        // contentPadding: const EdgeInsets.symmetric(
        //   vertical: 5.0,
        //   horizontal: 5,
        // ),
      ),
    );
  }
}
