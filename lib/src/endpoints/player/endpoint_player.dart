part of '../spotify_api_endpoint.dart';

class SpotifyApiPlayer extends SpotifyApiEndpoint {
  SpotifyApiPlayer({required super.api});

  /// Method: GET
  /// Endpoint: /v1/me/player/queue
  /// Usage: Get the User's Queue
  Future<Success<UserQueue>> getUsersQueue() async {
    const fail = Success<UserQueue>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {
      final json = await _api.getRequest(endpoint: 'me/player/queue');
      if (json == null) return fail;
      try {
        final currentlyPlaying = json['currently_playing'] != null
            ? Track.fromJson(json['currently_playing'] as Map<String, dynamic>)
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
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/me/player/recently-played
  /// Usage: Get Recently Played Tracks
  Future<Success<List<HistoryTrack>>> getRecentlyPlayedTracks({
    int? limit,
    String? after,
    String? before,
  }) async {
    const fail = Success<List<HistoryTrack>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userReadRecentlyPlayed: true))) {
      final json = await _api.getRequest(
        endpoint: 'me/player/recently-played',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (after != null) 'after': after,
          if (before != null) 'before': before,
        },
      );
      if (json == null) return fail;
      try {
        final items = json['items'] != null
            ? List<HistoryTrack>.from(
                (json['items'] as List).map(
                    (e) => HistoryTrack.fromJson(e as Map<String, dynamic>)),
              )
            : <HistoryTrack>[];

        return Success(data: items);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/me/player
  /// Usage: Get Playback State
  Future<Success<PlaybackState>> getPlaybackState({
    String? market,
    String? additionalTypes,
  }) async {
    const fail = Success<PlaybackState>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {
      final json = await _api.getRequest(
        endpoint: 'me/player',
        queryParameters: {
          if (market != null) 'market': market,
          if (additionalTypes != null) 'additional_types': additionalTypes,
        },
      );
      if (json == null) return fail;
      try {
        return Success(data: PlaybackState.fromJson(json));
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }
}
