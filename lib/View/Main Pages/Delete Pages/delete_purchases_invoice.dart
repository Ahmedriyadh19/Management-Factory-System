import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeletePurchasesInvoicePage extends StatefulWidget {
  const DeletePurchasesInvoicePage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeletePurchasesInvoicePage> createState() => _DeletePurchasesInvoicePageState();
}

class _DeletePurchasesInvoicePageState extends State<DeletePurchasesInvoicePage> {
  Widget bodyPage() {
    return const Text('Delete Purchases Invoice');
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
