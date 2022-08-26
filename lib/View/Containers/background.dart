import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/colors.dart';

class Background {
  final Widget? widget;

  Background({this.widget});

  _setNewColor() {
    return <Color>[
      MyColors.myColorContainer.withOpacity(0.20),
      MyColors.myColorContainer.withOpacity(1),
    ];
  }

  Container build() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: _setNewColor(),
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Center(child: widget),
    );
  }
}
