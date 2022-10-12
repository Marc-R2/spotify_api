part of 'spotify_api_endpoint.dart';

class SpotifyApiArtists extends SpotifyApiEndpoint {
  SpotifyApiArtists({required super.api});

  Future<String?> getArtist(String id) async {
    // return await _api.getRequest(endpoint: 'artists/$id');
  }
}
