import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  Widget bodyPage() {
    return const Text('new');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
