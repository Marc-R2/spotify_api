part of '../../spotify_api.dart';

class Artist {
  const Artist({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(
          json['external_urls'] as Map<String, dynamic>,
        ),
        href: json['href'] as String,
        id: json['id'] as String,
        type: json['type'] as String,
        uri: json['uri'] as String,
      );

  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final String type;
  final String uri;

  Map<String, dynamic> toJson() => {
        'external_urls': externalUrls.toJson(),
        'href': href,
        'id': id,
        'type': type,
        'uri': uri,
      };
}
