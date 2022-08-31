import 'dart:convert';

class Payment {
  int id;
  String idSystem;
  DateTime dateTime;
  String customerId;
  double amount;
  String adminId;
  String invoiceID;
  
  Payment({
    required this.id,
    required this.idSystem,
    required this.dateTime,
    required this.customerId,
    required this.amount,
    required this.adminId,
    required this.invoiceID,
  });

  Payment copyWith({
    int? id,
    String? idSystem,
    DateTime? dateTime,
    String? customerId,
    double? amount,
    String? adminId,
    String? invoiceID,
  }) {
    return Payment(
      id: id ?? this.id,
      idSystem: idSystem ?? this.idSystem,
      dateTime: dateTime ?? this.dateTime,
      customerId: customerId ?? this.customerId,
      amount: amount ?? this.amount,
      adminId: adminId ?? this.adminId,
      invoiceID: invoiceID ?? this.invoiceID,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'idSystem': idSystem});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'customerId': customerId});
    result.addAll({'amount': amount});
    result.addAll({'adminId': adminId});
    result.addAll({'invoiceID': invoiceID});
  
    return result;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id']?.toInt() ?? 0,
      idSystem: map['idSystem'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      customerId: map['customerId'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      adminId: map['adminId'] ?? '',
      invoiceID: map['invoiceID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(id: $id, idSystem: $idSystem, dateTime: $dateTime, customerId: $customerId, amount: $amount, adminId: $adminId, invoiceID: $invoiceID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Payment &&
      other.id == id &&
      other.idSystem == idSystem &&
      other.dateTime == dateTime &&
      other.customerId == customerId &&
      other.amount == amount &&
      other.adminId == adminId &&
      other.invoiceID == invoiceID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idSystem.hashCode ^
      dateTime.hashCode ^
      customerId.hashCode ^
      amount.hashCode ^
      adminId.hashCode ^
      invoiceID.hashCode;
  }
}
