import 'package:flutter/material.dart';

class CustomizeAppBar extends State<StatefulWidget> {
  static Color currentColor = const Color.fromARGB(255, 45, 64, 65);

  static setNewColor({Color? newColor}) {
    if (newColor != null) {
      currentColor = newColor;
    }
  }

  @override
  void initState() {
    super.initState();
    setNewColor();
  }
  AppBar createCustomizeAppBar(String title,{List<Widget>? actionsIcons}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: currentColor,
      title: Center(child: Text(title)),
      elevation: 50,
      actions: actionsIcons ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
