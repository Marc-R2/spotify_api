part of 'spotify_api_endpoint.dart';

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

  /// Method: POST
  /// Endpoint: /v1/me/player/queue
  /// Usage: Add an Item to the User's Queue
  Future<Success<bool>> addToUsersQueue({
    required String uri,
    String? deviceId,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.postRequest(
        endpoint: 'me/player/queue',
        queryParameters: {
          'uri': uri,
          if (deviceId != null) 'device_id': deviceId,
        },
      );
      if (json == null) return fail;
      try {
        return Success(data: json['snapshot_id'] != null);
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
                  (e) => HistoryTrack.fromJson(e as Map<String, dynamic>),
                ),
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

  /// Method: GET
  /// Endpoint: /v1/me/player/devices
  /// Usage: Get Available Devices
  Future<Success<List<Device>>> getAvailableDevices() async {
    const fail = Success<List<Device>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {
      final json = await _api.getRequest(endpoint: 'me/player/devices');
      if (json == null) return fail;
      try {
        final devices = json['devices'] != null
            ? List<Device>.from(
                (json['devices'] as List)
                    .map((e) => Device.fromJson(e as Map<String, dynamic>)),
              )
            : <Device>[];

        return Success(data: devices);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/me/player/currently-playing
  /// Usage: Get Currently Playing Track
  Future<Success<CurrentlyPlaying>> getCurrentlyPlaying({
    String? market,
    String? additionalTypes,
  }) async {
    const fail = Success<CurrentlyPlaying>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userReadPlaybackState: true))) {
      final json = await _api.getRequest(
        endpoint: 'me/player/currently-playing',
        queryParameters: {
          if (market != null) 'market': market,
          if (additionalTypes != null) 'additional_types': additionalTypes,
        },
      );
      if (json == null) return fail;
      try {
        return Success(data: CurrentlyPlaying.fromJson(json));
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: POST
  /// Endpoint: /v1/me/player/next
  /// Usage: Skip To Next Track
  Future<Success<bool>> skipToNextTrack({String? device}) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.postRequest(
        endpoint: 'me/player/next',
        queryParameters: {
          if (device != null) 'device': device,
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: POST
  /// Endpoint: /v1/me/player/previous
  /// Usage: Skip To Previous Track
  Future<Success<bool>> skipToPreviousTrack({String? device}) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.postRequest(
        endpoint: 'me/player/previous',
        queryParameters: {
          if (device != null) 'device': device,
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/pause
  /// Usage: Pause Playback
  Future<Success<bool>> pausePlayback({String? device}) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/pause',
        queryParameters: {
          if (device != null) 'device': device,
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/play
  /// Usage: Start/Resume Playback
  Future<Success<bool>> startResumePlayback({
    String? device,
    String? context,
    List<String>? uris,
    String? offset,
    int? position,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/play',
        queryParameters: {
          if (device != null) 'device': device,
        },
        data: {
          if (context != null) 'context_uri': context,
          if (offset != null) 'offset': {'position': offset},
          if (position != null) 'position_ms': position.toString(),
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/repeat
  /// Usage: Set Repeat Mode
  Future<Success<bool>> setRepeatMode({
    String? device,
    required String state,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/repeat',
        queryParameters: {
          if (device != null) 'device': device,
          'state': state,
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/seek
  /// Usage: Seek To Position
  Future<Success<bool>> seekToPosition({
    String? device,
    required int position,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/seek',
        queryParameters: {
          if (device != null) 'device': device,
          'position_ms': position.toString(),
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/shuffle
  /// Usage: Toggle Playback Shuffle
  Future<Success<bool>> togglePlaybackShuffle({
    String? device,
    required bool state,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/shuffle',
        queryParameters: {
          if (device != null) 'device': device,
          'state': state.toString(),
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player
  /// Usage: Transfer Playback
  Future<Success<bool>> transferPlayback({
    required List<String> devices,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player',
        data: {
          'device_ids': devices,
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/me/player/volume
  /// Usage: Set Volume
  Future<Success<bool>> setVolume({
    String? device,
    required int volume,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes(userModifyPlaybackState: true))) {
      final json = await _api.putRequest(
        endpoint: 'me/player/volume',
        queryParameters: {
          if (device != null) 'device': device,
          'volume_percent': volume.toString(),
        },
      );
      if (json == null) return fail;
      return const Success(data: true);
    }
    return fail;
  }
}
