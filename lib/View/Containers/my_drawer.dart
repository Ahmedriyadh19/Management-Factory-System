import 'package:flutter/material.dart';

class MyDrawer {
  static Color currentColor = const Color.fromARGB(255, 45, 64, 65);

  static setNewColor(Color newColor) {
    currentColor = newColor;
  }

  static Drawer createCustomizeDrawer(List<Widget> up, List<Widget> down) {
    up.insert(
      0,
      Container(
        height: 200,
        color: currentColor.withOpacity(0.95),
      ),
    );
    return Drawer(
      backgroundColor: currentColor.withOpacity(0.9),
      elevation: 50,
      child: SizedBox(
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: up,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: down,
              )
            ]),
      ),
    );
  }
}
