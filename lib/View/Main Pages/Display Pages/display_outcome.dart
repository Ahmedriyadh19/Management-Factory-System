import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayOutcomePage extends StatefulWidget {
  const DisplayOutcomePage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DisplayOutcomePage> createState() => _DisplayOutcomePageState();
}

class _DisplayOutcomePageState extends State<DisplayOutcomePage> {
  Widget bodyPage() {
    return const Text('Display Outcome');
  }

  @override
  Widget build(BuildContext context) {
    return widget.option != 0
        ? Background(widget: bodyPage())
        : Scaffold(
            appBar: createCustomizeAppBar(widget.appBarTitle!),
            body: Background(widget: bodyPage()),
          );
  }
}
