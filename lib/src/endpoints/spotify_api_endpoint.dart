import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/spotify_api_scopes.dart';

part 'endpoint_albums.dart';

part 'endpoint_artists.dart';

part 'endpoint_audiobooks.dart';

part 'endpoint_browse.dart';

part 'endpoint_chapters.dart';

part 'endpoint_episodes.dart';

part 'endpoint_follow.dart';

part 'endpoint_library.dart';

part 'endpoint_markets.dart';

part 'endpoint_personalization.dart';

part 'endpoint_player.dart';

part 'endpoint_playlists.dart';

part 'endpoint_search.dart';

part 'endpoint_shows.dart';

part 'endpoint_tracks.dart';

part 'endpoint_users.dart';

abstract class SpotifyApiEndpoint {
  SpotifyApiEndpoint({required SpotifyApiServer api}) : _api = api;

  final SpotifyApiServer _api;
}

class Success<T> {
  const Success({
    this.success = true,
    this.data,
  });

  final bool success;

  final T? data;

  @override
  String toString() {
    if (success) return 'Success: $data';
    return 'Failure: $data';
  }
}
