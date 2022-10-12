part of 'spotify_api_endpoint.dart';

class SpotifyApiPlaylists extends SpotifyApiEndpoint {
  SpotifyApiPlaylists({required super.api});

  Future<String?> getPlaylist(String id) async {
    // return await _api.getRequest(endpoint: 'playlists/$id');
  }
}
