part of '../../spotify_api.dart';

class Album {
  const Album({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json['album_type'] as String,
        artists: List<Artist>.from(
          (json['artists'] as List).map(
            (x) => Artist.fromJson(x as Map<String, dynamic>),
          ),
        ),
        availableMarkets: Markets.fromJson(
          json['available_markets'] as List<dynamic>,
        ),
        externalUrls: ExternalUrls.fromJson(
          json['external_urls'] as Map<String, dynamic>,
        ),
        href: json['href'] as String,
        id: json['id'] as String,
        images: List<Image>.from(
          (json['images'] as List).map(
            (x) => Image.fromJson(x as Map<String, dynamic>),
          ),
        ),
        name: json['name'] as String,
        releaseDate: json['release_date'] as String,
        releaseDatePrecision: json['release_date_precision'] as String,
        totalTracks: json['total_tracks'] as int,
        type: json['type'] as String,
        uri: json['uri'] as String,
      );

  final String albumType;
  final List<Artist> artists;
  final Markets availableMarkets;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final List<Image> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final int totalTracks;
  final String type;
  final String uri;

  Map<String, dynamic> toJson() => {
        'album_type': albumType,
        'artists': artists.map((x) => x.toJson()).toList(),
        'available_markets': availableMarkets.toJson(),
        'external_urls': externalUrls.toJson(),
        'href': href,
        'id': id,
        'images': images.map((x) => x.toJson()).toList(),
        'name': name,
        'release_date': releaseDate,
        'release_date_precision': releaseDatePrecision,
        'total_tracks': totalTracks,
        'type': type,
        'uri': uri,
      };
}
