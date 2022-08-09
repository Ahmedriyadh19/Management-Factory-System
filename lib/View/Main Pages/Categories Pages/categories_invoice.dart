import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  Widget bodyPage() {
    return GridView(
      padding: const EdgeInsets.all(50),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.amber,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
