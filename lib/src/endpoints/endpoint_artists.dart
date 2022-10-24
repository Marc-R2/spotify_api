part of 'spotify_api_endpoint.dart';

class SpotifyApiArtists extends SpotifyApiEndpoint {
  SpotifyApiArtists({required super.api});

  /// Method: GET
  /// Endpoint: /v1/artists/{id}/albums
  /// Description: Get an Artist's Albums
  Future<Success<List<Album>>> getArtistsAlbums({
    required String id,
    List<String>? includeGroups,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<Album>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'artists/$id/albums',
        queryParameters: {
          if (includeGroups != null) 'include_groups': includeGroups.join(','),
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final albums = json['items'] != null
            ? List<Album>.from(
                (json['items'] as List)
                    .map((x) => Album.fromJson(x as Map<String, dynamic>)),
              )
            : <Album>[];

        return Success(data: albums);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/artists/{id}/related-artists
  /// Description: Get an Artist's Related Artists
  Future<Success<List<Artist>>> getArtistsRelatedArtists({
    required String id,
  }) async {
    const fail = Success<List<Artist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'artists/$id/related-artists',
      );
      if (json == null) return fail;
      try {
        final artists = json['artists'] != null
            ? List<Artist>.from(
                (json['artists'] as List)
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

  /// Method: GET
  /// Endpoint: /v1/artists/{id}/top-tracks
  /// Description: Get an Artist's Top Tracks
  Future<Success<List<Track>>> getArtistsTopTracks({
    required String id,
    String? market,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'artists/$id/top-tracks',
        queryParameters: {if (market != null) 'market': market},
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
  /// Endpoint: /v1/artists/{id}
  /// Description: Get an Artist
  Future<Success<Artist>> getArtists({
    required String id,
  }) async {
    const fail = Success<Artist>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(endpoint: 'artists/$id');
      if (json == null) return fail;
      try {
        final artist = Artist.fromJson(json);

        return Success(data: artist);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/artists
  /// Description: Get Several Artists
  Future<Success<List<Artist>>> getSeveralArtists({
    required List<String> ids,
  }) async {
    const fail = Success<List<Artist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'artists',
        queryParameters: {'ids': ids.join(',')},
      );
      if (json == null) return fail;
      try {
        final artists = json['artists'] != null
            ? List<Artist>.from(
                (json['artists'] as List)
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
