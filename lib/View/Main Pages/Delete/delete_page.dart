import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  Widget bodyPage() {
    return const Text('Delete');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
