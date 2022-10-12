part of '../../spotify_api.dart';

class Track {
  const Track({
    required this.album,
    required this.artists,
    required this.availableMarkets,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalIds,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.name,
    required this.popularity,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: Album.fromJson(json['album'] as Map<String, dynamic>),
        artists: List<Artist>.from(
          (json['artists'] as List).map(
            (x) => Artist.fromJson(x as Map<String, dynamic>),
          ),
        ),
        availableMarkets: Markets.fromJson(
          json['available_markets'] as Map<String, dynamic>,
        ),
        discNumber: json['disc_number'] as int,
        durationMs: json['duration_ms'] as int,
        explicit: json['explicit'] as bool,
        externalIds: ExternalIds.fromJson(
          json['external_ids'] as Map<String, dynamic>,
        ),
        externalUrls: ExternalUrls.fromJson(
          json['external_urls'] as Map<String, dynamic>,
        ),
        href: json['href'] as String,
        id: json['id'] as String,
        isLocal: json['is_local'] as bool,
        name: json['name'] as String,
        popularity: json['popularity'] as int,
        previewUrl: json['preview_url'] as String,
        trackNumber: json['track_number'] as int,
        type: json['type'] as String,
        uri: json['uri'] as String,
      );

  final Album album;
  final List<Artist> artists;
  final Markets availableMarkets;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  final ExternalIds externalIds;
  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final bool isLocal;
  final String name;
  final int popularity;
  final String previewUrl;
  final int trackNumber;
  final String type;
  final String uri;
}
