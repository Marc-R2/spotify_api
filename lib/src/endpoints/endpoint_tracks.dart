part of 'spotify_api_endpoint.dart';

class SpotifyApiTracks extends SpotifyApiEndpoint {
  SpotifyApiTracks({required super.api});

  /// Method: GET
  /// Endpoint: /v1/audio-analysis/{id}
  /// Description: Get Track's Audio Analysis
  Future<Success<AudioAnalysis>> getAudioAnalysis({
    required String id,
  }) async {
    const fail = Success<AudioAnalysis>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/audio-analysis/$id',
      );
      if (json == null) return fail;
      try {
        return Success(data: AudioAnalysis.fromJson(json));
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/audio-features
  /// Description: Get Tracks' Audio Features
  Future<Success<List<AudioFeatures>>> getAudioFeatures({
    required List<String> ids,
  }) async {
    const fail = Success<List<AudioFeatures>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/audio-features',
        queryParameters: {'ids': ids.join(',')},
      );
      if (json == null) return fail;
      try {
        final audioFeatures = json['audio_features'] != null
            ? List<AudioFeatures>.from(
                (json['audio_features'] as List).map(
                  (x) => AudioFeatures.fromJson(x as Map<String, dynamic>),
                ),
              )
            : <AudioFeatures>[];

        return Success(data: audioFeatures);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/audio-features/{id}
  /// Description: Get Track's Audio Features
  Future<Success<AudioFeatures>> getAudioFeaturesById({
    required String id,
  }) async {
    const fail = Success<AudioFeatures>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/audio-features/$id',
      );
      if (json == null) return fail;
      try {
        return Success(data: AudioFeatures.fromJson(json));
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/tracks
  /// Description: Get Several Tracks
  Future<Success<List<Track>>> getSeveralTracks({
    required List<String> ids,
    String? market,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/tracks',
        queryParameters: {
          'ids': ids.join(','),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final tracks = json['tracks'] != null
            ? List<Track>.from(
                (json['tracks'] as List)
                    .map((x) => Track.fromJson(x as Map<String, dynamic>)),
              )
            : <Track>[];

        return Success(data: tracks);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/tracks/{id}
  /// Description: Get a Track
}
