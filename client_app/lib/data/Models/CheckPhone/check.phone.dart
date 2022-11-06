import 'dart:convert';

import 'package:equatable/equatable.dart';

class Check extends Equatable {
  final bool? success;
  final List<dynamic>? data;
  final String? message;

  const Check({this.success, this.data, this.message});

  factory Check.fromMap(Map<String, dynamic> data) => Check(
        success: data['success'] as bool?,
        data: data['data'] as List<dynamic>?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'data': data,
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Check].
  factory Check.fromJson(String data) {
    return Check.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Check] to a JSON string.
  String toJson() => json.encode(toMap());

  Check copyWith({
    bool? success,
    List<dynamic>? data,
    String? message,
  }) {
    return Check(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, data, message];
}
