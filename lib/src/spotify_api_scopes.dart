/// Select for all available scopes
class SpotifyApiScopes {
  /// Select your wanted scopes
  const SpotifyApiScopes({
    this.ugcImageUpload = false,
    this.userReadPlaybackState = false,
    this.userModifyPlaybackState = false,
    this.userReadCurrentlyPlaying = false,
    this.appRemoteControl = false,
    this.streaming = false,
    this.playlistModifyPublic = false,
    this.playlistModifyPrivate = false,
    this.playlistReadCollaborative = false,
    this.playlistReadPrivate = false,
    this.userFollowModify = false,
    this.userFollowRead = false,
    this.userLibraryModify = false,
    this.userLibraryRead = false,
    this.userReadEmail = false,
    this.userReadPrivate = false,
    this.userTopRead = false,
    this.userReadPlaybackPosition = false,
    this.userReadRecentlyPlayed = false,
  });

  static SpotifyApiScopes fromString(String scopes) {
    return SpotifyApiScopes(
      ugcImageUpload: scopes.contains('ugc-image-upload'),
      userReadPlaybackState: scopes.contains('user-read-playback-state'),
      userModifyPlaybackState: scopes.contains('user-modify-playback-state'),
      userReadCurrentlyPlaying: scopes.contains('user-read-currently-playing'),
      appRemoteControl: scopes.contains('app-remote-control'),
      streaming: scopes.contains('streaming'),
      playlistModifyPublic: scopes.contains('playlist-modify-public'),
      playlistModifyPrivate: scopes.contains('playlist-modify-private'),
      playlistReadCollaborative: scopes.contains('playlist-read-collaborative'),
      playlistReadPrivate: scopes.contains('playlist-read-private'),
      userFollowModify: scopes.contains('user-follow-modify'),
      userFollowRead: scopes.contains('user-follow-read'),
      userLibraryModify: scopes.contains('user-library-modify'),
      userLibraryRead: scopes.contains('user-library-read'),
      userReadEmail: scopes.contains('user-read-email'),
      userReadPrivate: scopes.contains('user-read-private'),
      userTopRead: scopes.contains('user-top-read'),
      userReadPlaybackPosition: scopes.contains('user-read-playback-position'),
      userReadRecentlyPlayed: scopes.contains('user-read-recently-played'),
    );
  }

  static const SpotifyApiScopes all = SpotifyApiScopes(
    ugcImageUpload: true,
    userReadPlaybackState: true,
    userModifyPlaybackState: true,
    userReadCurrentlyPlaying: true,
    appRemoteControl: true,
    streaming: true,
    playlistModifyPublic: true,
    playlistModifyPrivate: true,
    playlistReadCollaborative: true,
    playlistReadPrivate: true,
    userFollowModify: true,
    userFollowRead: true,
    userLibraryModify: true,
    userLibraryRead: true,
    userReadEmail: true,
    userReadPrivate: true,
    userTopRead: true,
    userReadPlaybackPosition: true,
    userReadRecentlyPlayed: true,
  );

  // Images
  /// ugc-image-upload
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#ugc-image-upload
  ///
  /// Description: Write access to user-provided images.
  ///
  /// Visible to users: Upload images to Spotify on your behalf.
  final bool ugcImageUpload;

  // Spotify Connect
  /// user-read-playback-state
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-playback-state
  ///
  /// Description: Read access to a user’s player state.
  ///
  /// Visible to users: Read your currently playing content
  /// and Spotify Connect devices information.
  final bool userReadPlaybackState;

  /// user-modify-playback-state
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-modify-playback-state
  ///
  /// Description: Write access to a user’s playback state
  ///
  /// Visible to users: Control playback on your Spotify clients
  /// and Spotify Connect devices.
  final bool userModifyPlaybackState;

  /// user-read-currently-playing
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-currently-playing
  ///
  /// Description: Read access to a user’s currently playing content.
  ///
  /// Visible to users: Read your currently playing content.
  final bool userReadCurrentlyPlaying;

  // Playback
  /// app-remote-control
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#app-remote-control
  ///
  /// Description: Remote control playback of Spotify.
  /// This scope is currently available to Spotify iOS and Android SDKs.
  ///
  /// Visible to users: Communicate with the Spotify app on your device.
  final bool appRemoteControl;

  /// streaming
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#streaming
  ///
  /// Description: Control playback of a Spotify track.
  /// This scope is currently available to the Web Playback SDK.
  /// The user must have a Spotify Premium account.
  final bool streaming;

  // Playlists
  /// playlist-read-private
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#playlist-read-private
  ///
  /// Description: Read access to user's private playlists.
  ///
  /// Visible to users: Access your private playlists.
  final bool playlistReadPrivate;

  /// playlist-read-collaborative
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#playlist-read-collaborative
  ///
  /// Description: Include collaborative playlists
  /// when requesting a user's playlists.
  ///
  /// Visible to users: Access your collaborative playlists.
  final bool playlistReadCollaborative;

  /// playlist-modify-private
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#playlist-modify-private
  ///
  /// Description: Write access to a user's private playlists.
  ///
  /// Visible to users: Manage your private playlists.
  final bool playlistModifyPrivate;

  /// playlist-modify-public
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#playlist-modify-public
  ///
  /// Description: Write access to a user's public playlists.
  ///
  /// Visible to users: Manage your public playlists.
  final bool playlistModifyPublic;

  // Follow
  /// user-follow-modify
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-follow-modify
  ///
  /// Description: Write/delete access to the list of artists
  /// and other users that the user follows.
  ///
  /// Visible to users: Manage who you are following.
  final bool userFollowModify;

  /// user-follow-read
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-follow-read
  ///
  /// Description: Read access to the list of artists
  /// and other users that the user follows.
  ///
  /// Visible to users: Access your followers and who you are following.
  final bool userFollowRead;

  // Listening History
  /// user-read-playback-position
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-playback-position
  ///
  /// Description: Read access to a user’s playback position in a content.
  ///
  /// Visible to users: Read your position in content you have played.
  final bool userReadPlaybackPosition;

  /// user-top-read
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-top-read
  ///
  /// Description: Read access to a user's top artists and tracks.
  ///
  /// Visible to users: Read your top artists and content.
  final bool userTopRead;

  /// user-read-recently-played
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-recently-played
  ///
  /// Description: Read access to a user’s recently played tracks.
  ///
  /// Visible to users: Access your recently played items.
  final bool userReadRecentlyPlayed;

  // Library
  /// user-library-modify
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-library-modify
  ///
  /// Description: Write/delete access to a user's "Your Music" library.
  ///
  /// Visible to users: Manage your saved content.
  final bool userLibraryModify;

  /// user-library-read
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-library-read
  ///
  /// Description: Read access to a user's library.
  ///
  /// Visible to users: Access your saved content.
  final bool userLibraryRead;

  // Users
  /// user-read-email
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-email
  ///
  /// Description: Read access to user’s email address.
  ///
  /// Visible to users: Get your real email address.
  final bool userReadEmail;

  /// user-read-private
  ///
  /// https://developer.spotify.com/documentation/general/guides/authorization/scopes/#user-read-private
  ///
  /// Description: Read access to user’s subscription details
  /// (type of user account).
  ///
  /// Visible to users: Access your subscription details.
  final bool userReadPrivate;

  @override
  String toString() {
    final scopes = <String>[];

    if (ugcImageUpload) scopes.add('ugc-image-upload');
    if (userReadPlaybackState) scopes.add('user-read-playback-state');
    if (userModifyPlaybackState) scopes.add('user-modify-playback-state');
    if (userReadCurrentlyPlaying) scopes.add('user-read-currently-playing');
    if (appRemoteControl) scopes.add('app-remote-control');
    if (streaming) scopes.add('streaming');
    if (playlistModifyPublic) scopes.add('playlist-modify-public');
    if (playlistModifyPrivate) scopes.add('playlist-modify-private');
    if (playlistReadCollaborative) scopes.add('playlist-read-collaborative');
    if (playlistReadPrivate) scopes.add('playlist-read-private');
    if (userFollowModify) scopes.add('user-follow-modify');
    if (userFollowRead) scopes.add('user-follow-read');
    if (userLibraryModify) scopes.add('user-library-modify');
    if (userLibraryRead) scopes.add('user-library-read');
    if (userReadEmail) scopes.add('user-read-email');
    if (userReadPrivate) scopes.add('user-read-private');
    if (userTopRead) scopes.add('user-top-read');
    if (userReadPlaybackPosition) scopes.add('user-read-playback-position');
    if (userReadRecentlyPlayed) scopes.add('user-read-recently-played');

    return scopes.join(' ');
  }

  /// Checks if all given scopes are included in this scope set.
  bool hasScopes(SpotifyApiScopes s) {
    if (s.ugcImageUpload && !ugcImageUpload) return false;
    if (s.userReadPlaybackState && !userReadPlaybackState) return false;
    if (s.userModifyPlaybackState && !userModifyPlaybackState) return false;
    if (s.userReadCurrentlyPlaying && !userReadCurrentlyPlaying) return false;
    if (s.appRemoteControl && !appRemoteControl) return false;
    if (s.streaming && !streaming) return false;
    if (s.playlistModifyPublic && !playlistModifyPublic) return false;
    if (s.playlistModifyPrivate && !playlistModifyPrivate) return false;
    if (s.playlistReadCollaborative && !playlistReadCollaborative) return false;
    if (s.playlistReadPrivate && !playlistReadPrivate) return false;
    if (s.userFollowModify && !userFollowModify) return false;
    if (s.userFollowRead && !userFollowRead) return false;
    if (s.userLibraryModify && !userLibraryModify) return false;
    if (s.userLibraryRead && !userLibraryRead) return false;
    if (s.userReadEmail && !userReadEmail) return false;
    if (s.userReadPrivate && !userReadPrivate) return false;
    if (s.userTopRead && !userTopRead) return false;
    if (s.userReadPlaybackPosition && !userReadPlaybackPosition) return false;
    if (s.userReadRecentlyPlayed && !userReadRecentlyPlayed) return false;
    return true;
  }
}
