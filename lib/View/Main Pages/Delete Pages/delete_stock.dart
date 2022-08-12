import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteStockPage extends StatefulWidget {
  const DeleteStockPage({Key? key}) : super(key: key);

  @override
  State<DeleteStockPage> createState() => _DeleteStockPageState();
}

class _DeleteStockPageState extends State<DeleteStockPage> {
  Widget bodyPage() {
    return const Text('Delete Stock');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
