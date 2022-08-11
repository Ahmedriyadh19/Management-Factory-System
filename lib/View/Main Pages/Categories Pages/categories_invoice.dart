import 'dart:io';
import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_purchases_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_purchases_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_purchase_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_sales_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_purchase_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_sales_invoice.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({
    Key? key,
  }) : super(key: key);

  final bool isOkay =
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  static const List<Widget> bodyPages = [
    AddSalesInvoicePage(option: 0, appBarTitle: 'Add new Sales Invoice'),
    EditSalesInvoicePage(option: 0, appBarTitle: 'Edit Sales Invoice'),
    DisplaySalesInvoicePage(option: 0, appBarTitle: 'View Sales Invoice'),
    DeleteSalesInvoicePage(option: 0, appBarTitle: 'Delete Sales Invoice'),
    AddPurchasesInvoicePage(option: 0, appBarTitle: 'Add new Invoice'),
    EditPurchaseInvoicePage(option: 0, appBarTitle: 'Edit Invoice'),
    DisplayPurchasesInvoicePage(option: 0, appBarTitle: 'View Invoice'),
    DeletePurchasesInvoicePage(option: 0, appBarTitle: 'Delete Invoice')
  ];
  static const List<String> descriptions = [
    'From here, you may create a new sales invoice for what you\'ve sold.',
    'You may update past sales invoices that have been sold from your side by going to this page.',
    'You may search and view any sales invoices that you have sold from your side here.',
    'If you made a mistake in a previous sales invoice or would like to delete it in any way, you may do it from here.',
    'From here, you may create a new purchases invoice for what you\'ve sold.',
    'You may update past purchases invoices that have been sold from your side by going to this page.',
    'You may search and view any purchases invoices that you have sold from your side here.',
    'If you made a mistake in a previous purchases invoice or would like to delete it in any way, you may do it from here.',
  ];

  Widget bodyPage(BuildContext ctx) {
    return ListView(
      children: [
        const Center(
          child: Text('SALES INVOICE',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        buildFormatPage([
          createItem('add sales invoice', 'Add Sales Invoice', 0, ctx),
          createItem('edit sales invoice', 'Edit Sales Invoice', 1, ctx),
          createItem('display sales invoice', 'View Sales Invoice', 2, ctx),
          createItem('delete sales invoice', 'Delete Sales Invoice', 3, ctx),
        ], 0),
        Divider(
          color: Colors.black,
          thickness: isOkay ? 5 : 2,
          endIndent: 50,
          indent: 50,
        ),
        const SizedBox(height: 30),
        const Center(
          child: Text('PURCHASES INVOICE',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        buildFormatPage([
          createItem('add purchases invoice', 'Add Purchases Invoice', 4, ctx),
          createItem(
              'edit purchases invoice', 'Edit Purchases Invoice', 5, ctx),
          createItem(
              'display purchases invoice', 'View Purchases Invoice', 6, ctx),
          createItem(
              'delete purchases invoice', 'Delete Purchases Invoice', 7, ctx),
        ], 0)
      ],
    );
  }

  buildFormatPage(List<Widget> items, int option) {
    return GridView(
        shrinkWrap: option == 0 ? true : false,
        padding: const EdgeInsets.all(50),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: isOkay ? 400 : 200,
            mainAxisExtent: isOkay ? 200 : 100,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: items);
  }

  Tooltip createItem(
      String pathImage, String nameMenu, int action, BuildContext ctx) {
    return Tooltip(
      message: descriptions[action],
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(190, 254, 255, 255)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildImage(pathImage),
                buildDiv(),
                buildText(nameMenu)
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(ctx)
              .push(MaterialPageRoute(builder: (_) => bodyPages[action]));
        },
      ),
    );
  }

  Container buildImage(String pathImage) {
    return Container(
        margin: const EdgeInsets.only(bottom: 25, left: 5, right: 0, top: 25),
        child: Image.asset('lib/Assets/Images/$pathImage.png'));
  }

  VerticalDivider buildDiv() {
    return VerticalDivider(
      color: const Color.fromARGB(255, 0, 0, 0),
      thickness: 1,
      endIndent: isOkay ? 70 : 40,
      indent: isOkay ? 70 : 40,
    );
  }

  Column buildText(String nameMenu) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(nameMenu,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context));
  }
}
