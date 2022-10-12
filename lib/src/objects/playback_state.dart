part of '../../spotify_api.dart';

class PlaybackState {
  const PlaybackState({
    required this.device,
    required this.shuffleState,
    required this.repeatState,
    required this.timestamp,
    required this.progressMs,
    required this.item,
    required this.currentlyPlayingType,
    required this.isPlaying,
  });

  factory PlaybackState.fromJson(Map<String, dynamic> json) => PlaybackState(
        device: Device.fromJson(json['device'] as Map<String, dynamic>),
        shuffleState: json['shuffle_state'] as bool,
        repeatState: json['repeat_state'] as String,
        timestamp: DateTime.fromMillisecondsSinceEpoch(
          (json['timestamp'] as int) * 1000,
        ),
        progressMs: json['progress_ms'] as int,
        item: Track.fromJson(json['item'] as Map<String, dynamic>),
        currentlyPlayingType: json['currently_playing_type'] as String,
        isPlaying: json['is_playing'] as bool,
      );

  final Device device;
  final bool shuffleState;
  final String repeatState;
  final DateTime timestamp;

  // final Context context;
  final int progressMs;
  final Track item;
  final String currentlyPlayingType;

  // final Actions actions;
  final bool isPlaying;

  Map<String, dynamic> toJson() => {
        'device': device.toJson(),
        'shuffle_state': shuffleState,
        'repeat_state': repeatState,
        'timestamp': timestamp.millisecondsSinceEpoch ~/ 1000,
        'progress_ms': progressMs,
        'item': item.toJson(),
        'currently_playing_type': currentlyPlayingType,
        'is_playing': isPlaying,
      };

  @override
  String toString() => 'playing "${item.name}" on '
      '"${device.name}" (progress: ${progressMs ~/ 1000}s)';
}
