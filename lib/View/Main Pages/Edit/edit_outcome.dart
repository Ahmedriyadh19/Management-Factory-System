import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditOutcomePage extends StatefulWidget {
  const EditOutcomePage({Key? key}) : super(key: key);

  @override
  State<EditOutcomePage> createState() => _EditOutcomePageState();
}

class _EditOutcomePageState extends State<EditOutcomePage> {
  Widget bodyPage() {
    return const Text('Edit Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
