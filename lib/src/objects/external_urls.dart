part of '../../spotify_api.dart';

class ExternalUrls {
  const ExternalUrls({required this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json['spotify'] as String,
      );

  final String spotify;

  Map<String, dynamic> toJson() => {
        'spotify': spotify,
      };
}
