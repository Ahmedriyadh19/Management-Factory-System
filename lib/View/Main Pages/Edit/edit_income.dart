import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditIncomePage extends StatefulWidget {
  const EditIncomePage({Key? key}) : super(key: key);

  @override
  State<EditIncomePage> createState() => _EditIncomePageState();
}

class _EditIncomePageState extends State<EditIncomePage> {
  Widget bodyPage() {
    return const Text('Edit Income');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
