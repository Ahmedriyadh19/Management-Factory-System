import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplaySalesInvoicePage extends StatefulWidget {
  const DisplaySalesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DisplaySalesInvoicePage> createState() =>
      _DisplaySalesInvoicePageState();
}

class _DisplaySalesInvoicePageState extends State<DisplaySalesInvoicePage> {
  Widget bodyPage() {
    return const Text('Display Sales Invoice');
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
