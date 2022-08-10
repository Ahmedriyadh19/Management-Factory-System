import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteInvoicePage extends StatefulWidget {
  const DeleteInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeleteInvoicePage> createState() => _DeleteInvoicePageState();
}

class _DeleteInvoicePageState extends State<DeleteInvoicePage> {
  Widget bodyPage() {
    return const Text('Delete Invoice');
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
