part of 'spotify_api_endpoint.dart';

class SpotifyApiLibrary extends SpotifyApiEndpoint {
  SpotifyApiLibrary({required super.api});

  Future<String?> getSavedAlbums() async {
    return await _api.getRequest(endpoint: 'me/albums');
  }

  Future<String?> getSavedTracks() async {
    return await _api.getRequest(endpoint: 'me/tracks');
  }

  Future<String?> getSavedShows() async {
    return await _api.getRequest(endpoint: 'me/shows');
  }

  Future<String?> getSavedEpisodes() async {
    return await _api.getRequest(endpoint: 'me/episodes');
  }

  Future<String?> checkSavedAlbums(List<String> ids) async {
    return await _api.getRequest(
        endpoint: 'me/albums/contains',
        queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> checkSavedTracks(List<String> ids) async {
    return await _api.getRequest(
        endpoint: 'me/tracks/contains',
        queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> checkSavedShows(List<String> ids) async {
    return await _api.getRequest(
        endpoint: 'me/shows/contains', queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> checkSavedEpisodes(List<String> ids) async {
    return await _api.getRequest(
        endpoint: 'me/episodes/contains',
        queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> saveAlbums(List<String> ids) async {
    return await _api.putRequest(
        endpoint: 'me/albums', queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> saveTracks(List<String> ids) async {
    return await _api.putRequest(
        endpoint: 'me/tracks', queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> saveShows(List<String> ids) async {
    return await _api.putRequest(
        endpoint: 'me/shows', queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> saveEpisodes(List<String> ids) async {
    return await _api.putRequest(
        endpoint: 'me/episodes', queryParameters: {'ids': ids.join(',')});
  }

  Future<String?> removeAlbums(List<String> ids) async {
    return await _api.deleteRequest(
        endpoint: 'me/albums', queryParameters: {'ids': ids.join(',')});
  }
}
