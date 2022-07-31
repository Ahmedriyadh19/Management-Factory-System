import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class NewProject extends StatefulWidget {
  const NewProject({Key? key}) : super(key: key);

  @override
  State<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {
 Widget w() {
   return const Text('Hi');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: w());
  }
}
