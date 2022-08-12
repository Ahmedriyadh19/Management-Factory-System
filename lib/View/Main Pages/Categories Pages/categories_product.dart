import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Widget bodyPage() {
    return const Text('Product');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
