import 'package:collection/collection.dart';

class CheckPhone {
  bool? success;
  List<dynamic>? data;
  String? message;

  CheckPhone({this.success, this.data, this.message});

  factory CheckPhone.fromJson(Map<String, dynamic> json) => CheckPhone(
        success: json['success'] as bool?,
        data: json['data'] as List<dynamic>? ?? [],
        message: json['message'] as String?,
      );

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CheckPhone) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
        'message': message,
      };
}
