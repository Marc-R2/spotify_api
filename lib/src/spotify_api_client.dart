import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/endpoints/spotify_api_endpoint.dart';
import 'package:spotify_api/src/spotify_api_server.dart';

class SpotifyApi {
  SpotifyApi({required SpotifyAuth auth}) : _api = SpotifyApiServer(auth: auth);

  Future<void> renewAuth() => _api.renewAuth();

  final SpotifyApiServer _api;
}
