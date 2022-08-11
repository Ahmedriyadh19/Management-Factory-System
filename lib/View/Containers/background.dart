import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget widget;
  const Background({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            
        Color.fromARGB(255, 229, 214, 214),
        Color.fromARGB(255, 208, 173, 173),
        Color.fromARGB(255, 234, 171, 171),
        Color.fromARGB(255, 214, 137, 137),
      /*  Color.fromARGB(255, 90, 106, 107),
        Color.fromARGB(255, 80, 106, 107),
        Color.fromARGB(255, 70, 106, 107),
        Color.fromARGB(255, 60, 106, 107),
        Color.fromARGB(255, 20, 32, 34)*/
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(child: widget.widget),
    );
  }
}
