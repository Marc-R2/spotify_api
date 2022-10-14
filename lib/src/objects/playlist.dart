part of '../../spotify_api.dart';

class Playlist {
  const Playlist({
    required this.collaborative,
    required this.id,
    required this.name,
    required this.description,
    required this.href,
    required this.images,
    required this.snapshotId,
    required this.type,
    required this.uri,
    required this.externalUrls,
    required this.tracksUrl,
    required this.tracksTotal,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        collaborative: json['collaborative'] as bool,
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        href: json['href'] as String,
        images: List<CoverImage>.from(
          (json['images'] as List).map(
            (x) => CoverImage.fromJson(x as Map<String, dynamic>),
          ),
        ),
        snapshotId: json['snapshot_id'] as String,
        type: json['type'] as String,
        uri: json['uri'] as String,
        externalUrls: ExternalUrls.fromJson(
          json['external_urls'] as Map<String, dynamic>,
        ),
        tracksUrl: json['tracks']['href'] as String,
        tracksTotal: json['tracks']['total'] as int,
      );

  final bool collaborative;
  final String description;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final List<CoverImage> images;
  final String name;

  // final User owner;
  // final primaryColor;
  // final bool public;
  final String snapshotId;
  final String tracksUrl;
  final int tracksTotal;
  final String type;
  final String uri;

  Map<String, dynamic> toJson() => {
        'collaborative': collaborative,
        'description': description,
        'external_urls': externalUrls.toJson(),
        'href': href,
        'id': id,
        'images': images.map((x) => x.toJson()).toList(),
        'name': name,
        // 'owner': owner.toJson(),
        // 'primary_color': primaryColor,
        // 'public': public,
        'snapshot_id': snapshotId,
        'tracks': {
          'href': tracksUrl,
          'total': tracksTotal,
        },
        'type': type,
        'uri': uri,
      };
}
