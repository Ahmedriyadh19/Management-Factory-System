import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add/add_page.dart';
import 'package:management_factory_system/View/Main%20Pages/Dashboard/dashboard.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete/delete_page.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit/edit_page.dart';
import 'package:management_factory_system/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<bool> isSelectedBtn = [false, false, false, false];

  static List<PopupMenuItem> addListOption = [];
  static List<PopupMenuItem> editListOption = [];
  static List<PopupMenuItem> deleteListOption = [];
  initializeOptionsMenuList() {
    setState(() {
      addListOption.add(createOption(Icons.person_add, 'Add Customer'));
      addListOption
          .add(createOption(Icons.document_scanner_rounded, 'Add Order'));
      addListOption.add(createOption(Icons.person_pin_rounded, 'Add Staff'));
      addListOption.add(createOption(Icons.payment_rounded, 'Add Income'));
      addListOption.add(createOption(Icons.money_off_rounded, 'Add outcome'));
      addListOption
          .add(createOption(Icons.insert_drive_file_rounded, 'Add Product'));

      editListOption.add(createOption(Icons.edit, 'Edit Customer'));
      editListOption
          .add(createOption(Icons.document_scanner_rounded, 'Edit Order'));
      editListOption.add(createOption(FontAwesomeIcons.safari, 'Edit Staff'));
      editListOption.add(createOption(Icons.payment_rounded, 'Edit Income'));
      editListOption.add(createOption(Icons.money_off_rounded, 'Edit outcome'));
      editListOption
          .add(createOption(Icons.insert_drive_file_rounded, 'Edit Product'));
    });
  }

  static List<Widget> wed = [
    const Dashboard(),
    const AddPage(),
    const EditPage(),
    const DeletePage()
  ];

  Widget currentWidget = wed[0];

  Drawer drawer(BuildContext ctx) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 50,
      child: ListView(children: [
        Container(
          height: 200,
          color: const Color.fromARGB(255, 7, 32, 34),
        ),
        line(Icons.dashboard_rounded, 'Dashboard', 0),
        line(Icons.add, 'Add', 1),
        line(Icons.edit_note_rounded, 'Edit', 2),
        line(Icons.delete_rounded, 'Delete', 3),
      ]),
    );
  }

  void selectedPage(int index) {
    setState(() {
      currentWidget = wed[index];
    });
  }

  ListTile line(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      hoverColor: Colors.blueAccent,
      selectedColor: const Color.fromARGB(255, 7, 114, 62),
      iconColor: Colors.black,
      selected: isSelectedBtn[index],
      onTap: () {
        setState(() {
          selectedPage(index);
          getSelectedBtn(index);
        });
      },
    );
  }

  void getSelectedBtn(int index) {
    for (int i = 0; i < isSelectedBtn.length; i++) {
      if (i != index) {
        isSelectedBtn[i] = false;
      } else {
        isSelectedBtn[i] = true;
      }
    }
  }

  PopupMenuItem createOption(IconData icon, String label) {
    return PopupMenuItem(
      value: label,
      child: ListTile(leading: Icon(icon), title: Text(label)),
    );
  }

  PopupMenuButton option(
      BuildContext ctx, IconData icon, List<PopupMenuEntry> optionsList) {
    return PopupMenuButton(
      icon: Icon(icon),
      itemBuilder: ((ctx) => optionsList),
    );
  }

  AppBar upBar(BuildContext ctx) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 45, 64, 65),
      title: const Text('Welcome'),
      actions: [
        upBarBtn(0, Icons.dashboard_rounded),
        option(ctx, Icons.add, addListOption),
        option(ctx, Icons.edit_note_rounded, editListOption),
        option(ctx, Icons.delete_rounded, deleteListOption),
        const SizedBox(
          width: 40,
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const MyApp()),
            );
          },
        )
      ],
    );
  }

  IconButton upBarBtn(int index, IconData icon) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        setState(() {
          selectedPage(index);
          getSelectedBtn(index);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeOptionsMenuList();
    return Scaffold(
        drawer: drawer(context),
        appBar: upBar(context),
        body: Background(
          widget: currentWidget,
        ));
  }
}
// new customer, new payment, new
