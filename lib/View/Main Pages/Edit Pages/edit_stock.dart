import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditStockPage extends StatefulWidget {
  const EditStockPage({Key? key}) : super(key: key);

  @override
  State<EditStockPage> createState() => _EditStockPageState();
}

class _EditStockPageState extends State<EditStockPage> {
  Widget bodyPage() {
    return const Text('Edit Stock');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
