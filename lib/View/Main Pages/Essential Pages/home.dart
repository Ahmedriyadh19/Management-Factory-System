import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_dashboard.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_persons.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/login.dart';

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

    for (int i = 0; i < 26; i++) {
      isSelectedBtnList.add(false);
    }
    addListOption
        .add(createOption(FontAwesomeIcons.layerGroup, 'Add Stock', 5));
    addListOption
        .add(createOption(FontAwesomeIcons.userPlus, 'Add Customer', 6));
    addListOption
        .add(createOption(FontAwesomeIcons.fileInvoice, 'Add Invoice', 7));
    addListOption.add(createOption(FontAwesomeIcons.user, 'Add Staff', 8));
    addListOption.add(createOption(Icons.payment_rounded, 'Add Income', 9));
    addListOption.add(
        createOption(FontAwesomeIcons.moneyCheckDollar, 'Add outcome', 10));
    addListOption
        .add(createOption(Icons.insert_drive_file_rounded, 'Add Product', 11));

    editListOption.add(createOption(FontAwesomeIcons.pen, 'Edit Stock', 12));
    editListOption
        .add(createOption(FontAwesomeIcons.userPen, 'Edit Customer', 13));
    editListOption
        .add(createOption(FontAwesomeIcons.filePen, 'Edit Invoice', 14));
    editListOption
        .add(createOption(FontAwesomeIcons.squarePen, 'Edit Staff', 15));
    editListOption.add(createOption(Icons.payment_rounded, 'Edit Income', 16));
    editListOption
        .add(createOption(FontAwesomeIcons.moneyBill, 'Edit outcome', 17));
    editListOption
        .add(createOption(FontAwesomeIcons.penToSquare, 'Edit Product', 18));

    deleteListOption
        .add(createOption(FontAwesomeIcons.solidTrashCan, 'Delete Stock', 19));
    deleteListOption
        .add(createOption(FontAwesomeIcons.userXmark, 'Delete Customer', 20));
    deleteListOption
        .add(createOption(FontAwesomeIcons.fileWaveform, 'Delete Order', 21));
    deleteListOption
        .add(createOption(FontAwesomeIcons.userLargeSlash, 'Delete Staff', 22));
    deleteListOption
        .add(createOption(FontAwesomeIcons.circleMinus, 'Delete Income', 23));
    deleteListOption
        .add(createOption(FontAwesomeIcons.folderMinus, 'Delete outcome', 24));
    deleteListOption.add(
        createOption(FontAwesomeIcons.fileCircleXmark, 'Delete Product', 25));
  }

  static List<Widget> pages = [
    const Dashboard(),
    const InvoicePage(),
    const PaymentPage(),
    const ProductPage(),
    const PersonsPage(),
    const AddStockPage(),
    const AddCustomerPage(),
    const AddInvoicePage(),
    const AddStaffPage(),
    const AddIncomePage(),
    const AddOutcomePage(),
    const AddProductPage(),
    const EditStockPage(),
    const EditCustomerPage(),
    const EditInvoicePage(),
    const EditStaffPage(),
    const EditIncomePage(),
    const EditOutcomePage(),
    const EditProductPage(),
    const DeleteStockPage(),
    const DeleteCustomerPage(),
    const DeleteInvoicePage(),
    const DeleteStaffPage(),
    const DeleteIncomePage(),
    const DeleteOutcomePage(),
    const DeleteProductPage(),
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
                  line(FontAwesomeIcons.fileInvoiceDollar, 'Invoice', 1),
                  line(FontAwesomeIcons.moneyCheckDollar, 'Payment', 2),
                  line(FontAwesomeIcons.box, 'Product', 3),
                  line(Icons.person, 'Persons', 4),
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
      title: const Center(child: Text('Welcome')),
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
