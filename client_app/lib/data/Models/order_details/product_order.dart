import 'package:collection/collection.dart';

class ProductOrder {
  int? id;
  int? price;
  int? quantity;
  int? productId;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? total;
  List<dynamic>? customFields;

  ProductOrder({
    this.id,
    this.price,
    this.quantity,
    this.productId,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.total,
    this.customFields,
  });

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        id: json['id'] as int?,
        price: json['price'] as int?,
        quantity: json['quantity'] as int?,
        productId: json['product_id'] as int?,
        orderId: json['order_id'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        name: json['name'] as String?,
        total: json['total'] as int?,
        customFields: json['custom_fields'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'quantity': quantity,
        'product_id': productId,
        'order_id': orderId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name': name,
        'total': total,
        'custom_fields': customFields,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductOrder) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      productId.hashCode ^
      orderId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      name.hashCode ^
      total.hashCode ^
      customFields.hashCode;
}
