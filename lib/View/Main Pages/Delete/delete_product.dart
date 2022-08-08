import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteProductPage extends StatefulWidget {
  const DeleteProductPage({Key? key}) : super(key: key);

  @override
  State<DeleteProductPage> createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  Widget bodyPage() {
    return const Text('Delete Product');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
