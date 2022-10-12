part of 'spotify_api_endpoint.dart';

class SpotifyApiPersonalization extends SpotifyApiEndpoint {
  SpotifyApiPersonalization({required super.api});

  /// Method: GET
  /// Endpoint: /v1/me/top/tracks
  /// Description: Get User's Top Tracks
  Future<Success<List<Track>>> getTopTracks({
    int? limit,
    int? offset,
    String? timeRange,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/me/top/tracks',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (timeRange != null) 'time_range': timeRange,
        },
      );
      if (json == null) return fail;
      try {
        final tracks = json['items'] != null
            ? List<Track>.from(
                (json['items'] as List)
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
  /// Endpoint: /v1/me/top/artists
  /// Description: Get User's Top Artists
  Future<Success<List<Artist>>> getTopArtists({
    int? limit,
    int? offset,
    String? timeRange,
  }) async {
    const fail = Success<List<Artist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/me/top/artists',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (timeRange != null) 'time_range': timeRange,
        },
      );
      if (json == null) return fail;
      try {
        final artists = json['items'] != null
            ? List<Artist>.from(
                (json['items'] as List)
                    .map((x) => Artist.fromJson(x as Map<String, dynamic>)),
              )
            : <Artist>[];

        return Success(data: artists);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }
}
