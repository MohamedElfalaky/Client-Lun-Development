import 'package:collection/collection.dart';

import 'user.dart';

class DeliveryAddress {
  int? id;
  String? area;
  String? street;
  String? buildingNum;
  String? flatNum;
  String? landmark;
  String? type;
  double? latitude;
  double? longitude;
  bool? isDefault;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  DeliveryAddress({
    this.id,
    this.area,
    this.street,
    this.buildingNum,
    this.flatNum,
    this.landmark,
    this.type,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) {
    return DeliveryAddress(
      id: json['id'] as int?,
      area: json['area'] as String?,
      street: json['street'] as String?,
      buildingNum: json['building_num'] as String?,
      flatNum: json['flat_num'] as String?,
      landmark: json['landmark'] as String?,
      type: json['type'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isDefault: json['is_default'] as bool?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'area': area,
        'street': street,
        'building_num': buildingNum,
        'flat_num': flatNum,
        'landmark': landmark,
        'type': type,
        'latitude': latitude,
        'longitude': longitude,
        'is_default': isDefault,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'user': user?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeliveryAddress) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      area.hashCode ^
      street.hashCode ^
      buildingNum.hashCode ^
      flatNum.hashCode ^
      landmark.hashCode ^
      type.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      isDefault.hashCode ^
      userId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      user.hashCode;
}
