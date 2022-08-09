import 'package:flutter/material.dart';
import 'package:management_factory_system/Controller/my_scroll.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/home.dart';

void main() {
  WindowsConfiguration().windowSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Management Factory System',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}
