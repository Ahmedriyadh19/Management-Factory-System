import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/home.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static Color currentColorAppBar = const Color.fromARGB(255, 45, 64, 65);
  static Color currentColorBackground = const Color.fromARGB(255, 45, 64, 65);
  static Color pickerColor = const Color.fromARGB(255, 45, 64, 65);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  dialogChangeColor(BuildContext ctx, Color currentColor, int option) async {
    await showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              if (option == 0) {
                CustomizeAppBar.setNewColor(newColor: pickerColor);
                currentColorAppBar = pickerColor;
              } else if (option == 1) {
                currentColorBackground = pickerColor;
              }
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Home()));
            },
          ),
        ],
      ),
    );
  }

  Widget bodyPage(BuildContext ctx) {
    return Column(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 27, 44, 46))),
            onPressed: () => dialogChangeColor(ctx, currentColorAppBar, 0),
            child: const Text('AppBar')),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 27, 44, 46))),
            onPressed: () => dialogChangeColor(ctx, currentColorBackground, 1),
            child: const Text('Them')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context));
  }
}
