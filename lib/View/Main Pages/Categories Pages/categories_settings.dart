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
  static Color pickerColor = MyColors.myColorContainer;

  /* static Color PickerColorContainer = MyColors.myColorContainer;
  static Color PickerColorFont = MyColors.myColorFont;
  static Color PickerColorIcon = MyColors.myColorIcon;
  static Color PickerColorHover = MyColors.myColorHover;
  static Color PickerColorSelected = MyColors.myColorSelected;*/

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void saveChange(int op) {
    setState(() {
      if (op == 0) {
        MyColors.setNewColorContainer(pickerColor);
      } else if (op == 1) {
        MyColors.setNewColorIcons(pickerColor);
      } else if (op == 2) {
        MyColors.setNewColorFonts(pickerColor);
      } else if (op == 3) {
        MyColors.setNewColorHover(pickerColor);
      } else {
        MyColors.setNewColorSelected(pickerColor);
      }
    });

    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Home()));
  }

  Future dialogChangeColor(BuildContext ctx, Color currentColor, int op) async {
    return await showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Pick a color!',
          style: TextStyle(color: MyColors.myColorFont),
        ),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.myColorContainer)),
            onPressed: () {
              saveChange(op);
            },
            child: Text(
              'Got it',
              style: TextStyle(color: MyColors.myColorFont),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyPage(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.myColorFont)),
        const SizedBox(height: 30),
        butts('Change Containers Color', 0),
        butts('Change Icons Color', 1),
        butts('Change Fonts Color', 2),
        butts('Change Hover Color', 3),
        butts('Change Selected Color', 4)
      ],
    );
  }

  ElevatedButton butts(String txt, int op) {
    return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.myColorContainer)),
        onPressed: () => {dialogChangeColor(context, pickerColor, op)},
        child: Text(txt, style: TextStyle(color: MyColors.myColorFont)));
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context)).build();
  }
}
