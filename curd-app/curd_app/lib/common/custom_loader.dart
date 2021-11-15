import 'package:flutter/material.dart';

class OverfllowUI extends StatelessWidget {
  const OverfllowUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.white.withOpacity(0.8),
        child: Center(
          child: SizedBox(
              width: size.width/2,
              height: size.width/2,
              child: Image.asset('assets/icons/loader.gif')),
        ),
      ),
    );
  }
}
