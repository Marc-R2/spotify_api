part of 'spotify_api_endpoint.dart';

class SpotifyApiPlaylists extends SpotifyApiEndpoint {
  SpotifyApiPlaylists({required super.api});

  /// Method: DELETE
  /// Endpoint: /v1/playlists/{playlist_id}/tracks
  /// Description: Remove Tracks from a Playlist
  Future<Success<bool>> removeTracksFromPlaylist({
    required String playlistId,
    required List<String> uris,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.deleteRequest(
        endpoint: '/v1/playlists/$playlistId/tracks',
        queryParameters: {'uris': uris.join(',')},
      );
      if (json == null) return fail;
      try {
        final snapshotId = json['snapshot_id'] as String;
        return Success(data: snapshotId.isNotEmpty);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/me/playlists
  /// Description: Get a List of Current User's Playlists
  Future<Success<List<Playlist>>> getMyPlaylists({
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Playlist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/me/playlists',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final playlists = json['items'] != null
            ? List<Playlist>.from(
                (json['items'] as List)
                    .map((x) => Playlist.fromJson(x as Map<String, dynamic>)),
              )
            : <Playlist>[];

        return Success(data: playlists);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/playlists/{playlist_id}/images
  /// Description: Get a Playlist Cover Image
  Future<Success<List<Image>>> getPlaylistCoverImage({
    required String playlistId,
  }) async {
    const fail = Success<List<Image>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/playlists/$playlistId/images',
      );
      if (json == null) return fail;
      try {
        final images = json['images'] != null
            ? List<Image>.from(
                (json['images'] as List)
                    .map((x) => Image.fromJson(x as Map<String, dynamic>)),
              )
            : <Image>[];

        return Success(data: images);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/playlists/{playlist_id}/tracks
  /// Description: Get a Playlist's Items
  Future<Success<List<PlaylistTrack>>> getPlaylistItems({
    required String playlistId,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<PlaylistTrack>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/playlists/$playlistId/tracks',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final items = json['items'] != null
            ? List<PlaylistTrack>.from(
                (json['items'] as List).map(
                    (x) => PlaylistTrack.fromJson(x as Map<String, dynamic>)),
              )
            : <PlaylistTrack>[];

        return Success(data: items);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/users/{user_id}/playlists
  /// Description: Get a User's Playlist
  Future<Success<List<Playlist>>> getUserPlaylists({
    required String userId,
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Playlist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/users/$userId/playlists',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final playlists = json['items'] != null
            ? List<Playlist>.from(
                (json['items'] as List)
                    .map((x) => Playlist.fromJson(x as Map<String, dynamic>)),
              )
            : <Playlist>[];

        return Success(data: playlists);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/playlists/{playlist_id}
  /// Description: Get a Playlist
  Future<Success<Playlist>> getPlaylist({
    required String playlistId,
    String? market,
  }) async {
    const fail = Success<Playlist>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/playlists/$playlistId',
        queryParameters: {
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final playlist = Playlist.fromJson(json);
        return Success(data: playlist);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: POST
  /// Endpoint: /v1/playlists/{playlist_id}/tracks
  /// Description: Add Tracks to a Playlist
  Future<Success<bool>> addTracksToPlaylist({
    required String playlistId,
    required List<String> uris,
    int? position,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.postRequest(
        endpoint: '/v1/playlists/$playlistId/tracks',
        queryParameters: {
          'uris': uris.join(','),
          if (position != null) 'position': position.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final snapshotId = json['snapshot_id'] as String;
        return Success(data: snapshotId.isNotEmpty);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: POST
  /// Endpoint: /v1/{user_id}/playlists
  /// Description: Create a Playlist
  Future<Success<Playlist>> createPlaylist({
    required String userId,
    required String name,
    bool? isPublic,
    bool? isCollaborative,
    String? description,
  }) async {
    const fail = Success<Playlist>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.postRequest(
        endpoint: '/v1/$userId/playlists',
        data: {
          'name': name,
          if (isPublic != null) 'public': isPublic.toString(),
          if (isCollaborative != null)
            'collaborative': isCollaborative.toString(),
          if (description != null) 'description': description,
        },
      );
      if (json == null) return fail;
      try {
        final playlist = Playlist.fromJson(json);
        return Success(data: playlist);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/playlists/{playlist_id}/images
  /// Description: Upload a Custom Playlist Cover Image
  Future<Success<bool>> uploadPlaylistCoverImage({
    required String playlistId,
    required String base64Image,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.putRequest(
        endpoint: '/v1/playlists/$playlistId/images',
        data: base64Image,
      );
      if (json == null) return fail;
      try {
        return const Success(data: true);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: PUT
  /// Endpoint: /v1/playlists/{playlist_id}/tracks
  /// Description: Update Playlist Items
  Future<Success<bool>> updatePlaylistItems({
    required String playlistId,
    // required List<PlaylistItem> items,
  }) {
    throw UnimplementedError();
  }

  /// Method: PUT
  /// Endpoint: /v1/playlists/{playlist_id}
  /// Description: Change a Playlist's Details
  Future<Success<bool>> changePlaylistDetails({
    required String playlistId,
    required String name,
    bool? isPublic,
    bool? isCollaborative,
    String? description,
  }) async {
    const fail = Success<bool>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.putRequest(
        endpoint: '/v1/playlists/$playlistId',
        data: {
          'name': name,
          if (isPublic != null) 'public': isPublic.toString(),
          if (isCollaborative != null) 'collaborative': isCollaborative,
          if (description != null) 'description': description,
        },
      );
      if (json == null) return fail;
      try {
        return const Success(data: true);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }
}
