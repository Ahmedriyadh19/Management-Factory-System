import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:management_factory_system/Models/salary.dart';

class Staff {
  String id;
  String name;
  List<Salary> salaries;
  Staff({
    required this.id,
    required this.name,
    required this.salaries,
  });

  Staff copyWith({
    String? id,
    String? name,
    List<Salary>? salaries,
  }) {
    return Staff(
      id: id ?? this.id,
      name: name ?? this.name,
      salaries: salaries ?? this.salaries,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'salaries': salaries.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      salaries: List<Salary>.from(map['salaries']?.map((x) => Salary.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Staff.fromJson(String source) => Staff.fromMap(json.decode(source));

  @override
  String toString() => 'Staff(id: $id, name: $name, salaries: $salaries)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Staff &&
      other.id == id &&
      other.name == name &&
      listEquals(other.salaries, salaries);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ salaries.hashCode;
}
