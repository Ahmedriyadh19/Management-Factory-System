import 'dart:io';
import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/colors.dart';
import 'package:management_factory_system/View/Containers/background.dart';
import 'package:management_factory_system/View/Main%20Pages/Add%20Pages/add_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Delete%20Pages/delete_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Display%20Pages/display_payment.dart';
import 'package:management_factory_system/View/Main%20Pages/Edit%20Pages/edit_payment.dart';

class PaymentPage extends StatelessWidget {
  final bool isOkay = Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  static int lvl = 0;

  PaymentPage({Key? key}) : super(key: key);
  static const List<Widget> bodyPages = [
    AddPaymentPage(option: 0, appBarTitle: 'Add Payment'),
    EditPaymentPage(option: 0, appBarTitle: 'Edit Payment'),
    DisplayPaymentPage(option: 0, appBarTitle: 'View Payment'),
    DeletePaymentPage(option: 0, appBarTitle: 'Delete Payment'),
  ];
  static const List<String> descriptions = [
    'From here, you may create a new invoice for what you\'ve sold.',
    'You may update past invoices that have been sold from your side by going to this page.',
    'You may search and view any invoices that you have sold from your side here.',
    'If you made a mistake in a previous invoice or would like to delete it in any way, you may do it from here.',
  ];

  ListView bodyPage(BuildContext ctx) {
    lvl = 0;
    return ListView(
      children: [
        const SizedBox(height: 30),
        Center(
          child: Text('PAYMENT',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.myColorFont)),
        ),
        buildFormatPage([
          createItem('add payment', 'Add Payment', lvl++, ctx),
          createItem('edit payment', 'Edit Payment', lvl++, ctx),
          createItem('display payment', 'View Payment', lvl++, ctx),
          createItem('delete payment', 'Delete Payment', lvl++, ctx),
        ], 0),
      ],
    );
  }

  buildFormatPage(List<Widget> items, int option) {
    return GridView(
        shrinkWrap: option == 0 ? true : false,
        padding: const EdgeInsets.all(50),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: isOkay ? 300 : 200,
            mainAxisExtent: isOkay ? 150 : 50,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: items);
  }

  Tooltip createItem(String pathImage, String nameMenu, int action, BuildContext ctx) {
    return Tooltip(
      message: descriptions[action],
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: MyColors.myColorContainer.withOpacity(0.8)),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [buildImage(pathImage), buildDiv(), const SizedBox(width: 5), buildText(nameMenu)],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => bodyPages[action]));
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: MyColors.myColorFont)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage(context)).build();
  }
}
