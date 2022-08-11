import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteSalesInvoicePage extends StatefulWidget {
  const DeleteSalesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeleteSalesInvoicePage> createState() => _DeleteSalesInvoicePageState();
}

class _DeleteSalesInvoicePageState extends State<DeleteSalesInvoicePage> {
  Widget bodyPage() {
    return const Text('Delete Sales Invoice');
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
