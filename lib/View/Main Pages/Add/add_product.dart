import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  Widget bodyPage() {
    return const Text('Add Product');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
