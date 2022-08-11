import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditPurchaseInvoicePage extends StatefulWidget {
  const EditPurchaseInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;

  @override
  State<EditPurchaseInvoicePage> createState() =>
      _EditPurchaseInvoicePageState();
}

class _EditPurchaseInvoicePageState extends State<EditPurchaseInvoicePage> {
  Widget bodyPage() {
    return const Text('Edit Purchase Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage())
        : Scaffold(
            appBar:
                CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()),
          );
  }
}
