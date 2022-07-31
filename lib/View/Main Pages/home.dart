import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Dashboard/dashboard.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete/delete_page.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit/edit_page.dart';
import 'package:management_factory_system/View/Main%20Pages/New/new_page.dart';
import 'package:management_factory_system/main.dart';
import 'package:sidebarx/sidebarx.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> wed = [
    const Dashboard(),
    const NewPage(),
    const EditPage(),
    const DeletePage()
  ];

  Widget currentWidget = wed[0];

  Drawer drawer() {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      elevation: 50,
      child: Column(children: [
        Container(
          height: 200,
          color: const Color.fromARGB(255, 7, 32, 34),
        ),
        Container(
          color: Colors.blue,
          child: Column(children: const []),
        )
      ]),
    );
  }

  selectedPage(int index) {
    setState(() {
      currentWidget = wed[index];
    });
  }

  AppBar upBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 45, 64, 65),
      title: const Text('Welcome'),
      actions: [
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
