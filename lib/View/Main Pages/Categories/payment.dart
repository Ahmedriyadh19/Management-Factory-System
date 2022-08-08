import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Widget bodyPage() {
    return const Text('Payment');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
