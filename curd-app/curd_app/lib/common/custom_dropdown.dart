import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    required this.hintText,
    required this.list,
    required this.onchange,
    required this.controller,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final List<String> list;
  final Function(dynamic value) onchange;
  final controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextDropdownFormField(
      options: list,
      onChanged: onchange,
      findFn: (dynamic str) async => list,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: const Icon(Icons.arrow_drop_down),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.green, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          // ignore: prefer_const_constructors
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
