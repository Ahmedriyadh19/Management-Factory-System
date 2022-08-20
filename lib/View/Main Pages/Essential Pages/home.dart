import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Containers/my_drawer.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_purchases_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_dashboard.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_persons.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Categories%20Pages/categories_settings.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_purchases_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_product.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_purchase_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_staff.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_stock.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_customer.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_purchase_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_sales_invoice.dart';
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
  static List<PopupMenuItem> viewListOption = [];
  static int lvl = 0;

  static final List<Widget> pages = [
    const Dashboard(),
    InvoicePage(),
    PaymentPage(),
    ProductPage(),
    PersonsPage(),
    const AddStockPage(),
    const AddCustomerPage(),
    const AddSalesInvoicePage(),
    const AddPurchasesInvoicePage(),
    const AddStaffPage(),
    const AddPaymentPage(),
    const AddProductPage(),
    const DisplayStockPage(),
    const DisplayCustomerPage(),
    const DisplaySalesInvoicePage(),
    const DisplayPurchasesInvoicePage(),
    const DisplayStaffPage(),
    const DisplayPaymentPage(),
    const DisplayProductPage(),
    const EditStockPage(),
    const EditCustomerPage(),
    const EditSalesInvoicePage(),
    const EditPurchasesInvoicePage(),
    const EditStaffPage(),
    const EditPaymentPage(),
    const EditProductPage(),
    const DeleteStockPage(),
    const DeleteCustomerPage(),
    const DeleteSalesInvoicePage(),
    const DeletePurchasesInvoicePage(),
    const DeleteStaffPage(),
    const DeletePaymentPage(),
    const DeleteProductPage(),
    const SettingsPage()
  ];

  void initializeOptionsMenuList() {
    isSelectedBtnList.clear();
    addListOption.clear();
    editListOption.clear();
    deleteListOption.clear();
    viewListOption.clear();
    lvl = 5;

    for (int i = 0; i < pages.length + 1; i++) {
      isSelectedBtnList.add(false);
    }
    addListOption
        .add(createOption(FontAwesomeIcons.layerGroup, 'Add Stock', lvl++));
    addListOption
        .add(createOption(FontAwesomeIcons.userPlus, 'Add Customer', lvl++));
    addListOption.add(
        createOption(FontAwesomeIcons.fileInvoice, 'Add Sales Invoice', lvl++));
    addListOption.add(createOption(
        FontAwesomeIcons.fileInvoice, 'Add Purchases Invoice', lvl++));
    addListOption.add(createOption(FontAwesomeIcons.user, 'Add Staff', lvl++));
    addListOption
        .add(createOption(Icons.payment_rounded, 'Add Payment', lvl++));
    addListOption.add(
        createOption(Icons.insert_drive_file_rounded, 'Add Product', lvl++));

    viewListOption.add(createOption(FontAwesomeIcons.store, 'View Stock', lvl++));
    viewListOption
        .add(createOption(FontAwesomeIcons.peopleRoof, 'View Customer', lvl++));
    viewListOption
        .add(createOption(FontAwesomeIcons.receipt, 'View Sales Invoice', lvl++));
    viewListOption.add(
        createOption(FontAwesomeIcons.receipt, 'View Purchases Invoice', lvl++));
    viewListOption.add(createOption(FontAwesomeIcons.personCane, 'View Staff', lvl++));
    viewListOption
        .add(createOption(FontAwesomeIcons.moneyBillWave, 'View Payment', lvl++));
    viewListOption
        .add(createOption(FontAwesomeIcons.rectangleList, 'View Product', lvl++));

    editListOption.add(createOption(FontAwesomeIcons.pen, 'Edit Stock', lvl++));
    editListOption
        .add(createOption(FontAwesomeIcons.userPen, 'Edit Customer', lvl++));
    editListOption.add(
        createOption(FontAwesomeIcons.filePen, 'Edit Sales Invoice', lvl++));

    editListOption.add(createOption(
        FontAwesomeIcons.filePen, 'Edit Purchases Invoice', lvl++));
    editListOption
        .add(createOption(FontAwesomeIcons.squarePen, 'Edit Staff', lvl++));
    editListOption
        .add(createOption(Icons.payment_rounded, 'Edit Payment', lvl++));
    editListOption
        .add(createOption(FontAwesomeIcons.penToSquare, 'Edit Product', lvl++));

    deleteListOption.add(
        createOption(FontAwesomeIcons.solidTrashCan, 'Delete Stock', lvl++));
    deleteListOption.add(
        createOption(FontAwesomeIcons.userXmark, 'Delete Customer', lvl++));
    deleteListOption.add(createOption(
        FontAwesomeIcons.fileWaveform, 'Delete Sales Invoice', lvl++));

    deleteListOption.add(createOption(
        FontAwesomeIcons.fileWaveform, 'Delete Purchases Invoice', lvl++));
    deleteListOption.add(
        createOption(FontAwesomeIcons.userLargeSlash, 'Delete Staff', lvl++));
    deleteListOption.add(
        createOption(FontAwesomeIcons.circleMinus, 'Delete Payment', lvl++));
    deleteListOption.add(createOption(
        FontAwesomeIcons.fileCircleXmark, 'Delete Product', lvl++));
  }

  Widget currentWidget = pages[0];

  Drawer drawer() {
    return MyDrawer.createCustomizeDrawer([
      line(Icons.dashboard_rounded, 'Dashboard', 0),
      line(FontAwesomeIcons.fileInvoiceDollar, 'Invoice', 1),
      line(FontAwesomeIcons.moneyCheckDollar, 'Payment', 2),
      line(FontAwesomeIcons.box, 'Product & Store', 3),
      line(Icons.person, 'Persons', 4),
      div(),
      line(FontAwesomeIcons.gears, 'Settings', lvl)
    ], [
      divWithTxt('EXIT'),
      signOutBtn(lvl),
    ]);
  }

  void selectedPage(int index) {
    setState(() {
      if (index < pages.length && index < isSelectedBtnList.length) {
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
      child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            label,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }

  PopupMenuButton option(BuildContext ctx, IconData icon,
      List<PopupMenuEntry> optionsList, String tooltips) {
    return PopupMenuButton(
      color: Background.getColor().withOpacity(0.8),
      tooltip: tooltips,
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
    return CustomizeAppBar().createCustomizeAppBar(
      'Welcome',
      actionsIcons: [
        upBarBtn(0, Icons.dashboard_rounded),
        option(ctx, Icons.add, addListOption, 'Show add Menu'),
        option(ctx, FontAwesomeIcons.display, viewListOption, 'Show View Menu'),
        option(ctx, Icons.edit_note_rounded, editListOption, 'Show edit Menu'),
        option(ctx, Icons.delete_rounded, deleteListOption, 'Show delete Menu'),
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

  IconButton signOutBtn(int index) {
    return IconButton(
      tooltip: 'Exit',
      hoverColor: isSelectedBtnList[index]
          ? Colors.greenAccent
          : const Color.fromARGB(255, 255, 255, 255),
      icon: const Icon(FontAwesomeIcons.personWalkingArrowLoopLeft),
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
        drawer: drawer(),
        appBar: upBar(context),
        body: Background(
          widget: currentWidget,
        ).build());
  }
}
