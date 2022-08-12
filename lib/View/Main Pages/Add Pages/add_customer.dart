import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  Widget bodyPage() {
    return const Text('Add Customer');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
