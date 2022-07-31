import 'dart:convert';

class Customer {
  String id;
  String name;
  String phone;
  double loan;
  double paid;
  double outstanding;
  Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.loan,
    required this.paid,
    required this.outstanding,
  });

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    double? loan,
    double? paid,
    double? outstanding,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      loan: loan ?? this.loan,
      paid: paid ?? this.paid,
      outstanding: outstanding ?? this.outstanding,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'phone': phone});
    result.addAll({'loan': loan});
    result.addAll({'paid': paid});
    result.addAll({'outstanding': outstanding});
  
    return result;
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      loan: map['loan']?.toDouble() ?? 0.0,
      paid: map['paid']?.toDouble() ?? 0.0,
      outstanding: map['outstanding']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, phone: $phone, loan: $loan, paid: $paid, outstanding: $outstanding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Customer &&
      other.id == id &&
      other.name == name &&
      other.phone == phone &&
      other.loan == loan &&
      other.paid == paid &&
      other.outstanding == outstanding;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      loan.hashCode ^
      paid.hashCode ^
      outstanding.hashCode;
  }
}
