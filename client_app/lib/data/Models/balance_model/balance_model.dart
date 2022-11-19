import 'package:collection/collection.dart';

import 'data.dart';

class BalanceModel {
  bool? success;
  Data? data;
  String? message;

  BalanceModel({this.success, this.data, this.message});

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BalanceModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ message.hashCode;
}
