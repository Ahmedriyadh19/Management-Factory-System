import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeletePaymentPage extends StatefulWidget {
  const DeletePaymentPage({
    Key? key,
    this.option,
    this.appBarTitle,
  }) : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeletePaymentPage> createState() => _DeletePaymentPageState();
}

class _DeletePaymentPageState extends State<DeletePaymentPage> {
  Widget bodyPage() {
    return const Text('Delete Payment');
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
