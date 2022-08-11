import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayPurchasesInvoicePage extends StatefulWidget {
  const DisplayPurchasesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DisplayPurchasesInvoicePage> createState() =>
      _DisplayPurchasesInvoicePageState();
}

class _DisplayPurchasesInvoicePageState
    extends State<DisplayPurchasesInvoicePage> {
  Widget bodyPage() {
    return const Text('Display Purchase Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage())
        : Scaffold(
            appBar: createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()),
          );
  }
}
