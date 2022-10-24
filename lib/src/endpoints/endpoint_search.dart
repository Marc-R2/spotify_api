part of 'spotify_api_endpoint.dart';

class SpotifyApiSearch extends SpotifyApiEndpoint {
  SpotifyApiSearch({required super.api});

  /// Method: GET
  /// Endpoint: /v1/search
  /// Description: Search for an Track
  Future<Success<List<Track>>> searchTrack({
    required String query,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'search',
        queryParameters: {
          'q': query,
          'type': 'track',
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final tracks = json['tracks'] != null
            ? List<Track>.from(
                (json['tracks']['items'] as List)
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
  /// Endpoint: /v1/search
  /// Description: Search for an Artist
  Future<Success<List<Artist>>> searchArtist({
    required String query,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<Artist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'search',
        queryParameters: {
          'q': query,
          'type': 'artist',
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final artists = json['artists'] != null
            ? List<Artist>.from(
                (json['artists']['items'] as List)
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
