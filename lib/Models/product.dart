import 'dart:convert';

class Product {
  String id;
  String name;
  double price;
  double quantity;
  int positions;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.positions,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    double? quantity,
    int? positions,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      positions: positions ?? this.positions,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});
    result.addAll({'positions': positions});
  
    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toDouble() ?? 0.0,
      positions: map['positions']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, quantity: $quantity, positions: $positions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.quantity == quantity &&
      other.positions == positions;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      positions.hashCode;
  }
}
