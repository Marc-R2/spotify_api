part of 'spotify_api_endpoint.dart';

class SpotifyApiShows extends SpotifyApiEndpoint {
  SpotifyApiShows({required super.api});

  Future<String?> getShow(String id) async {
    return await _api.getRequest(endpoint: 'shows/$id');
  }

  Future<String?> getShowEpisodes(String id) async {
    return await _api.getRequest(endpoint: 'shows/$id/episodes');
  }

  Future<String?> getShowEpisodesFull(String id) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?market=from_token');
  }

  Future<String?> getShowEpisodesFullLimit(String id, int limit) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?market=from_token&limit=$limit');
  }

  Future<String?> getShowEpisodesFullLimitOffset(String id, int limit,
      int offset) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?market=from_token&limit=$limit&offset=$offset');
  }

  Future<String?> getShowEpisodesFullOffset(String id, int offset) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?market=from_token&offset=$offset');
  }

  Future<String?> getShowEpisodesLimit(String id, int limit) async {
    return await _api.getRequest(endpoint: 'shows/$id/episodes?limit=$limit');
  }

  Future<String?> getShowEpisodesLimitOffset(String id, int limit,
      int offset) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?limit=$limit&offset=$offset');
  }

  Future<String?> getShowEpisodesOffset(String id, int offset) async {
    return await _api.getRequest(endpoint: 'shows/$id/episodes?offset=$offset');
  }

  Future<String?> getShowFull(String id) async {
    return await _api.getRequest(endpoint: 'shows/$id?market=from_token');
  }

  Future<String?> getShowFullLimit(String id, int limit) async {
    return await _api.getRequest(
        endpoint: 'shows/$id/episodes?market=from_token&limit=$limit');
  }
}
