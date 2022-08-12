import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayCustomerPage extends StatefulWidget {
  const DisplayCustomerPage({Key? key}) : super(key: key);

  @override
  State<DisplayCustomerPage> createState() => _DisplayCustomerPageState();
}

class _DisplayCustomerPageState extends State<DisplayCustomerPage> {
  Widget bodyPage() {
    return const Text('Display Customer');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
