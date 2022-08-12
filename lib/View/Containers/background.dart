import 'package:flutter/material.dart';

class Background {
  final Widget? widget;
  static Color currentColor = const Color(0x002d4041);

  Background({this.widget});

  static setNewColor(Color newColor) {
    return <Color>[
      currentColor = newColor.withOpacity(0),
      currentColor = newColor.withOpacity(0.25),
      currentColor = newColor.withOpacity(0.4),
      currentColor = newColor.withOpacity(0.6),
      currentColor = newColor.withOpacity(0.8),
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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(child: widget),
    );
  }
}
