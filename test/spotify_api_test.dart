import 'package:spotify_api/spotify_api.dart';
import 'package:spotify_api/src/spotify_api_client.dart';
import 'package:spotify_api/src/spotify_api_scopes.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = SpotifyApiAuth();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () async {
      print(await awesome.getAuthUri(SpotifyApiScopes.all));
      expect(awesome.isAwesome, isTrue);
    });

    test('Second Test', () async {
      await awesome.openAuthUri(SpotifyApiScopes.all);
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(awesome.isAwesome, isTrue);
      expect(awesome.code, isNotNull);
    });

    group('Endpoint Test', ()  {
      late SpotifyApi api;
      setUpAll(() async {
        final auth = await awesome.getAccessToken();
        api = SpotifyApi(auth: auth!);
      });

      test('renew', () async {;
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

      test('getCurrentlyPlaying', () async {
        final me = await api.player.getPlaybackState();
        expect(me.success, isTrue);
        print(me);
        final playback = me.data!;
        expect(playback.isPlaying, isTrue);
      });
    });
  });
}
