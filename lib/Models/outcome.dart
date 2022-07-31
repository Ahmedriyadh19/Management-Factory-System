import 'package:management_factory_system/Models/salary.dart';

class Outcome extends Salary {
  String description;
  Outcome(
      {required super.id,
      required super.dateTime,
      required super.amount,
      required this.description});
}
