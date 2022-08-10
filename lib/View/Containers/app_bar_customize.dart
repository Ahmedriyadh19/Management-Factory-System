import 'package:flutter/material.dart';

createCustomizeAppBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 45, 64, 65),
    title: Center(child: Text(title)),
    elevation: 50,
  );
}
