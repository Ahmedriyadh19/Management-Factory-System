import 'dart:io';

import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_invoice.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_invoice.dart';

class InvoicePage extends StatelessWidget {
  InvoicePage({
    Key? key,
  }) : super(key: key);

  final bool isOkay =
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  static const List<Widget> bodyPages = [
    AddInvoicePage(option: 0, appBarTitle: 'Add new Invoice'),
    EditInvoicePage(option: 0, appBarTitle: 'Edit Invoice'),
    DisplayInvoicePage(option: 0, appBarTitle: 'View Invoice'),
    DeleteInvoicePage(option: 0, appBarTitle: 'Delete Invoice')
  ];
  static const List<String> descriptions = [
    'From here, you may create a new invoice for what you\'ve sold.',
    'You may update past invoices that have been sold from your side by going to this page.',
    'You may search and view any invoices that you have sold from your side here.',
    'If you made a mistake in a previous invoice or would like to delete it in any way, you may do it from here.'
  ];

  Widget bodyPage(BuildContext ctx) {
    return GridView(
        padding: const EdgeInsets.all(50),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: isOkay ? 500 : 300,
            mainAxisExtent: isOkay ? 200 : 100,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          createItem('add_invoice', 'Add Invoice', descriptions[0], 0, ctx),
          createItem('edit_invoice', 'Edit Invoice', descriptions[1], 1, ctx),
          createItem(
              'display_invoice', 'View Invoice', descriptions[2], 2, ctx),
          createItem(
              'delete_invoice', 'Delete Invoice', descriptions[3], 3, ctx),
        ]);
  }

  GestureDetector createItem(String pathImage, String nameMenu,
      String description, int action, BuildContext ctx) {
    return GestureDetector(
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
              buildText(nameMenu, description)
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(ctx)
            .push(MaterialPageRoute(builder: (_) => bodyPages[action]));
      },
    );
  }

  Container buildImage(String pathImage) {
    return Container(
        margin: const EdgeInsets.only(bottom: 25, left: 5, right: 0, top: 25),
        child: Image.asset('lib/Assets/Images/$pathImage.png'));
  }

  VerticalDivider buildDiv() {
    return const VerticalDivider(
      color: Color.fromARGB(255, 0, 0, 0),
      thickness: 1,
      endIndent: 40,
      indent: 40,
    );
  }

  Column buildText(String nameMenu, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(nameMenu,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Container(
            padding: const EdgeInsets.all(5),
            color: const Color.fromARGB(104, 255, 255, 255),
            width: 200,
            child: Text(
              description,
              textAlign: TextAlign.justify,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context));
  }
}
