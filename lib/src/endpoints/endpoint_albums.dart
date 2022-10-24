part of 'spotify_api_endpoint.dart';

class SpotifyApiAlbums extends SpotifyApiEndpoint {
  SpotifyApiAlbums({required super.api});

  /// Method: GET
  /// Endpoint: /v1/albums/{id}/tracks
  /// Description: Get Album Tracks
  Future<Success<List<Track>>> getAlbumTracks({
    required String id,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'albums/$id/tracks',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
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
  /// Endpoint: /v1/albums/{id}
  /// Description: Get an Album
  Future<Success<Album>> getAlbum({required String id, String? market}) async {
    const fail = Success<Album>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'albums/$id',
        queryParameters: {if (market != null) 'market': market},
      );
      if (json == null) return fail;
      try {
        final album = Album.fromJson(json);
        return Success(data: album);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/albums
  /// Description: Get Several Albums
  Future<Success<List<Album>>> getSeveralAlbums({
    required List<String> ids,
    String? market,
  }) async {
    const fail = Success<List<Album>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'albums',
        queryParameters: {
          'ids': ids.join(','),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final albums = json['albums'] != null
            ? List<Album>.from(
                (json['albums'] as List)
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
}
