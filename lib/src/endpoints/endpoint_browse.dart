part of 'spotify_api_endpoint.dart';

class SpotifyApiBrowse extends SpotifyApiEndpoint {
  SpotifyApiBrowse({required super.api});

  Future<String?> getCategories() async {
    return await _api.getRequest(endpoint: 'browse/categories');
  }

  Future<String?> getCategory(String id) async {
    return await _api.getRequest(endpoint: 'browse/categories/$id');
  }

  Future<String?> getCategoryPlaylists(String id) async {
    return await _api.getRequest(endpoint: 'browse/categories/$id/playlists');
  }

  Future<String?> getFeaturedPlaylists() async {
    return await _api.getRequest(endpoint: 'browse/featured-playlists');
  }

  Future<String?> getNewReleases() async {
    return await _api.getRequest(endpoint: 'browse/new-releases');
  }

  Future<String?> getRecommendations() async {
    return await _api.getRequest(endpoint: 'browse/recommendations');
  }
}
