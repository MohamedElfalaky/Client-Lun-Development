import 'package:collection/collection.dart';

import 'delivery_address.dart';
import 'market.dart';
import 'payment.dart';
import 'product_order.dart';

class Data {
  int? id;
  int? userId;
  int? marketId;
  int? orderStatusId;
  int? tax;
  int? deliveryFee;
  String? hint;
  bool? active;
  dynamic driverId;
  int? deliveryAddressId;
  int? paymentId;
  String? createdAt;
  String? updatedAt;
  dynamic reasonRefused;
  int? timing;
  String? pdf;
  int? wallet;
  int? refunded;
  int? preOrder;
  String? expiredAt;
  String? preparingTime;
  List<ProductOrder>? productOrders;
  Payment? payment;
  DeliveryAddress? deliveryAddress;
  dynamic driver;
  Market? market;

  Data({
    this.id,
    this.userId,
    this.marketId,
    this.orderStatusId,
    this.tax,
    this.deliveryFee,
    this.hint,
    this.active,
    this.driverId,
    this.deliveryAddressId,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
    this.reasonRefused,
    this.timing,
    this.pdf,
    this.wallet,
    this.refunded,
    this.preOrder,
    this.expiredAt,
    this.preparingTime,
    this.productOrders,
    this.payment,
    this.deliveryAddress,
    this.driver,
    this.market,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        marketId: json['market_id'] as int?,
        orderStatusId: json['order_status_id'] as int?,
        tax: json['tax'] as int?,
        deliveryFee: json['delivery_fee'] as int?,
        hint: json['hint'] as String?,
        active: json['active'] as bool?,
        driverId: json['driver_id'] as dynamic,
        deliveryAddressId: json['delivery_address_id'] as int?,
        paymentId: json['payment_id'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        reasonRefused: json['reason_refused'] as dynamic,
        timing: json['timing'] as int?,
        pdf: json['pdf'] as String?,
        wallet: json['wallet'] as int?,
        refunded: json['refunded'] as int?,
        preOrder: json['pre_order'] as int?,
        expiredAt: json['expired_at'] as String?,
        preparingTime: json['preparing_time'] as String?,
        productOrders: (json['product_orders'] as List<dynamic>?)
            ?.map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
            .toList(),
        payment: json['payment'] == null
            ? null
            : Payment.fromJson(json['payment'] as Map<String, dynamic>),
        deliveryAddress: json['delivery_address'] == null
            ? null
            : DeliveryAddress.fromJson(
                json['delivery_address'] as Map<String, dynamic>),
        driver: json['driver'] as dynamic,
        market: json['market'] == null
            ? null
            : Market.fromJson(json['market'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'market_id': marketId,
        'order_status_id': orderStatusId,
        'tax': tax,
        'delivery_fee': deliveryFee,
        'hint': hint,
        'active': active,
        'driver_id': driverId,
        'delivery_address_id': deliveryAddressId,
        'payment_id': paymentId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'reason_refused': reasonRefused,
        'timing': timing,
        'pdf': pdf,
        'wallet': wallet,
        'refunded': refunded,
        'pre_order': preOrder,
        'expired_at': expiredAt,
        'preparing_time': preparingTime,
        'product_orders': productOrders?.map((e) => e.toJson()).toList(),
        'payment': payment?.toJson(),
        'delivery_address': deliveryAddress?.toJson(),
        'driver': driver,
        'market': market?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      marketId.hashCode ^
      orderStatusId.hashCode ^
      tax.hashCode ^
      deliveryFee.hashCode ^
      hint.hashCode ^
      active.hashCode ^
      driverId.hashCode ^
      deliveryAddressId.hashCode ^
      paymentId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      reasonRefused.hashCode ^
      timing.hashCode ^
      pdf.hashCode ^
      wallet.hashCode ^
      refunded.hashCode ^
      preOrder.hashCode ^
      expiredAt.hashCode ^
      preparingTime.hashCode ^
      productOrders.hashCode ^
      payment.hashCode ^
      deliveryAddress.hashCode ^
      driver.hashCode ^
      market.hashCode;
}
