part of 'spotify_api_endpoint.dart';

class SpotifyApiTracks extends SpotifyApiEndpoint {
  SpotifyApiTracks({required super.api});

  Future<String?> getTrack(String id) async {
    return await _api.getRequest(endpoint: 'tracks/$id');
  }

  Future<String?> getTrackAudioAnalysis(String id) async {
    return await _api.getRequest(endpoint: 'tracks/$id/audio-analysis');
  }

  Future<String?> getTrackAudioFeatures(String id) async {
    return await _api.getRequest(endpoint: 'tracks/$id/audio-features');
  }

  Future<String?> getTrackAudioFeaturesSeveral(String ids) async {
    return await _api.getRequest(endpoint: 'audio-features?ids=$ids');
  }

  Future<String?> getTrackAudioFeaturesSeveralByMarket(String ids,
      String market) async {
    return await _api.getRequest(
        endpoint: 'audio-features?ids=$ids&market=$market');
  }
}