part of 'spotify_api_endpoint.dart';

class SpotifyApiChapters extends SpotifyApiEndpoint {
  SpotifyApiChapters({required super.api});

  Future<String?> getChapter(String id) async {
    // return await _api.getRequest(endpoint: 'chapters/$id');
  }
}
