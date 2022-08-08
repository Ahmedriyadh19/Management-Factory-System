import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayOutcomePage extends StatefulWidget {
  const DisplayOutcomePage({Key? key}) : super(key: key);

  @override
  State<DisplayOutcomePage> createState() => _DisplayOutcomePageState();
}

class _DisplayOutcomePageState extends State<DisplayOutcomePage> {
  Widget bodyPage() {
    return const Text('Display Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
