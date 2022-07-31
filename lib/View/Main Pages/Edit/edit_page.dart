import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Widget bodyPage() {
    return const Text('Edit');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
