import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteIncomePage extends StatefulWidget {
  const DeleteIncomePage({Key? key}) : super(key: key);

  @override
  State<DeleteIncomePage> createState() => _DeleteIncomePageState();
}

class _DeleteIncomePageState extends State<DeleteIncomePage> {
  Widget bodyPage() {
    return const Text('Delete Income');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
