part of 'spotify_api_endpoint.dart';

class SpotifyApiShows extends SpotifyApiEndpoint {
  SpotifyApiShows({required super.api});

  Future<String?> getShow(String id) async {
    // return await _api.getRequest(endpoint: 'shows/$id');
  }
}
