import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditStaffPage extends StatefulWidget {
  const EditStaffPage({Key? key}) : super(key: key);

  @override
  State<EditStaffPage> createState() => _EditStaffPageState();
}

class _EditStaffPageState extends State<EditStaffPage> {
  Widget bodyPage() {
    return const Text('Edit Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
