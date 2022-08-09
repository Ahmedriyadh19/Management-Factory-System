import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddOutcomePage extends StatefulWidget {
  const AddOutcomePage({Key? key}) : super(key: key);

  @override
  State<AddOutcomePage> createState() => _AddOutcomePageState();
}

class _AddOutcomePageState extends State<AddOutcomePage> {
  Widget bodyPage() {
    return const Text('Add Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
