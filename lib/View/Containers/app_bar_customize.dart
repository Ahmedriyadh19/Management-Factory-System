import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/colors.dart';

class CustomizeAppBar {
  AppBar createCustomizeAppBar(String title, {List<Widget>? actionsIcons}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: MyColors.myColorContainer,
      iconTheme: IconThemeData(color: MyColors.myColorIcon),
      title: Center(
          child: Text(
        title,
        style: TextStyle(color: MyColors.myColorFont),
      )),
      elevation: 50,
      actions: actionsIcons ?? [],
    );
  }
}
