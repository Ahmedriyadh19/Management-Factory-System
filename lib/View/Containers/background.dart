import 'package:flutter/material.dart';

class Background {
  final Widget? widget;
  static Color currentColor = const Color(0x002d4041);

  static Color getColor() {
    return currentColor;
  }

  Background({this.widget});

  static setNewColor(Color newColor) {
    return <Color>[
      currentColor = newColor.withOpacity(0),
      currentColor = newColor.withOpacity(0.25),
      currentColor = newColor.withOpacity(0.50),
      currentColor = newColor.withOpacity(0.75),
      currentColor = newColor.withOpacity(1),
    ];
  }

  Container build() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: setNewColor(currentColor),
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Center(child: widget),
    );
  }
}
