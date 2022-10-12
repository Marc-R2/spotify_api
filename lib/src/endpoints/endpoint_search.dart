part of 'spotify_api_endpoint.dart';

class SpotifyApiSearch extends SpotifyApiEndpoint {
  SpotifyApiSearch({required super.api});

  Future<String?> getSearch(String query) async {
    // return await _api.getRequest(endpoint: 'search?q=$query');
  }
}
