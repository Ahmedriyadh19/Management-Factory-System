import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({Key? key}) : super(key: key);

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  Widget bodyPage() {
    return const Text('Add Stock');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
