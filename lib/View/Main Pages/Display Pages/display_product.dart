import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayProductPage extends StatefulWidget {
  const DisplayProductPage({Key? key}) : super(key: key);

  @override
  State<DisplayProductPage> createState() => _DisplayProductPageState();
}

class _DisplayProductPageState extends State<DisplayProductPage> {
  Widget bodyPage() {
    return const Text('Display Product');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
