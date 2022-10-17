A simple interface with the Spotify Web Api in Dart.

## Features

* Auth with the Spotify Web Api
    * Scopes
* Access to the Spotify Web Api Endpoints
    * Albums
    * Artists
    * Audiobooks (not yet implemented)
    * Browse
    * Chapters (not yet implemented)
    * Episodes (not yet implemented)
    * Follow
    * Library
    * Markets
    * Personalization
    * Player
    * Playlists
    * Search
    * Shows (not yet implemented)
    * Tracks
    * Users


## Getting started

Login to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard) and create a new app. 
You will need the Client ID and Client Secret to use this package.

Add the package to your pubspec.yaml file:
```yaml
dependencies:
  spotify_api:
    git:
      url: https://github.com/Marc-R2/spotify_api.git
```

There may be a warning regarding the publishing, as the package is currently still included via GitHub. 
However, the following can also be added to pubspec.yaml:
```yaml
publish_to: 'none'
```

Aim to publish on [pub.dev](https://pub.dev/) in the future.

## Usage

Auth with the Spotify Web Api and get an access token:
```dart
final spotifyAuth = SpotifyApiAuth(
  clientId: 'Your Client ID',
  clientSecret: 'Your Client Secret',
  redirectUri: 'Your Redirect URI',
);

await spotifyAuth.openAuthUri(SpotifyApiScopes.all);

final auth = await spotifyAuth.getAccessToken();

final api = SpotifyApi(auth: auth!);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
