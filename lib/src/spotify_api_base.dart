import 'dart:async';
import 'dart:io';

import 'package:open_url/open_url.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

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

    await shelf_io.serve(handler, 'localhost', 8080);
  }

  Future<void> _stopServer() async {
    if (_server == null) return;
    await _server!.close(force: true);
    _server = null;
  }

  /// Prompt the user to authorize this application.
  Future<Uri> getAuthUri() async {
    await _startServer();
    // Link to the authorization page.
    // https://developer.spotify.com/documentation/general/guides/authorization-guide/#authorization-code-flow
    // https://developer.spotify.com/documentation/general/guides/scopes/
    final uri = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': clientId,
      'response_type': 'code',
      'redirect_uri': redirectUri,
      'scope': 'user-read-private user-read-email',
    });

    if (_serverFuture != null) _serverFuture!.cancel();
    _serverFuture = Timer(const Duration(seconds: 30), _stopServer);

    return uri;
  }

  Future<ProcessResult> openAuthUri() async {
    final uri = await getAuthUri();
    return openUrl(uri.toString());
  }
}
