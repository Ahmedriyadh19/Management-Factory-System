import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/colors.dart';

class CustomizeAppBar {
  AppBar createCustomizeAppBar(String title, {List<Widget>? actionsIcons}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyColors.myColor,
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
