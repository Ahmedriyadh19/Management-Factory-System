import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/New/new_project.dart';
import 'package:management_factory_system/main.dart';
import 'package:sidebarx/sidebarx.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SidebarX drawer() {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0),
      extendedTheme: const SidebarXTheme(
        width: 400,
        decoration: BoxDecoration(color: Color.fromARGB(255, 73, 106, 107)),
        selectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 11, 160, 88),
        ),
        selectedTextStyle: TextStyle(
          color: Color.fromARGB(255, 11, 160, 88),
        ),
        itemTextPadding: EdgeInsets.symmetric(horizontal: 20),
        selectedItemTextPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      headerDivider: Container(
        color: const Color.fromARGB(255, 7, 32, 34),
        height: 150,
        width: 400,
      ),
      footerDivider: Container(
        color: const Color.fromARGB(255, 3, 232, 248),
      ),
      items:  [
        const SidebarXItem(icon: Icons.dashboard_rounded, label: 'Dashboard'),
        SidebarXItem(icon: Icons.add_box_rounded, label: 'New', onTap: (){
          Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const NewProject()),
              );
        }),
        const SidebarXItem(icon: Icons.edit_note_rounded, label: 'Edit'),
        const SidebarXItem(icon: Icons.delete_rounded, label: 'Delete'),
      ],
    );
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
        body: const Background(
          widget: Text('gd'),
        ));
  }
}
