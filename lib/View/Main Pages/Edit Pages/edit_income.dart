import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class EditIncomePage extends StatefulWidget {
  const EditIncomePage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<EditIncomePage> createState() => _EditIncomePageState();
}

class _EditIncomePageState extends State<EditIncomePage> {
  Widget bodyPage() {
    return const Text('Edit Income');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage()).build()
        : Scaffold(
            appBar:
                CustomizeAppBar().createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()).build(),
          );
  }
}
