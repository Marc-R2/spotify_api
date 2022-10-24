part of 'spotify_api_endpoint.dart';

class SpotifyApiAudioBooks extends SpotifyApiEndpoint {
  SpotifyApiAudioBooks({required super.api});

  /// Method: GET
  /// Endpoint: /v1/audiobooks/{id}/chapters
  /// Description: Get an Audiobook's Chapters
  Future<Success<List<Chapter>>> getAudiobooksChapters({
    required String id,
    int? limit,
    int? offset,
    String? market,
  }) async {
    const fail = Success<List<Chapter>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'audiobooks/$id/chapters',
        queryParameters: {
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final chapters = json['items'] != null
            ? List<Chapter>.from(
                (json['items'] as List)
                    .map((x) => Chapter.fromJson(x as Map<String, dynamic>)),
              )
            : <Chapter>[];

        return Success(data: chapters);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/audiobooks/{id}
  /// Description: Get an Audiobook
  Future<Success<Audiobook>> getAudiobook({
    required String id,
    String? market,
  }) async {
    const fail = Success<Audiobook>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'audiobooks/$id',
        queryParameters: {if (market != null) 'market': market},
      );
      if (json == null) return fail;
      try {
        final audiobook = Audiobook.fromJson(json);
        return Success(data: audiobook);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }

  /// Method: GET
  /// Endpoint: /v1/audiobooks
  /// Description: Get Several Audiobooks
  Future<Success<List<Audiobook>>> getSeveralAudiobooks({
    required List<String> ids,
    String? market,
  }) async {
    const fail = Success<List<Audiobook>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: 'audiobooks',
        queryParameters: {
          'ids': ids.join(','),
          if (market != null) 'market': market,
        },
      );
      if (json == null) return fail;
      try {
        final audiobooks = json['audiobooks'] != null
            ? List<Audiobook>.from(
                (json['audiobooks'] as List)
                    .map((x) => Audiobook.fromJson(x as Map<String, dynamic>)),
              )
            : <Audiobook>[];

        return Success(data: audiobooks);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }
}
