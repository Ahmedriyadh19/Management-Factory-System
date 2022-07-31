import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget widget;
  const Background({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 90, 106, 107),
        Color.fromARGB(255, 80, 106, 107),
        Color.fromARGB(255, 70, 106, 107),
        Color.fromARGB(255, 60, 106, 107),
        Color.fromARGB(255, 20, 32, 34)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(child: widget),
    );
  }
}
