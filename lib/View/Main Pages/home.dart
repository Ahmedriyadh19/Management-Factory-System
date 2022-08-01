import 'package:flutter/material.dart';
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
  static List<Widget> wed = [
    const Dashboard(),
    const AddPage(),
    const EditPage(),
    const DeletePage()
  ];

  Widget currentWidget = wed[0];

  Drawer drawer() {
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
        line(Icons.delete_rounded, 'Delete', 3)
      ]),
    );
  }

  selectedPage(int index) {
    setState(() {
      currentWidget = wed[index];
    });
  }

  ListTile line(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      hoverColor: const Color.fromARGB(255, 7, 114, 62),
      selectedColor: const Color.fromARGB(255, 23, 70, 221),
      selected: isSelectedBtn[index],
      onTap: () {
        setState(() {
          selectedPage(index);
          getSelectedBtn(index);
          option();
        });
      },
    );
  }

  getSelectedBtn(int index) {
    for (int i = 0; i < isSelectedBtn.length; i++) {
      if (i != index) {
        isSelectedBtn[i] = false;
      } else {
        isSelectedBtn[i] = true;
      }
    }
  }

  PopupMenuButton option() {
    return PopupMenuButton(
      itemBuilder: (_) {
        return [
          const PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          )
        ];
      },
    );
  }

  AppBar upBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 45, 64, 65),
      title: const Text('Welcome'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              selectedPage(1);
              getSelectedBtn(1);
              option();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.edit_note_rounded),
          onPressed: () {
            setState(() {
              selectedPage(2);
              getSelectedBtn(2);
              option();
            });
          },
        ),
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

  IconButton upBarBtn() {
    return IconButton(
      icon: const Icon(Icons.delete_rounded),
      onPressed: () {
        setState(() {
          selectedPage(3);
          getSelectedBtn(3);
          option();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),
        appBar: upBar(),
        body: Background(
          widget: currentWidget,
        ));
  }
}
