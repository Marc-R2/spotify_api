part of 'spotify_api_endpoint.dart';

class SpotifyApiAudioBooks extends SpotifyApiEndpoint {
  SpotifyApiAudioBooks({required super.api});

  Future<String?> getAudioBook(String id) async {
    // return await _api.getRequest(endpoint: 'audiobooks/$id');
  }
}
