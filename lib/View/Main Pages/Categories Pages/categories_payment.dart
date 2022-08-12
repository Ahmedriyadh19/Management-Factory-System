import 'dart:io';

import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_outcome.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_income.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_outcome.dart';

class PaymentPage extends StatelessWidget {
  final bool isOkay =
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  PaymentPage({Key? key}) : super(key: key);
  static const List<Widget> bodyPages = [
    AddIncomePage(option: 0, appBarTitle: 'Add Income'),
    EditIncomePage(option: 0, appBarTitle: 'Edit Income'),
    DisplayIncomePage(option: 0, appBarTitle: 'View Income'),
    DeleteIncomePage(option: 0, appBarTitle: 'Delete Income'),
    AddOutcomePage(option: 0, appBarTitle: 'Add Outcome'),
    EditOutcomePage(option: 0, appBarTitle: 'Edit Outcome'),
    DisplayOutcomePage(option: 0, appBarTitle: 'View Outcome'),
    DeleteOutcomePage(option: 0, appBarTitle: 'Delete Outcome'),
  ];
  static const List<String> descriptions = [
    'From here, you may create a new invoice for what you\'ve sold.',
    'You may update past invoices that have been sold from your side by going to this page.',
    'You may search and view any invoices that you have sold from your side here.',
    'If you made a mistake in a previous invoice or would like to delete it in any way, you may do it from here.',
    '',
    '',
    '',
    '',
  ];

  Widget bodyPage(BuildContext ctx) {
    return ListView(
      children: [
        const Center(
          child: Text('PAYMENT RECEIVE',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        buildFormatPage([
          createItem('add income', 'Add Income', 0, ctx),
          createItem('edit income', 'Edit Income', 1, ctx),
          createItem('display income', 'View Income', 2, ctx),
          createItem('delete income', 'Delete Income', 3, ctx),
        ], 0),
        Divider(
          color: Colors.black,
          thickness: isOkay ? 5 : 2,
          endIndent: 50,
          indent: 50,
        ),
        const SizedBox(height: 30),
        const Center(
          child: Text('PAYMENT SEND',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        buildFormatPage([
          createItem('add outcome', 'Add Outcome', 4, ctx),
          createItem('edit outcome', 'Edit Outcome', 5, ctx),
          createItem('display outcome', 'View Outcome', 6, ctx),
          createItem('delete outcome', 'Delete Outcome', 7, ctx),
        ], 0)
      ],
    );
  }

  buildFormatPage(List<Widget> items, int option) {
    return GridView(
        shrinkWrap: option == 0 ? true : false,
        padding: const EdgeInsets.all(50),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: isOkay ? 500 : 300,
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
    return Background(widget: bodyPage(context)).build();
  }
}
