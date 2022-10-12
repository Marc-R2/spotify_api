
import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/endpoints/spotify_api_endpoint.dart';

class UserQueue {
  UserQueue({
    required this.currentlyPlaying,
    required this.queue,
  });

  final Track? currentlyPlaying;

  final List<Track> queue;
}
