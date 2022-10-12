part of 'spotify_api_endpoint.dart';

class SpotifyApiUsers extends SpotifyApiEndpoint {
  SpotifyApiUsers({required super.api});

  Future<String?> getUser(String id) async {
    // return await _api.getRequest(endpoint: 'users/$id');
  }
}
