part of '../../spotify_api.dart';

class User {
  const User({
    required this.type,
    required this.id,
    required this.uri,
    required this.href,
    required this.externalUrls,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        type: json['type'] as String,
        id: json['id'] as String,
        uri: json['uri'] as String,
        href: json['href'] as String,
        externalUrls: ExternalUrls.fromJson(
          json['external_urls'] as Map<String, dynamic>,
        ),
      );

  final String type;
  final String id;
  final String href;
  final String uri;
  final ExternalUrls externalUrls;

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'uri': uri,
        'href': href,
        'external_urls': externalUrls.toJson(),
      };
}
