import 'package:collection/collection.dart';

class Payment {
  int? id;
  int? price;
  String? description;
  int? userId;
  String? status;
  String? method;
  String? createdAt;
  String? updatedAt;
  String? transactionId;
  List<dynamic>? customFields;

  Payment({
    this.id,
    this.price,
    this.description,
    this.userId,
    this.status,
    this.method,
    this.createdAt,
    this.updatedAt,
    this.transactionId,
    this.customFields,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json['id'] as int?,
        price: json['price'] as int?,
        description: json['description'] as String?,
        userId: json['user_id'] as int?,
        status: json['status'] as String?,
        method: json['method'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        transactionId: json['transaction_id'] as String?,
        customFields: json['custom_fields'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'description': description,
        'user_id': userId,
        'status': status,
        'method': method,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'transaction_id': transactionId,
        'custom_fields': customFields,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Payment) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      description.hashCode ^
      userId.hashCode ^
      status.hashCode ^
      method.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      transactionId.hashCode ^
      customFields.hashCode;
}
