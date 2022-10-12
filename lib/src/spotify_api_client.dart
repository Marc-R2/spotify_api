part of '../../spotify_api.dart';

class SpotifyApi {
  SpotifyApi({required SpotifyAuth auth}) : _api = SpotifyApiServer(auth: auth);

  /// Manually trigger a refresh of the access token.
  ///
  /// The access token is automatically refreshed when it expires,
  /// but there can be cases where you want to manually refresh it.
  Future<void> renewAuth() => _api.renewAuth();

  SpotifyAuth get auth => _api._auth;

  final SpotifyApiServer _api;

  /// The [SpotifyApiAlbums] Endpoint.
  late final albums = SpotifyApiAlbums(api: _api);

  /// The [SpotifyApiArtists] Endpoint.
  late final artists = SpotifyApiArtists(api: _api);

  /// The [SpotifyApiAudioBooks] Endpoint.
  late final audiobooks = SpotifyApiAudioBooks(api: _api);

  /// The [SpotifyApiChapters] Endpoint.
  late final chapters = SpotifyApiChapters(api: _api);

  /// The [SpotifyApiEpisodes] Endpoint.
  late final episodes = SpotifyApiEpisodes(api: _api);

  /// The [SpotifyApiFollow] Endpoint.
  late final follow = SpotifyApiFollow(api: _api);

  /// The [SpotifyApiLibrary] Endpoint.
  late final library = SpotifyApiLibrary(api: _api);

  /// The [SpotifyApiMarkets] Endpoint.
  late final markets = SpotifyApiMarkets(api: _api);

  /// The [SpotifyApiPersonalization] Endpoint.
  late final personalization = SpotifyApiPersonalization(api: _api);

  /// The [SpotifyApiPlayer] Endpoint.
  late final player = SpotifyApiPlayer(api: _api);

  /// The [SpotifyApiPlaylists] Endpoint.
  late final playlists = SpotifyApiPlaylists(api: _api);

  /// The [SpotifyApiSearch] Endpoint.
  late final search = SpotifyApiSearch(api: _api);

  /// The [SpotifyApiShows] Endpoint.
  late final shows = SpotifyApiShows(api: _api);

  /// The [SpotifyApiTracks] Endpoint.
  late final tracks = SpotifyApiTracks(api: _api);

  /// The [SpotifyApiUsers] Endpoint.
  late final users = SpotifyApiUsers(api: _api);
}
