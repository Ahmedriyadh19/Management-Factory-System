import 'dart:convert';

class Payment {
  String id;
  DateTime dateTime;
  String customerId;
  double amount;
  String adminId;
  Payment({
    required this.id,
    required this.dateTime,
    required this.customerId,
    required this.amount,
    required this.adminId,
  });

  Payment copyWith({
    String? id,
    DateTime? dateTime,
    String? customerId,
    double? amount,
    String? adminId,
  }) {
    return Payment(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      adminId: adminId ?? this.adminId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'customerId': customerId});
    result.addAll({'amount': amount});
    result.addAll({'adminId': adminId});
  
    return result;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      customerId: map['customerId'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      adminId: map['adminId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(id: $id, dateTime: $dateTime, customerId: $customerId, amount: $amount, adminId: $adminId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Payment &&
      other.id == id &&
      other.dateTime == dateTime &&
      other.customerId == customerId &&
      other.amount == amount &&
      other.adminId == adminId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dateTime.hashCode ^
      customerId.hashCode ^
      amount.hashCode ^
      adminId.hashCode;
  }
}
