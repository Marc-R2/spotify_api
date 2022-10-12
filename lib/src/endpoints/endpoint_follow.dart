part of 'spotify_api_endpoint.dart';

class SpotifyApiFollow extends SpotifyApiEndpoint {
  SpotifyApiFollow({required super.api});

  Future<String?> getFollowing(String type, String id) async {
    // return await _api.getRequest(endpoint: 'following/$type/$id');
  }

  Future<String?> getFollowers(String type, String id) async {
    // return await _api.getRequest(endpoint: 'followers/$type/$id');
  }

  Future<String?> getFollowedArtists() async {
    // return await _api.getRequest(endpoint: 'me/following?type=artist');
  }

  Future<String?> getFollowedUsers() async {
    // return await _api.getRequest(endpoint: 'me/following?type=user');
  }

  Future<String?> getFollowedShows() async {
    // return await _api.getRequest(endpoint: 'me/following?type=show');
  }

  Future<String?> getFollowedPlaylists() async {
    // return await _api.getRequest(endpoint: 'me/following?type=playlist');
  }

  Future<String?> getFollowedEpisodes() async {
    // return await _api.getRequest(endpoint: 'me/following?type=episode');
  }

  Future<String?> getFollowedAlbums() async {
    // return await _api.getRequest(endpoint: 'me/following?type=album');
  }

  Future<String?> getFollowedTracks() async {
    // return await _api.getRequest(endpoint: 'me/following?type=track');
  }

  Future<String?> getFollowedCategories() async {
    // return await _api.getRequest(endpoint: 'me/following?type=category');
  }

  Future<String?> getFollowedShowsByUser(String id) async {
    // return await _api.getRequest(endpoint: 'users/$id/following?type=show');
  }

  Future<String?> getFollowedPlaylistsByUser(String id) async {
    // return await _api.getRequest(endpoint: 'users/$id/following?type=playlist');
  }

  Future<String?> getFollowedEpisodesByUser(String id) async {
    // return await _api.getRequest(endpoint: 'users/$id/following?type=episode');
  }

  Future<String?> getFollowedAlbumsByUser(String id) async {
    // return await _api.getRequest(endpoint: 'users/$id/following?type=album');
  }

  Future<String?> getFollowedTracksByUser(String id) async {
    // return
  }
}
