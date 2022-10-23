import 'package:spotify_api/spotify_api.dart';

void main() async {
  // Create a new Auth instance
  // Replace the values with your own
  final spotifyAuth = SpotifyApiAuth(
    clientId: 'Your Client ID',
    clientSecret: 'Your Client Secret',
    redirectUri: 'Your Redirect URI',
  );

  // Open the authorization page in the browser
  // and ask for access to certain scopes of the Api.
  // In this case, for simplicity's sake, all of them.
  await spotifyAuth.openAuthUri(SpotifyApiScopes.all);

  // Wait for the user to authorize the application
  final auth = await spotifyAuth.getAccessToken();

  // Create a new Api instance
  final api = SpotifyApi(auth: auth!);

  // Skip current song
  // This will only work if the user currently has a song playing
  await api.player.skipToNextTrack();
}
