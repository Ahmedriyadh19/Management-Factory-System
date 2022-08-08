import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  Widget bodyPage() {
    return const Text('Edit Product');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
