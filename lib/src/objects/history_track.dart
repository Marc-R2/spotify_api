part of '../../spotify_api.dart';

class HistoryTrack {
  const HistoryTrack({
    required this.track,
    required this.playedAt,
  });

  factory HistoryTrack.fromJson(Map<String, dynamic> json) => HistoryTrack(
        track: Track.fromJson(json['track'] as Map<String, dynamic>),
        playedAt: DateTime.parse(json['played_at'] as String),
      );

  final Track track;

  final DateTime playedAt;

  Map<String, dynamic> toJson() => {
        'track': track.toJson(),
        'played_at': playedAt.toIso8601String(),
      };
}
