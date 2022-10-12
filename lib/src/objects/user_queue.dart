part of '../../spotify_api.dart';

class UserQueue {
  const UserQueue({
    required this.currentlyPlaying,
    required this.queue,
  });

  final Track? currentlyPlaying;

  final List<Track> queue;

  @override
  String toString() {
    return 'UserQueue(current: ${currentlyPlaying?.name} + '
        'queued: ${queue.length} items)';
  }
}
