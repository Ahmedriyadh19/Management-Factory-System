import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:management_factory_system/Controller/colors.dart';

class WindowsConfiguration {
  exitAction(BuildContext context) {
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                backgroundColor: MyColors.myColor.withOpacity(0.7),
                title: const Text('Do you really want to Exit?'),
                actions: [
                  Tooltip(
                    message: 'Yes',
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyColors.myColor.withOpacity(1))),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.black))),
                  ),
                  Tooltip(
                    message: 'No',
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyColors.myColor.withOpacity(1))),
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ]);
          });
    });
  }

  windowSize() {
    WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      DesktopWindow.setMinWindowSize(const Size(1000, 700));
    }
  }
}
