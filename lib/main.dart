import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:management_factory_system/Controller/my_scroll.dart';
import 'package:management_factory_system/Controller/windows_configuration.dart';
import 'package:management_factory_system/View/Main%20Pages/Essential%20Pages/login.dart';

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
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
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
      body: Login(),
    );
  }
}
