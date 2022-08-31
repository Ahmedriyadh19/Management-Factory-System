import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  Widget bodyPage() {
    return const Text('Add Payment');
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
