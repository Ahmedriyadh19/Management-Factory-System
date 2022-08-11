import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteIncomePage extends StatefulWidget {
  const DeleteIncomePage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeleteIncomePage> createState() => _DeleteIncomePageState();
}

class _DeleteIncomePageState extends State<DeleteIncomePage> {
  Widget bodyPage() {
    return const Text('Delete Income');
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
