part of 'spotify_api_endpoint.dart';

class SpotifyApiPlaylists extends SpotifyApiEndpoint {
  SpotifyApiPlaylists({required super.api});

  Future<String?> getPlaylist(String id) async {
    return await _api.getRequest(endpoint: 'playlists/$id');
  }

  Future<String?> getPlaylistTracks(String id) async {
    return await _api.getRequest(endpoint: 'playlists/$id/tracks');
  }

  Future<String?> getPlaylistCoverImage(String id) async {
    return await _api.getRequest(endpoint: 'playlists/$id/images');
  }

  Future<String?> getPlaylistCoverImageBySize(String id, String size) async {
    return await _api.getRequest(endpoint: 'playlists/$id/images/$size');
  }

  Future<String?> getPlaylistCoverImageBySizeAndFormat(String id, String size,
      String format) async {
    return await _api.getRequest(
        endpoint: 'playlists/$id/images/$size.$format');
  }

  Future<String?> getPlaylistCoverImageBySizeAndFormatAndQuality(String id,
      String size, String format, String quality) async {
    return await _api.getRequest(
        endpoint: 'playlists/$id/images/$size.$format?$quality');
  }

  Future<String?> getPlaylistCoverImageBySizeAndFormatAndQualityAndType(
      String id, String size, String format, String quality,
      String type) async {
    return await _api.getRequest(
        endpoint: 'playlists/$id/images/$size.$format?$quality&type=$type');
  }

  Future<
      String?> getPlaylistCoverImageBySizeAndFormatAndQualityAndTypeAndDither(
      String id,
      String size,
      String format,
      String quality,
      String type,
      String dither) async {
    return await _api.getRequest(
        endpoint: 'playlists/$id/images/$size.$format?$quality&type=$type&dither=$dither');
  }

  Future<
      String?> getPlaylistCoverImageBySizeAndFormatAndQualityAndTypeAndDitherAndPalette(
      String id,
      String size,
      String format,
      String quality,
      String type,
      String dither,
      String palette) async {
    return await _api.getRequest(
        endpoint: 'playlists/$id/images/$size.$format?$quality&type=$type&dither=$dither&palette=$palette');
  }
}
