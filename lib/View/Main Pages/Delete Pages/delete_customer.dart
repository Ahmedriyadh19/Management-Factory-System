import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteCustomerPage extends StatefulWidget {
  const DeleteCustomerPage({Key? key}) : super(key: key);

  @override
  State<DeleteCustomerPage> createState() => _DeleteCustomerPageState();
}

class _DeleteCustomerPageState extends State<DeleteCustomerPage> {
  Widget bodyPage() {
    return const Text('Delete Customer');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
