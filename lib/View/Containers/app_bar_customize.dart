import 'package:flutter/material.dart';

class CustomizeAppBar {
  static Color currentColor = const Color.fromARGB(255, 45, 64, 65);

  static setNewColor(Color newColor) {
    currentColor = newColor;
  }

  AppBar createCustomizeAppBar(String title, {List<Widget>? actionsIcons}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: currentColor,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Center(
          child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      )),
      elevation: 50,
      actions: actionsIcons ?? [],
    );
  }
}
