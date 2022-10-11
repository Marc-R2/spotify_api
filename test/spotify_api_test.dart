import 'package:spotify_api/spotify_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = SpotifyApiAuth();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () async {
      print(await awesome.getAuthUri());
      expect(awesome.isAwesome, isTrue);
    });

    test('Second Test', () async {
      await awesome.openAuthUri();
      await Future<void>.delayed(const Duration(seconds: 5));
      expect(awesome.isAwesome, isTrue);
      expect(awesome.code, isNotNull);
    });
  });
}
