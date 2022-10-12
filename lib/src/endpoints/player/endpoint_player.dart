part of '../spotify_api_endpoint.dart';

class SpotifyApiPlayer extends SpotifyApiEndpoint {
  SpotifyApiPlayer({required super.api});

  /// Method: GET
  /// Endpoint: /v1/me/player/queue
  /// Usage: Get the User's Queue
  Future<List> getUsersQueue() async {
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {

    }
    return [];
  }
}
