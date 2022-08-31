import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddSalesInvoicePage extends StatefulWidget {
  const AddSalesInvoicePage({Key? key, this.option, this.appBarTitle}) : super(key: key);

  final int? option;
  final String? appBarTitle;

  @override
  State<AddSalesInvoicePage> createState() => _AddSalesInvoicePageState();
}

class _AddSalesInvoicePageState extends State<AddSalesInvoicePage> {
  Widget bodyPage() {
    return const Text('Add Sales Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage()).build()
        : Scaffold(
            appBar: CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()).build(),
          );
  }
}
