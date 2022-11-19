import 'package:collection/collection.dart';

class Data {
  String? id;
  String? codeType;
  String? locale;
  int? length;
  String? to;
  String? channel;
  dynamic customBody;

  Data({
    this.id,
    this.codeType,
    this.locale,
    this.length,
    this.to,
    this.channel,
    this.customBody,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as String?,
        codeType: json['code_type'] as String?,
        locale: json['locale'] as String?,
        length: json['length'] as int?,
        to: json['to'] as String?,
        channel: json['channel'] as String?,
        customBody: json['custom_body'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code_type': codeType,
        'locale': locale,
        'length': length,
        'to': to,
        'channel': channel,
        'custom_body': customBody,
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
      codeType.hashCode ^
      locale.hashCode ^
      length.hashCode ^
      to.hashCode ^
      channel.hashCode ^
      customBody.hashCode;
}
