import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add/add_page.dart';
import 'package:management_factory_system/View/Main%20Pages/Dashboard/dashboard.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete/delete_page.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit/edit_page.dart';
import 'package:management_factory_system/View/Main%20Pages/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<bool> isSelectedBtnList = [];
  static List<PopupMenuItem> addListOption = [];
  static List<PopupMenuItem> editListOption = [];
  static List<PopupMenuItem> deleteListOption = [];

  initializeOptionsMenuList() {
    isSelectedBtnList.clear();
    addListOption.clear();
    editListOption.clear();
    deleteListOption.clear();

    for (int i = 0; i < 25; i++) {
      isSelectedBtnList.add(false);
    }
    addListOption
        .add(createOption(FontAwesomeIcons.layerGroup, 'Add Stock', 4));
    addListOption
        .add(createOption(FontAwesomeIcons.userPlus, 'Add Customer', 5));
    addListOption
        .add(createOption(FontAwesomeIcons.fileInvoice, 'Add Order', 6));
    addListOption.add(createOption(FontAwesomeIcons.user, 'Add Staff', 7));
    addListOption.add(createOption(Icons.payment_rounded, 'Add Income', 8));
    addListOption
        .add(createOption(FontAwesomeIcons.moneyCheckDollar, 'Add outcome', 9));
    addListOption
        .add(createOption(Icons.insert_drive_file_rounded, 'Add Product', 10));

    editListOption.add(createOption(FontAwesomeIcons.pen, 'Edit Stock', 11));
    editListOption
        .add(createOption(FontAwesomeIcons.userPen, 'Edit Customer', 12));
    editListOption
        .add(createOption(FontAwesomeIcons.filePen, 'Edit Order', 13));
    editListOption
        .add(createOption(FontAwesomeIcons.squarePen, 'Edit Staff', 14));
    editListOption.add(createOption(Icons.payment_rounded, 'Edit Income', 15));
    editListOption
        .add(createOption(FontAwesomeIcons.moneyBill, 'Edit outcome', 16));
    editListOption
        .add(createOption(FontAwesomeIcons.penToSquare, 'Edit Product', 17));

    deleteListOption
        .add(createOption(FontAwesomeIcons.solidTrashCan, 'Delete Stock', 18));
    deleteListOption
        .add(createOption(FontAwesomeIcons.userXmark, 'Delete Customer', 19));
    deleteListOption
        .add(createOption(FontAwesomeIcons.fileWaveform, 'Delete Order', 20));
    deleteListOption
        .add(createOption(FontAwesomeIcons.userLargeSlash, 'Delete Staff', 21));
    deleteListOption
        .add(createOption(FontAwesomeIcons.circleMinus, 'Delete Income', 22));
    deleteListOption
        .add(createOption(FontAwesomeIcons.folderMinus, 'Delete outcome', 23));
    deleteListOption.add(
        createOption(FontAwesomeIcons.fileCircleXmark, 'Delete Product', 24));
  }

  static List<Widget> pages = [
    const Dashboard(),
    const AddPage(),
    const EditPage(),
    const DeletePage()
  ];

  Widget currentWidget = pages[0];

  Drawer drawer(BuildContext ctx) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 125, 155, 156),
      elevation: 50,
      child: SizedBox(
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    color: const Color.fromARGB(255, 7, 32, 34),
                  ),
                  line(Icons.dashboard_rounded, 'Dashboard', 0),
                  line(Icons.add, 'Add', 1),
                  line(Icons.edit_note_rounded, 'Edit', 2),
                  line(Icons.delete_rounded, 'Delete', 3),
                  div(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  divWithTxt('Sign out'),
                  signOutBtn(),
                ],
              )
            ]),
      ),
    );
  }

  void selectedPage(int index) {
    setState(() {
      if (index < pages.length) {
        currentWidget = pages[index];
      }
    });
  }

  Row divWithTxt(String txt) {
    return Row(children: [
      Expanded(child: div()),
      Text(
        txt,
      ),
      Expanded(child: div()),
    ]);
  }

  Divider div() {
    return const Divider(
      color: Colors.black,
      thickness: 2,
      endIndent: 20,
      indent: 20,
    );
  }

  ListTile line(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      hoverColor: isSelectedBtnList[index]
          ? Colors.greenAccent
          : const Color.fromARGB(255, 255, 255, 255),
      selectedColor: isSelectedBtnList[index]
          ? const Color.fromARGB(255, 255, 255, 255)
          : const Color.fromARGB(255, 0, 0, 0),
      iconColor: Colors.black,
      selected: isSelectedBtnList[index],
      onTap: () {
        setState(() {
          selectedPage(index);
          getSelectedBtn(index);
        });
      },
    );
  }

  void getSelectedBtn(int index) {
    for (int i = 0; i < isSelectedBtnList.length; i++) {
      if (i != index) {
        isSelectedBtnList[i] = false;
      } else {
        isSelectedBtnList[i] = true;
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
      elevation: 50,
      actions: [
        upBarBtn(0, Icons.dashboard_rounded),
        option(ctx, Icons.add, addListOption),
        option(ctx, Icons.edit_note_rounded, editListOption),
        option(ctx, Icons.delete_rounded, deleteListOption),
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

  IconButton signOutBtn() {
    return IconButton(
      icon: const Icon(Icons.exit_to_app),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Login()),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initializeOptionsMenuList();
    WindowsConfiguration().exitAction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context),
        appBar: upBar(context),
        body: Background(
          widget: currentWidget,
        ));
  }
}
