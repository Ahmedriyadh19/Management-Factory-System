import 'dart:convert';

class Vender {
  int? id;
  String? idSystem;
  String name;
  String? phoneNumber;
  String? address;
  String? email;
  Vender({
    this.id,
    this.idSystem,
    required this.name,
    this.phoneNumber,
    this.address,
    this.email,
  });

  Vender copyWith({
    int? id,
    String? idSystem,
    String? name,
    String? phoneNumber,
    String? address,
    String? email,
  }) {
    return Vender(
      id: id ?? this.id,
      idSystem: idSystem ?? this.idSystem,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (idSystem != null) {
      result.addAll({'idSystem': idSystem});
    }
    result.addAll({'name': name});
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (email != null) {
      result.addAll({'email': email});
    }

    return result;
  }

  factory Vender.fromMap(Map<String, dynamic> map) {
    return Vender(
      id: map['id']?.toInt(),
      idSystem: map['idSystem'],
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vender.fromJson(String source) => Vender.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Vender(id: $id, idSystem: $idSystem, name: $name, phoneNumber: $phoneNumber, address: $address, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Vender &&
        other.id == id &&
        other.idSystem == idSystem &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idSystem.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        email.hashCode;
  }
}
