import 'package:flutter/material.dart';

class MyColors {
  static Color myColorContainer = const Color.fromARGB(255, 231, 106, 34);
  static Color myColorFont = const Color.fromARGB(255, 0, 0, 0);
  static Color myColorIcon = const Color.fromARGB(255, 0, 0, 0);
  static Color myColorHover = const Color.fromARGB(255, 92, 230, 57);
  static Color myColorSelected = const Color.fromARGB(255, 233, 57, 57);

  static void setNewColorContainer(Color newColor) {
    myColorContainer = newColor;
  }

  static void setNewColorFonts(Color newColor) {
    myColorFont = newColor;
  }

  static void setNewColorIcons(Color newColor) {
    myColorIcon = newColor;
  }

  static void setNewColorHover(Color newColor) {
    myColorHover = newColor;
  }

  static void setNewColorSelected(Color newColor) {
    myColorSelected = newColor;
  }
}
