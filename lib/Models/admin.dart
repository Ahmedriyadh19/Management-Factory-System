import 'dart:convert';

class Admin {
  String id;
  String userName;
  String password;
  Admin({
    required this.id,
    required this.userName,
    required this.password,
  });

  Admin copyWith({
    String? id,
    String? userName,
    String? password,
  }) {
    return Admin(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'userName': userName});
    result.addAll({'password': password});
  
    return result;
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() => 'Admin(id: $id, userName: $userName, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Admin &&
      other.id == id &&
      other.userName == userName &&
      other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ userName.hashCode ^ password.hashCode;
}
