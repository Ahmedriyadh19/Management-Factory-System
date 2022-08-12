import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/app_bar_customize.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class DisplayCustomerPage extends StatefulWidget {
  const DisplayCustomerPage({Key? key, this.option, this.appBarTitle})
      : super(key: key);
  final int? option;
  final String? appBarTitle;
  @override
  State<DisplayCustomerPage> createState() => _DisplayCustomerPageState();
}

class _DisplayCustomerPageState extends State<DisplayCustomerPage> {
  Widget bodyPage() {
    return const Text('Display Customer');
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
