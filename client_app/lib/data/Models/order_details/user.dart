import 'package:collection/collection.dart';

class User {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? apiToken;
  String? deviceToken;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  dynamic braintreeId;
  dynamic paypalEmail;
  String? createdAt;
  String? updatedAt;
  dynamic parentId;
  dynamic birthdate;
  List<dynamic>? customFields;
  bool? hasMedia;
  List<dynamic>? media;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.apiToken,
    this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.birthdate,
    this.customFields,
    this.hasMedia,
    this.media,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as dynamic,
        phone: json['phone'] as String?,
        apiToken: json['api_token'] as String?,
        deviceToken: json['device_token'] as String?,
        stripeId: json['stripe_id'] as dynamic,
        cardBrand: json['card_brand'] as dynamic,
        cardLastFour: json['card_last_four'] as dynamic,
        trialEndsAt: json['trial_ends_at'] as dynamic,
        braintreeId: json['braintree_id'] as dynamic,
        paypalEmail: json['paypal_email'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        parentId: json['parent_id'] as dynamic,
        birthdate: json['birthdate'] as dynamic,
        customFields: json['custom_fields'] as List<dynamic>?,
        hasMedia: json['has_media'] as bool?,
        media: json['media'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'api_token': apiToken,
        'device_token': deviceToken,
        'stripe_id': stripeId,
        'card_brand': cardBrand,
        'card_last_four': cardLastFour,
        'trial_ends_at': trialEndsAt,
        'braintree_id': braintreeId,
        'paypal_email': paypalEmail,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'parent_id': parentId,
        'birthdate': birthdate,
        'custom_fields': customFields,
        'has_media': hasMedia,
        'media': media,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      apiToken.hashCode ^
      deviceToken.hashCode ^
      stripeId.hashCode ^
      cardBrand.hashCode ^
      cardLastFour.hashCode ^
      trialEndsAt.hashCode ^
      braintreeId.hashCode ^
      paypalEmail.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      parentId.hashCode ^
      birthdate.hashCode ^
      customFields.hashCode ^
      hasMedia.hashCode ^
      media.hashCode;
}
