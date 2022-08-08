import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({Key? key}) : super(key: key);

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  Widget bodyPage() {
    return const Text('Add Income');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
