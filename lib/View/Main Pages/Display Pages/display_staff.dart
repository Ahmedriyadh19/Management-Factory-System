import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayStaffPage extends StatefulWidget {
  const DisplayStaffPage({Key? key, this.option, this.appBarTitle}) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DisplayStaffPage> createState() => _DisplayStaffPageState();
}

class _DisplayStaffPageState extends State<DisplayStaffPage> {
  Widget bodyPage() {
    return const Text('Display Staff');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage()).build()
        : Scaffold(
            appBar: CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()).build(),
          );
  }
}
