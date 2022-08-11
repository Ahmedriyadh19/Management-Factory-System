import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddPurchasesInvoicePage extends StatefulWidget {
  const AddPurchasesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);

  final int? option;
  final String? appBarTitle;

  @override
  State<AddPurchasesInvoicePage> createState() =>
      _AddPurchasesInvoicePageState();
}

class _AddPurchasesInvoicePageState extends State<AddPurchasesInvoicePage> {
  Widget bodyPage() {
    return const Text('Add Purchases Invoice');
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
