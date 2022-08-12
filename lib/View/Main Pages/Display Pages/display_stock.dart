import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayStockPage extends StatefulWidget {
  const DisplayStockPage({Key? key}) : super(key: key);

  @override
  State<DisplayStockPage> createState() => _DisplayStockPageState();
}

class _DisplayStockPageState extends State<DisplayStockPage> {
  Widget bodyPage() {
    return const Text('Display Stock');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
