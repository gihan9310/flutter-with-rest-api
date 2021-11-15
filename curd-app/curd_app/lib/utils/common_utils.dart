import 'package:flutter/cupertino.dart';

// const primaryColor =Color(0x)
import 'package:flutter/material.dart';

var gradian = BoxDecoration(
  // ignore: prefer_const_constructors
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Colors.orange,
      Colors.indigo,
    ],
  ),
  borderRadius: BorderRadius.circular(15),
);

var gradian2 = BoxDecoration(
  // ignore: prefer_const_constructors
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Colors.indigo,
      Colors.orange,
    ],
  ),
  borderRadius: BorderRadius.circular(15),
);

var mainBox = const BoxDecoration(
  // ignore: prefer_const_constructors
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Colors.blue,
      Colors.red,
    ],
  ),
);

var rountButton =  BoxDecoration(
  // ignore: prefer_const_constructors
  borderRadius: BorderRadius.circular(60),
  gradient: const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Colors.blue,
      Colors.black,
    ],
  ),
);

var rountButton2 =  BoxDecoration(
  // ignore: prefer_const_constructors
  borderRadius: BorderRadius.circular(30),
  gradient: const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    // ignore: prefer_const_literals_to_create_immutables
    colors: [
      Colors.blue,
      Colors.black,
    ],
  ),
);