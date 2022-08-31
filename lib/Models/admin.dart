import 'dart:convert';

class Admin {
  int id;
  String idSystem;
  String userName;
  String password;
  
  Admin({
    required this.id,
    required this.idSystem,
    required this.userName,
    required this.password,
  });

  Admin copyWith({
    int? id,
    String? idSystem,
    String? userName,
    String? password,
  }) {
    return Admin(
      id: id ?? this.id,
      idSystem: idSystem ?? this.idSystem,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'idSystem': idSystem});
    result.addAll({'userName': userName});
    result.addAll({'password': password});
  
    return result;
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id']?.toInt() ?? 0,
      idSystem: map['idSystem'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Admin(id: $id, idSystem: $idSystem, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Admin &&
      other.id == id &&
      other.idSystem == idSystem &&
      other.userName == userName &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSystem.hashCode ^
      userName.hashCode ^
      password.hashCode;
  }
}
