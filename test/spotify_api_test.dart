import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/spotify_api_scopes.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final spotifyAuth = SpotifyApiAuth(
      clientId: 'Your Client ID',
      clientSecret: 'Your Client Secret',
      redirectUri: 'Your Redirect URI',
    );

    test('First Test', () async {
      print(await spotifyAuth.getAuthUri(SpotifyApiScopes.all));
      expect(spotifyAuth.isAwesome, isTrue);
    });

    test('Second Test', () async {
      // await spotifyAuth.openAuthUri(SpotifyApiScopes.all);
      await spotifyAuth.getAuthUri(SpotifyApiScopes.all);
      await Future<void>.delayed(const Duration(seconds: 10));
      expect(spotifyAuth.isAwesome, isTrue);
      expect(spotifyAuth.code, isNotNull);
    });

    group('Endpoint Test', ()  {
      late SpotifyApi api;
      setUpAll(() async {
        final auth = await spotifyAuth.getAccessToken();
        api = SpotifyApi(auth: auth!);
      });

      test('renew', () async {
        await api.renewAuth();
      });

      test('getUsersQueue', () async {
        final me = await api.player.getUsersQueue();
        expect(me.success, isTrue);
        print(me);
      });

      test('getRecentlyPlayedTracks', () async {
        final me = await api.player.getRecentlyPlayedTracks(limit: 10);
        expect(me.success, isTrue);
        print(me);
        final history = me.data!;
        expect(history.isNotEmpty, isTrue);
        expect(history.length, 10);
      });

      test('getPlaybackState', () async {
        final me = await api.player.getPlaybackState();
        expect(me.success, isTrue);
        print(me);
        final playback = me.data!;
        expect(playback.isPlaying, isTrue);
      });

      test('getAvailableDevices', () async {
        final me = await api.player.getAvailableDevices();
        expect(me.success, isTrue);
        print(me);
        final devices = me.data!;
        expect(devices.isNotEmpty, isTrue);
      });

      test('getCurrentlyPlaying', () async {
        final me = await api.player.getCurrentlyPlaying();
        expect(me.success, isTrue);
        print(me);
        final playback = me.data!;
        expect(playback.isPlaying, isTrue);
      });

      test('skipToNext', () async {
        final me = await api.player.skipToNextTrack();
        expect(me.success, isTrue);
        print(me);
      });

      test('skipToPrevious', () async {
        final me = await api.player.skipToPreviousTrack();
        expect(me.success, isTrue);
        print(me);
      });
    });
  });
}
