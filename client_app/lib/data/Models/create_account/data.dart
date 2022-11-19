import 'package:collection/collection.dart';

class Data {
  String? token;
  String? name;
  bool? hasMedia;
  List<dynamic>? media;

  Data({this.token, this.name, this.hasMedia, this.media});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        name: json['name'] as String?,
        hasMedia: json['has_media'] as bool?,
        media: json['media'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'name': name,
        'has_media': hasMedia,
        'media': media,
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
      token.hashCode ^ name.hashCode ^ hasMedia.hashCode ^ media.hashCode;
}
