import 'package:collection/collection.dart';

class NewPassModel {
  bool? success;
  List<dynamic>? data;
  String? message;

  NewPassModel({this.success, this.data, this.message});

  factory NewPassModel.fromJson(Map<String, dynamic> json) => NewPassModel(
        success: json['success'] as bool?,
        data: json['data'] as List<dynamic>?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewPassModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ message.hashCode;
}
