import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/spotify_api_scopes.dart';

class SpotifyApiServer {
  SpotifyApiServer({required SpotifyAuth auth}) : _auth = auth;

  static const _apiUrl = 'api.spotify.com';

  SpotifyAuth _auth;

  Future<void> renewAuth() async {
    _auth = await _auth.renew();
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
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.post(
      uri,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
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
  }) async {
    final auth = await _getAuth();
    final uri = Uri.https(_apiUrl, '/$version/$endpoint', queryParameters);
    final response = await http.put(
      uri,
      body: queryParameters,
      headers: {'Authorization': 'Bearer ${auth.accessToken}'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>?;
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
    }
    return null;
  }
}