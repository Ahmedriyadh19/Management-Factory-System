import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Widget bodyPage() {
    return const Text('Add');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
