/// Support for doing something awesome.
///
/// More dartdocs go here.
library spotify_api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:open_url/open_url.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:spotify_api/src/endpoints/spotify_api_endpoint.dart';
import 'package:spotify_api/src/spotify_api_scopes.dart';

part 'src/spotify_api_auth.dart';
part 'src/spotify_api_client.dart';
part 'src/spotify_api_server.dart';

part 'src/objects/track.dart';
part 'src/objects/history_track.dart';
part 'src/objects/playback_state.dart';
part 'src/objects/current_playing.dart';
part 'src/objects/album.dart';
part 'src/objects/artist.dart';
part 'src/objects/device.dart';
part 'src/objects/markets.dart';
part 'src/objects/external_ids.dart';
part 'src/objects/external_urls.dart';
part 'src/objects/image.dart';
part 'src/objects/user_queue.dart';
part 'src/objects/audiobook.dart';
part 'src/objects/chapter.dart';
part 'src/objects/category.dart';
part 'src/objects/playlist.dart';
part 'src/objects/playlist_track.dart';
part 'src/objects/user.dart';
