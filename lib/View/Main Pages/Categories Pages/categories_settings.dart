import 'package:flutter/material.dart';
import 'package:management_factory_system/View/Containers/background.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget bodyPage() {
    return const Text('Edit Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Background(widget: bodyPage());
  }
}
