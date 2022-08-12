import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayStaffPage extends StatefulWidget {
  const DisplayStaffPage({Key? key}) : super(key: key);

  @override
  State<DisplayStaffPage> createState() => _DisplayStaffPageState();
}

class _DisplayStaffPageState extends State<DisplayStaffPage> {
  Widget bodyPage() {
    return const Text('Display Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
