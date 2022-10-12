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
      await Future<void>.delayed(const Duration(seconds: 5));
      expect(awesome.isAwesome, isTrue);
      expect(awesome.code, isNotNull);
    });

    test('Third Test', () async {
      expect(awesome.code, isNotNull);
      final auth = await awesome.getAccessToken();
      expect(awesome.isAwesome, isTrue);

      final api = SpotifyApi(auth: auth!);
      await api.renewAuth();
    });
  });
}
