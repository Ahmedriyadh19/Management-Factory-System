import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/colors.dart';

class MyDrawer {
  static Drawer createCustomizeDrawer(List<Widget> up, List<Widget> down) {
    up.insert(
      0,
      Container(
        height: 200,
        color: MyColors.myColorContainer.withOpacity(0.5),
      ),
    );
    return Drawer(
      backgroundColor: MyColors.myColorContainer.withOpacity(0.9),
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
