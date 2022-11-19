import 'package:collection/collection.dart';

class Data {
  int? balance;

  Data({this.balance});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json['balance'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'balance': balance,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => balance.hashCode;
}
