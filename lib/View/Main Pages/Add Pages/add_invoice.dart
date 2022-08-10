import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddInvoicePage extends StatefulWidget {
  const AddInvoicePage({Key? key, this.option, this.appBarTitle}) : super(key: key);

  final int? option;
  final String? appBarTitle;

  @override
  State<AddInvoicePage> createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends State<AddInvoicePage> {
  Widget bodyPage() {
    return const Text('Add Invoice');
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
