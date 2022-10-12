part of 'spotify_api_endpoint.dart';

class SpotifyApiBrowse extends SpotifyApiEndpoint {
  SpotifyApiBrowse({required super.api});

  /// Method: GET
  /// Endpoint: /v1/recommendations/available-genre-seeds
  /// Description: Get Available Genre Seeds
  Future<Success<List<String>>> getAvailableGenreSeeds() async {
    const fail = Success<List<String>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/recommendations/available-genre-seeds',
      );
      if (json == null) return fail;
      try {
        final genres = List<String>.from(json['genres'] as List);
        return Success(data: genres);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/browse/categories
  /// Description: Get Several Browse Categories
  Future<Success<List<Category>>> getBrowseCategories({
    String? country,
    String? locale,
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Category>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/browse/categories',
        queryParameters: {
          if (country != null) 'country': country,
          if (locale != null) 'locale': locale,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final categories = json['categories'] != null
            ? List<Category>.from(
                (json['categories'] as List)
                    .map((x) => Category.fromJson(x as Map<String, dynamic>)),
              )
            : <Category>[];
        return Success(data: categories);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/browse/categories/{category_id}
  /// Description: Get Single Browse Category
  Future<Success<Category>> getBrowseCategory({
    required String categoryId,
    String? country,
    String? locale,
  }) async {
    const fail = Success<Category>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/browse/categories/$categoryId',
        queryParameters: {
          if (country != null) 'country': country,
          if (locale != null) 'locale': locale,
        },
      );
      if (json == null) return fail;
      try {
        final category = Category.fromJson(json);
        return Success(data: category);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/browse/categories/{category_id}/playlists
  /// Description: Get a Category's Playlists
  Future<Success<List<Playlist>>> getBrowseCategoryPlaylists({
    required String categoryId,
    String? country,
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Playlist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/browse/categories/$categoryId/playlists',
        queryParameters: {
          if (country != null) 'country': country,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final playlists = json['playlists'] != null
            ? List<Playlist>.from(
                (json['playlists'] as List)
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
  /// Endpoint: /v1/browse/featured-playlists
  /// Description: Get a List of Featured Playlists
  Future<Success<List<Playlist>>> getFeaturedPlaylists({
    String? country,
    String? locale,
    int? timestamp,
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Playlist>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/browse/featured-playlists',
        queryParameters: {
          if (country != null) 'country': country,
          if (locale != null) 'locale': locale,
          if (timestamp != null) 'timestamp': timestamp.toString(),
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final featuredPlaylists = json['playlists'] != null
            ? List<Playlist>.from(
                (json['playlists'] as List)
                    .map((x) => Playlist.fromJson(x as Map<String, dynamic>)),
              )
            : <Playlist>[];
        return Success(data: featuredPlaylists);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/browse/new-releases
  /// Description: Get a List of New Releases
  Future<Success<List<Album>>> getNewReleases({
    String? country,
    int? limit,
    int? offset,
  }) async {
    const fail = Success<List<Album>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/browse/new-releases',
        queryParameters: {
          if (country != null) 'country': country,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );
      if (json == null) return fail;
      try {
        final newReleases = json['albums'] != null
            ? List<Album>.from(
                (json['albums'] as List)
                    .map((x) => Album.fromJson(x as Map<String, dynamic>)),
              )
            : <Album>[];
        return Success(data: newReleases);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/recommendations
  /// Description: Get Recommendations
  Future<Success<List<Track>>> getRecommendations({
    List<String>? seedArtists,
    List<String>? seedGenres,
    List<String>? seedTracks,
    int? limit,
    int? minAcousticness,
    int? maxAcousticness,
    int? targetAcousticness,
    int? minDanceability,
    int? maxDanceability,
    int? targetDanceability,
    int? minDurationMs,
    int? maxDurationMs,
    int? targetDurationMs,
    int? minEnergy,
    int? maxEnergy,
    int? targetEnergy,
    int? minInstrumentalness,
    int? maxInstrumentalness,
    int? targetInstrumentalness,
    int? minKey,
    int? maxKey,
    int? targetKey,
    int? minLiveness,
    int? maxLiveness,
    int? targetLiveness,
    int? minLoudness,
    int? maxLoudness,
    int? targetLoudness,
    int? minMode,
    int? maxMode,
    int? targetMode,
    int? minPopularity,
    int? maxPopularity,
    int? targetPopularity,
    int? minSpeechiness,
    int? maxSpeechiness,
    int? targetSpeechiness,
    int? minTempo,
    int? maxTempo,
    int? targetTempo,
    int? minTimeSignature,
    int? maxTimeSignature,
    int? targetTimeSignature,
    int? minValence,
    int? maxValence,
    int? targetValence,
  }) async {
    const fail = Success<List<Track>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/recommendations',
        queryParameters: {
          if (seedArtists != null) 'seed_artists': seedArtists.join(','),
          if (seedGenres != null) 'seed_genres': seedGenres.join(','),
          if (seedTracks != null) 'seed_tracks': seedTracks.join(','),
          if (limit != null) 'limit': limit.toString(),
          if (minAcousticness != null)
            'min_acousticness': minAcousticness.toString(),
          if (maxAcousticness != null)
            'max_acousticness': maxAcousticness.toString(),
          if (targetAcousticness != null)
            'target_acousticness': targetAcousticness.toString(),
          if (minDanceability != null)
            'min_danceability': minDanceability.toString(),
          if (maxDanceability != null)
            'max_danceability': maxDanceability.toString(),
          if (targetDanceability != null)
            'target_danceability': targetDanceability.toString(),
          if (minDurationMs != null)
            'min_duration_ms': minDurationMs.toString(),
          if (maxDurationMs != null)
            'max_duration_ms': maxDurationMs.toString(),
          if (targetDurationMs != null)
            'target_duration_ms': targetDurationMs.toString(),
          if (minEnergy != null) 'min_energy': minEnergy.toString(),
          if (maxEnergy != null) 'max_energy': maxEnergy.toString(),
          if (targetEnergy != null) 'target_energy': targetEnergy.toString(),
          if (minInstrumentalness != null)
            'min_instrumentalness': minInstrumentalness.toString(),
          if (maxInstrumentalness != null)
            'max_instrumentalness': maxInstrumentalness.toString(),
          if (targetInstrumentalness != null)
            'target_instrumentalness': targetInstrumentalness.toString(),
          if (minKey != null) 'min_key': minKey.toString(),
          if (maxKey != null) 'max_key': maxKey.toString(),
          if (targetKey != null) 'target_key': targetKey.toString(),
          if (minLiveness != null) 'min_liveness': minLiveness.toString(),
          if (maxLiveness != null) 'max_liveness': maxLiveness.toString(),
          if (targetLiveness != null)
            'target_liveness': targetLiveness.toString(),
          if (minLoudness != null) 'min_loudness': minLoudness.toString(),
          if (maxLoudness != null) 'max_loudness': maxLoudness.toString(),
          if (targetLoudness != null)
            'target_loudness': targetLoudness.toString(),
          if (minMode != null) 'min_mode': minMode.toString(),
          if (maxMode != null) 'max_mode': maxMode.toString(),
          if (targetMode != null) 'target_mode': targetMode.toString(),
          if (minPopularity != null) 'min_popularity': minPopularity.toString(),
          if (maxPopularity != null) 'max_popularity': maxPopularity.toString(),
          if (targetPopularity != null)
            'target_popularity': targetPopularity.toString(),
          if (minSpeechiness != null)
            'min_speechiness': minSpeechiness.toString(),
          if (maxSpeechiness != null)
            'max_speechiness': maxSpeechiness.toString(),
          if (targetSpeechiness != null)
            'target_speechiness': targetSpeechiness.toString(),
          if (minTempo != null) 'min_tempo': minTempo.toString(),
          if (maxTempo != null) 'max_tempo': maxTempo.toString(),
          if (targetTempo != null) 'target_tempo': targetTempo.toString(),
          if (minTimeSignature != null)
            'min_time_signature': minTimeSignature.toString(),
          if (maxTimeSignature != null)
            'max_time_signature': maxTimeSignature.toString(),
          if (targetTimeSignature != null)
            'target_time_signature': targetTimeSignature.toString(),
          if (minValence != null) 'min_valence': minValence.toString(),
          if (maxValence != null) 'max_valence': maxValence.toString(),
          if (targetValence != null) 'target_valence': targetValence.toString(),
        },
      );
      if (json != null) {
        try {
          return Success<List<Track>>(
            data: (json['tracks'] as List)
                .map((e) => Track.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
        } catch (e, trace) {
          print('$e => $trace');
        }
      }
    }
    return fail;
  }
}
