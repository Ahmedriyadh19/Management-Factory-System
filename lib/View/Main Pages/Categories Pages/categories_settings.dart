import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/home.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static Color pickerColor = MyColors.myColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void saveChange() {
    setState(() {
      MyColors.setNewColor(pickerColor);
    });

    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Home()));
  }

  Future dialogChangeColor(BuildContext ctx, Color currentColor) async {
    return await showDialog(
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
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(pickerColor)),
            onPressed: () {
              saveChange();
            },
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  Widget bodyPage(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        butts(
          'Change Color',
        ),
      ],
    );
  }

  ElevatedButton butts(String txt) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(pickerColor)),
        onPressed: () => {dialogChangeColor(context, pickerColor)},
        child: Text(txt, style: const TextStyle(color: Colors.black)));
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context)).build();
  }
}
