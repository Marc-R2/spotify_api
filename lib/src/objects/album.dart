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
}
