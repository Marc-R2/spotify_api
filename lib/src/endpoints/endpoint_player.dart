part of 'spotify_api_endpoint.dart';

class SpotifyApiPlayer extends SpotifyApiEndpoint {
  SpotifyApiPlayer({required super.api});

  Future<String?> getDevices() async {
    // return await _api.getRequest(endpoint: 'player/devices');
  }

  Future<String?> getRecentlyPlayed() async {
    // return await _api.getRequest(endpoint: 'player/recently-played');
  }

  Future<String?> getCurrentlyPlaying() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing');
  }

  Future<String?> getCurrentlyPlayingTrack() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/track');
  }

  Future<String?> getCurrentlyPlayingContext() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/context');
  }

  Future<String?> getCurrentlyPlayingProgress() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/progress');
  }

  Future<String?> getCurrentlyPlayingItem() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/item');
  }

  Future<String?> getCurrentlyPlayingActions() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/actions');
  }

  Future<String?> getCurrentlyPlayingAvailableActions() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/available-actions');
  }

  Future<String?> getCurrentlyPlayingRestrictions() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/restrictions');
  }

  Future<String?> getCurrentlyPlayingVolume() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/volume');
  }

  Future<String?> getCurrentlyPlayingShuffle() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/shuffle');
  }

  Future<String?> getCurrentlyPlayingRepeat() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/repeat');
  }

  Future<String?> getCurrentlyPlayingTimestamps() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/timestamps');
  }

  Future<String?> getCurrentlyPlayingContextRestrictions() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/context-restrictions');
  }

  Future<String?> getCurrentlyPlayingDisallows() async {
    // return await _api.getRequest(endpoint: 'player/currently-playing/disallows');
  }
}
