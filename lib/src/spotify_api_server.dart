part of '../../spotify_api.dart';

class SpotifyApiServer {
  SpotifyApiServer({required SpotifyAuth auth}) : _auth = auth;

  static const _apiUrl = 'api.spotify.com';

  SpotifyAuth _auth;

  Future<void> renewAuth() async {
    _auth = await SpotifyAuth.renew(
      refreshToken: _auth.refreshToken,
      auth: _auth.auth,
    );
  }

  bool hasScopes(SpotifyApiScopes scope) => _auth.scopes.hasScopes(scope);

  Future<SpotifyAuth> _getAuth() async {
    if (_auth.isExpired) await renewAuth();
    return _auth;
  }

  Future<Map<String, dynamic>?> postRequest({
    required String endpoint,
    String version = 'v1',
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> data = const {},
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.post(
      uri,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
      body: jsonEncode(data),
    );
    print('${response.statusCode} => ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
    } else if (response.statusCode == 204) {
      print('204 => No Content');
      return {};
    }
    return null;
  }

  Future<Map<String, dynamic>?> getRequest({
    required String endpoint,
    String version = 'v1',
    Map<String, String> queryParameters = const {},
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
    }
    return null;
  }

  Future<Map<String, dynamic>?> putRequest({
    required String endpoint,
    String version = 'v1',
    Map<String, String> queryParameters = const {},
    Object? data,
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.put(
      uri,
      body: data,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
    } else if (response.statusCode == 204) {
      return {};
    }
    return null;
  }

  Future<Map<String, dynamic>?> deleteRequest({
    required String endpoint,
    String version = 'v1',
    Map<String, String> queryParameters = const {},
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.delete(
      uri,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
    } else if (response.statusCode == 204) {
      return {};
    }

    return null;
  }
}
