import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteInvoicePage extends StatefulWidget {
  const DeleteInvoicePage({Key? key}) : super(key: key);

  @override
  State<DeleteInvoicePage> createState() => _DeleteInvoicePageState();
}

class _DeleteInvoicePageState extends State<DeleteInvoicePage> {
  Widget bodyPage() {
    return const Text('Delete Invoice');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
