import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteStaffPage extends StatefulWidget {
  const DeleteStaffPage({Key? key}) : super(key: key);

  @override
  State<DeleteStaffPage> createState() => _DeleteStaffPageState();
}

class _DeleteStaffPageState extends State<DeleteStaffPage> {
  Widget bodyPage() {
    return const Text('Delete Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage()).build();
  }
}
