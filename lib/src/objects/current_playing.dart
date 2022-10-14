part of '../../spotify_api.dart';

class CurrentlyPlaying {
  const CurrentlyPlaying({
    required this.timestamp,
    required this.progressMs,
    required this.item,
    required this.isPlaying,
    required this.currentlyPlayingType,
    required this.createdAt,
  });

  factory CurrentlyPlaying.fromJson(Map<String, dynamic> json) =>
      CurrentlyPlaying(
        timestamp: json['timestamp'] as int,
        progressMs: json['progress_ms'] as int,
        item: Track.fromJson(json['item'] as Map<String, dynamic>),
        isPlaying: json['is_playing'] as bool,
        currentlyPlayingType: json['currently_playing_type'] as String,
        createdAt: DateTime.now(),
      );

  final DateTime createdAt;
  final int timestamp;

  // final Context? context;
  final int progressMs;
  final Track? item;
  final String? currentlyPlayingType;

  // final Actions? actions;
  final bool isPlaying;

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'progress_ms': progressMs,
        'item': item?.toJson(),
        'currently_playing_type': currentlyPlayingType,
        'is_playing': isPlaying,
      };

  @override
  String toString() => 'playing "${item?.name}" '
      '(progress: ${progressMs ~/ 1000}s)';
}
