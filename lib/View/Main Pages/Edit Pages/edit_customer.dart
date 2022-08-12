import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditCustomerPage extends StatefulWidget {
  const EditCustomerPage({Key? key}) : super(key: key);

  @override
  State<EditCustomerPage> createState() => _EditCustomerPageState();
}

class _EditCustomerPageState extends State<EditCustomerPage> {
  Widget bodyPage() {
    return const Text('Edit Customer');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
