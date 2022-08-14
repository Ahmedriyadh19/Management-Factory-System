import 'dart:convert';

class Customer {
  int? id;
  String idSystem;
  String name;
  String? phone;
  String? email;
  double? loan;
  double? paid;
  double? outstanding;

  Customer({
    this.id,
    required this.idSystem,
    required this.name,
    this.phone,
    this.email,
    this.loan,
    this.paid,
    this.outstanding,
  });

  Customer copyWith({
    int? id,
    String? idSystem,
    String? name,
    String? phone,
    String? email,
    double? loan,
    double? paid,
    double? outstanding,
  }) {
    return Customer(
      id: id ?? this.id,
      idSystem: idSystem ?? this.idSystem,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      loan: loan ?? this.loan,
      paid: paid ?? this.paid,
      outstanding: outstanding ?? this.outstanding,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'idSystem': idSystem});
    result.addAll({'name': name});
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (loan != null) {
      result.addAll({'loan': loan});
    }
    if (paid != null) {
      result.addAll({'paid': paid});
    }
    if (outstanding != null) {
      result.addAll({'outstanding': outstanding});
    }

    return result;
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id']?.toInt(),
      idSystem: map['idSystem'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'],
      email: map['email'],
      loan: map['loan']?.toDouble(),
      paid: map['paid']?.toDouble(),
      outstanding: map['outstanding']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(id: $id, idSystem: $idSystem, name: $name, phone: $phone, email: $email, loan: $loan, paid: $paid, outstanding: $outstanding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.idSystem == idSystem &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.loan == loan &&
        other.paid == paid &&
        other.outstanding == outstanding;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idSystem.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        loan.hashCode ^
        paid.hashCode ^
        outstanding.hashCode;
  }
}
