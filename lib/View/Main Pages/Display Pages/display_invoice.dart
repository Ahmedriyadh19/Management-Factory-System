import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayInvoicePage extends StatefulWidget {
  const DisplayInvoicePage({Key? key}) : super(key: key);

  @override
  State<DisplayInvoicePage> createState() => _DisplayInvoicePageState();
}

class _DisplayInvoicePageState extends State<DisplayInvoicePage> {
  Widget bodyPage() {
    return const Text('Display Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
