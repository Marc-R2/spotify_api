part of 'spotify_api_endpoint.dart';

class SpotifyApiMarkets extends SpotifyApiEndpoint {
  SpotifyApiMarkets({required super.api});

  /// Method: GET
  /// Endpoint: /v1/markets
  /// Description: Get a List of Markets
  Future<Success<List<String>>> getMarkets() async {
    const fail = Success<List<String>>(success: false);
    if (_api.hasScopes(const SpotifyApiScopes())) {
      final json = await _api.getRequest(
        endpoint: '/v1/markets',
      );
      if (json == null) return fail;
      try {
        final markets = json['items'] != null
            ? List<String>.from(
                (json['items'] as List).map((x) => x.toString()),
              )
            : <String>[];

        return Success(data: markets);
      } catch (e, trace) {
        print('$e => $trace');
      }
    }
    return fail;
  }
}
