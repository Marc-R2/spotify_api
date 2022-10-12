part of 'spotify_api_endpoint.dart';

class SpotifyApiTracks extends SpotifyApiEndpoint {
  SpotifyApiTracks({required super.api});

  Future<String?> getTrack(String id) async {
    // return await _api.getRequest(endpoint: 'tracks/$id');
  }
}