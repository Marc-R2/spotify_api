part of 'spotify_api_endpoint.dart';

class SpotifyApiPersonalization extends SpotifyApiEndpoint {
  SpotifyApiPersonalization({required super.api});

  Future<String?> getTopArtists() async {
    return await _api.getRequest(endpoint: 'me/top/artists');
  }

  Future<String?> getTopTracks() async {
    return await _api.getRequest(endpoint: 'me/top/tracks');
  }
}
