part of 'spotify_api_endpoint.dart';

class SpotifyApiMarkets extends SpotifyApiEndpoint {
  SpotifyApiMarkets({required super.api});

  Future<String?> getMarket(String id) async {
    // return await _api.getRequest(endpoint: 'markets/$id');
  }
}
