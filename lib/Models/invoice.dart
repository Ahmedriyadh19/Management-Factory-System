import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:management_factory_system/Models/product.dart';

class Invoice {
  String id;
  DateTime dateTime;
  String adminID;
  double total;
  String location = '';
  List<Product> order;
  String customerID;

  Invoice({
    required this.id,
    required this.dateTime,
    required this.adminID,
    required this.total,
    required this.location,
    required this.order,
    required this.customerID,
  });

  Invoice copyWith({
    String? id,
    DateTime? dateTime,
    String? adminID,
    double? total,
    String? location,
    List<Product>? order,
    String? customerID,
  }) {
    return Invoice(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      adminID: adminID ?? this.adminID,
      total: total ?? this.total,
      location: location ?? this.location,
      order: order ?? this.order,
      customerID: customerID ?? this.customerID,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'adminID': adminID});
    result.addAll({'total': total});
    result.addAll({'location': location});
    result.addAll({'order': order.map((x) => x.toMap()).toList()});
    result.addAll({'customerID': customerID});
  
    return result;
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      adminID: map['adminID'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      location: map['location'] ?? '',
      order: List<Product>.from(map['order']?.map((x) => Product.fromMap(x))),
      customerID: map['customerID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Invoice(id: $id, dateTime: $dateTime, adminID: $adminID, total: $total, location: $location, order: $order, customerID: $customerID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Invoice &&
      other.id == id &&
      other.dateTime == dateTime &&
      other.adminID == adminID &&
      other.total == total &&
      other.location == location &&
      listEquals(other.order, order) &&
      other.customerID == customerID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      dateTime.hashCode ^
      adminID.hashCode ^
      total.hashCode ^
      location.hashCode ^
      order.hashCode ^
      customerID.hashCode;
  }
}
