import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DeleteCustomerPage extends StatefulWidget {
  const DeleteCustomerPage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DeleteCustomerPage> createState() => _DeleteCustomerPageState();
}

class _DeleteCustomerPageState extends State<DeleteCustomerPage> {
  Widget bodyPage() {
    return const Text('Delete Customer');
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
