part of '../../spotify_api.dart';

class PlaylistTrack {
  const PlaylistTrack({
    required this.addedAt,
    required this.addedBy,
    required this.isLocal,
    required this.track,
  });

  factory PlaylistTrack.fromJson(Map<String, dynamic> json) => PlaylistTrack(
        addedAt: DateTime.parse(json['added_at'] as String),
        addedBy: User.fromJson(json['added_by'] as Map<String, dynamic>),
        isLocal: json['is_local'] as bool,
        track: Track.fromJson(json['track'] as Map<String, dynamic>),
      );

  final DateTime addedAt;
  final User addedBy;
  final bool isLocal;
  final Track track;

  Map<String, dynamic> toJson() => {
        'added_at': addedAt.toIso8601String(),
        'added_by': addedBy.toJson(),
        'is_local': isLocal,
        'track': track.toJson(),
      };

  @override
  String toString() => 'Track ${track.name} added by ${addedBy.id} at $addedAt';
}
