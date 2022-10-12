part of 'spotify_api_endpoint.dart';

class SpotifyApiLibrary extends SpotifyApiEndpoint {
  SpotifyApiLibrary({required super.api});

  Future<String?> getSavedAlbums() async {
    // return await _api.getRequest(endpoint: 'me/albums');
  }
}
