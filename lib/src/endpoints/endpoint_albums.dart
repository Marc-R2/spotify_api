part of 'spotify_api_endpoint.dart';

class SpotifyApiAlbums extends SpotifyApiEndpoint {
  SpotifyApiAlbums({required super.api});

  Future<String?> getAlbum(String id) async {
    // return await _api.getRequest(endpoint: 'albums/$id');
  }
}
