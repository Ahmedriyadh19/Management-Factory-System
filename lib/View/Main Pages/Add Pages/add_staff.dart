import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddStaffPage extends StatefulWidget {
  const AddStaffPage({Key? key}) : super(key: key);

  @override
  State<AddStaffPage> createState() => _AddStaffPageState();
}

class _AddStaffPageState extends State<AddStaffPage> {
  Widget bodyPage() {
    return const Text('Add Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
