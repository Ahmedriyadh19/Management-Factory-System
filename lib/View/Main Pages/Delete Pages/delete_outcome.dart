import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteOutcomePage extends StatefulWidget {
  const DeleteOutcomePage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;

  @override
  State<DeleteOutcomePage> createState() => _DeleteOutcomePageState();
}

class _DeleteOutcomePageState extends State<DeleteOutcomePage> {
  Widget bodyPage() {
    return const Text('Delete Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage())
        : Scaffold(
            appBar:
                CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()),
          );
  }
}
