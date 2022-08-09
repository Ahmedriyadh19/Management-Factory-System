import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteOutcomePage extends StatefulWidget {
  const DeleteOutcomePage({Key? key}) : super(key: key);

  @override
  State<DeleteOutcomePage> createState() => _DeleteOutcomePageState();
}

class _DeleteOutcomePageState extends State<DeleteOutcomePage> {
  Widget bodyPage() {
    return const Text('Delete Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
