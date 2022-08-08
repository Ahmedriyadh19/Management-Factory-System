import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayIncomePage extends StatefulWidget {
  const DisplayIncomePage({Key? key}) : super(key: key);

  @override
  State<DisplayIncomePage> createState() => _DisplayIncomePageState();
}

class _DisplayIncomePageState extends State<DisplayIncomePage> {
  Widget bodyPage() {
    return const Text('Display Income');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
