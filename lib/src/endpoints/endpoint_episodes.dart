part of 'spotify_api_endpoint.dart';

class SpotifyApiEpisodes extends SpotifyApiEndpoint {
  SpotifyApiEpisodes({required super.api});

  Future<String?> getEpisode(String id) async {
    // return await _api.getRequest(endpoint: 'episodes/$id');
  }
}
