import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_window_close/flutter_window_close.dart';

class WindowsConfiguration {
  static Color currentColor = const Color.fromARGB(255, 45, 64, 65);
  static setNewColor(Color newColor) {
    currentColor = newColor;
  }

  exitAction(BuildContext context) {
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                backgroundColor: currentColor.withOpacity(0.7),
                title: const Text('Do you really want to Exit?'),
                actions: [
                  Tooltip(
                    message: 'Yes',
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                currentColor.withOpacity(1))),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.black))),
                  ),
                  Tooltip(
                    message: 'No',
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                currentColor.withOpacity(1))),
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
