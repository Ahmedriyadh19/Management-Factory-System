import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddInvoicePage extends StatefulWidget {
  const AddInvoicePage({Key? key}) : super(key: key);

  @override
  State<AddInvoicePage> createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends State<AddInvoicePage> {
  Widget bodyPage() {
    return const Text('Add Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
