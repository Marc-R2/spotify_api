part of '../spotify_api_endpoint.dart';

class SpotifyApiPlayer extends SpotifyApiEndpoint {
  SpotifyApiPlayer({required super.api});

  /// Method: GET
  /// Endpoint: /v1/me/player/queue
  /// Usage: Get the User's Queue
  Future<Success<UserQueue>> getUsersQueue() async {
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {
      final json = await _api.getRequest(endpoint: 'me/player/queue');
      if (json != null) {
        try {
          final currentlyPlaying = json['currently_playing'] != null
              ? Track.fromJson(
                  json['currently_playing'] as Map<String, dynamic>,
                )
              : null;

          final queue = json['queue'] != null
              ? List<Track>.from(
                  (json['queue'] as List)
                      .map((e) => Track.fromJson(e as Map<String, dynamic>)),
                )
              : <Track>[];

          return Success(
            data: UserQueue(
              currentlyPlaying: currentlyPlaying,
              queue: queue,
            ),
          );
        } catch (e) {
          print(e);
        }
      }
    }
    return const Success(success: false);
  }
}
