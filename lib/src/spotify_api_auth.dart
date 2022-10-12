import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:open_url/open_url.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:spotify_api/src/spotify_api_scopes.dart';

///
class SpotifyApiAuth {
  bool get isAwesome => true;

  HttpServer? _server;

  Timer? _serverFuture;

  String? code;

  static const clientId = 'YOUR_CLIENT_ID';
  static const redirectUri = 'http://localhost:8080/callback';

  Future<void> _startServer() async {
    if (_server != null) return;
    final handler =
        const Pipeline().addMiddleware(logRequests()).addHandler((request) {
      if (request.requestedUri.path == '/callback') {
        code = request.url.queryParameters['code'];

        Timer(const Duration(milliseconds: 128), () {
          _server?.close();
          _server = null;
        });

        return Response.ok('Success!');
      }
      return Response.notFound('Not found');
    });

    _server = await shelf_io.serve(handler, 'localhost', 8080);
  }

  Future<void> _stopServer() async {
    if (_server == null) return;
    await _server!.close(force: true);
    _server = null;
  }

  /// Prompt the user to authorize this application.
  Future<Uri> getAuthUri(SpotifyApiScopes scopes) async {
    await _startServer();
    // Link to the authorization page.
    // https://developer.spotify.com/documentation/general/guides/authorization-guide/#authorization-code-flow
    // https://developer.spotify.com/documentation/general/guides/scopes/
    final uri = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': clientId,
      'response_type': 'code',
      'redirect_uri': redirectUri,
      'scope': scopes.toString(),
    });

    if (_serverFuture != null) _serverFuture!.cancel();
    _serverFuture = Timer(const Duration(seconds: 30), _stopServer);

    return uri;
  }

  Future<ProcessResult> openAuthUri(SpotifyApiScopes scopes) async {
    final uri = await getAuthUri(scopes);
    return openUrl(uri.toString());
  }

  Future<SpotifyAuth?> getAccessToken() async {
    try {
      final uri = Uri.https('accounts.spotify.com', '/api/token');

      if (code == null) throw Exception('No code');
      final response = await http.post(uri, body: {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
        'client_secret': clientSecret,
      });
      print(response.body);

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return SpotifyAuth(
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
        scopes: SpotifyApiScopes.fromString(json['scope'] as String),
        expire: DateTime.now().add(const Duration(seconds: 3600)),
      );
    } catch (e) {
      print(e);
    }
    return null;
  }
}

class SpotifyAuth {
  const SpotifyAuth({
    required this.accessToken,
    required this.refreshToken,
    required this.scopes,
    required this.expire,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime expire;

  final SpotifyApiScopes scopes;

  bool get isExpired => DateTime.now().isAfter(expire);

  Future<SpotifyAuth> renew() async {
    final uri = Uri.https('accounts.spotify.com', '/api/token');

    final response = await http.post(uri, body: {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': SpotifyApiAuth.clientId,
      'client_secret': SpotifyApiAuth.clientSecret,
    });
    print(response.body);

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return SpotifyAuth(
      accessToken: json['access_token'] as String,
      refreshToken: refreshToken,
      scopes: SpotifyApiScopes.fromString(json['scope'] as String),
      expire: DateTime.now().add(const Duration(seconds: 3600)),
    );
  }
}
