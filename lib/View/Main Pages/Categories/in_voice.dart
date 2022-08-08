import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  Widget bodyPage() {
    return const Text('Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
