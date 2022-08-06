import 'package:flutter/foundation.dart';
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
      addListOption.clear();
      editListOption.clear();
      deleteListOption.clear();

      addListOption
          .add(createOption(FontAwesomeIcons.userPlus, 'Add Customer', 4));
      addListOption
          .add(createOption(FontAwesomeIcons.fileInvoice, 'Add Order', 5));
      addListOption.add(createOption(FontAwesomeIcons.user, 'Add Staff', 6));
      addListOption.add(createOption(Icons.payment_rounded, 'Add Income', 7));
      addListOption
          .add(createOption(FontAwesomeIcons.moneyCheckDollar, 'Add outcome', 8));
      addListOption
          .add(createOption(Icons.insert_drive_file_rounded, 'Add Product', 9));

      editListOption
          .add(createOption(FontAwesomeIcons.userPen, 'Edit Customer', 10));
      editListOption
          .add(createOption(FontAwesomeIcons.filePen, 'Edit Order', 11));
      editListOption
          .add(createOption(FontAwesomeIcons.pen, 'Edit Staff', 12));
      editListOption
          .add(createOption(Icons.payment_rounded, 'Edit Income', 13));
      editListOption
          .add(createOption(FontAwesomeIcons.moneyBill, 'Edit outcome', 14));
      editListOption.add(
          createOption(FontAwesomeIcons.penToSquare, 'Edit Product', 15));

      deleteListOption
          .add(createOption(FontAwesomeIcons.userXmark, 'Delete Customer', 16));
      deleteListOption.add(
          createOption(FontAwesomeIcons.fileWaveform, 'Delete Order', 17));
      deleteListOption
          .add(createOption(FontAwesomeIcons.userLargeSlash, 'Delete Staff', 18));
      deleteListOption
          .add(createOption(FontAwesomeIcons.circleMinus, 'Delete Income', 19));
      deleteListOption
          .add(createOption(FontAwesomeIcons.folderMinus, 'Delete outcome', 20));
      deleteListOption.add(
          createOption(FontAwesomeIcons.fileCircleXmark, 'Delete Product', 21));
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
      if (index < wed.length) {
        currentWidget = wed[index];
      } else {
        if (kDebugMode) {
          print('outOf rang =>  $index');
        }
      }
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

  PopupMenuItem createOption(IconData icon, String label, int option) {
    return PopupMenuItem(
      value: option,
      child: ListTile(leading: Icon(icon), title: Text(label)),
    );
  }

  PopupMenuButton option(
      BuildContext ctx, IconData icon, List<PopupMenuEntry> optionsList) {
    return PopupMenuButton(
      icon: Icon(icon),
      itemBuilder: ((ctx) => optionsList),
      onSelected: (value) {
        setState(() {
          selectedPage(value);
        });
      },
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
