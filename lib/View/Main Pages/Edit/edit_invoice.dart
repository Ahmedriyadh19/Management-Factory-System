import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditInvoicePage extends StatefulWidget {
  const EditInvoicePage({Key? key}) : super(key: key);

  @override
  State<EditInvoicePage> createState() => _EditInvoicePageState();
}

class _EditInvoicePageState extends State<EditInvoicePage> {
  Widget bodyPage() {
    return const Text('Edit Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
