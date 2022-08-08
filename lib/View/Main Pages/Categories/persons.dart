import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class PersonsPage extends StatefulWidget {
  const PersonsPage({Key? key}) : super(key: key);

  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {
   Widget bodyPage() {
    return const Text('Persons');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}