import 'dart:convert';

class Salary {
  String id;
  DateTime dateTime;
  double amount;
  Salary({
    required this.id,
    required this.dateTime,
    required this.amount,
  });

  Salary copyWith({
    String? id,
    DateTime? dateTime,
    double? amount,
  }) {
    return Salary(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'amount': amount});

    return result;
  }

  factory Salary.fromMap(Map<String, dynamic> map) {
    return Salary(
      id: map['id'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      amount: map['amount']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Salary.fromJson(String source) => Salary.fromMap(json.decode(source));

  @override
  String toString() => 'Salary(id: $id, dateTime: $dateTime, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Salary &&
        other.id == id &&
        other.dateTime == dateTime &&
        other.amount == amount;
  }

  @override
  int get hashCode => id.hashCode ^ dateTime.hashCode ^ amount.hashCode;
}
