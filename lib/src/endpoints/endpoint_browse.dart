part of 'spotify_api_endpoint.dart';

class SpotifyApiBrowse extends SpotifyApiEndpoint {
  SpotifyApiBrowse({required super.api});

  Future<String?> getCategories() async {
    // return await _api.getRequest(endpoint: 'browse/categories');
  }
}
