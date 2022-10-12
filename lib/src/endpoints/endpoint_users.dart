part of 'spotify_api_endpoint.dart';

class SpotifyApiUsers extends SpotifyApiEndpoint {
  SpotifyApiUsers({required super.api});

  Future<String?> getUser(String id) async {
    return await _api.getRequest(endpoint: 'users/$id');
  }

  Future<String?> getUserPlaylists(String id) async {
    return await _api.getRequest(endpoint: 'users/$id/playlists');
  }

  Future<String?> getUserPlaylistsByMarket(String id, String market) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?market=$market');
  }

  Future<String?> getUserPlaylistsByLimit(String id, int limit) async {
    return await _api.getRequest(endpoint: 'users/$id/playlists?limit=$limit');
  }

  Future<String?> getUserPlaylistsByOffset(String id, int offset) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?offset=$offset');
  }

  Future<String?> getUserPlaylistsByMarketAndLimit(String id, String market,
      int limit) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?market=$market&limit=$limit');
  }

  Future<String?> getUserPlaylistsByMarketAndOffset(String id, String market,
      int offset) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?market=$market&offset=$offset');
  }

  Future<String?> getUserPlaylistsByLimitAndOffset(String id, int limit,
      int offset) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?limit=$limit&offset=$offset');
  }

  Future<String?> getUserPlaylistsByMarketLimitAndOffset(String id,
      String market, int limit, int offset) async {
    return await _api.getRequest(
        endpoint: 'users/$id/playlists?market=$market&limit=$limit&offset=$offset');
  }
}
