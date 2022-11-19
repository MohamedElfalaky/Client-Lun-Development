import 'package:collection/collection.dart';

class Pivot {
  int? marketId;
  int? fieldId;

  Pivot({this.marketId, this.fieldId});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        marketId: json['market_id'] as int?,
        fieldId: json['field_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'market_id': marketId,
        'field_id': fieldId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Pivot) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => marketId.hashCode ^ fieldId.hashCode;
}
