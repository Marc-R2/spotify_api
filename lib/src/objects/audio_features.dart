part of '../../spotify_api.dart';

class AudioFeatures {
  AudioFeatures({
    required this.createdAt,
    required this.danceability,
    required this.energy,
    required this.key,
    required this.loudness,
    required this.mode,
    required this.speechiness,
    required this.acousticness,
    required this.instrumentalness,
    required this.liveness,
    required this.valence,
    required this.tempo,
    required this.type,
    required this.id,
    required this.uri,
    required this.trackHref,
    required this.analysisUrl,
    required this.durationMs,
    required this.timeSignature,
  });

  static AudioFeatures fromJson(Map<String, dynamic> json) => AudioFeatures(
        createdAt: DateTime.now(),
        danceability: (json['danceability'] as double?) ?? -1,
        energy: (json['energy'] as double?) ?? -1,
        key: (json['key'] as int?) ?? -1,
        loudness: (json['loudness'] as double?) ?? 1,
        mode: (json['mode'] as int?) ?? -1,
        speechiness: (json['speechiness'] as double?) ?? -1,
        acousticness: (json['acousticness'] as double?) ?? -1,
        instrumentalness: (json['instrumentalness'] as num?) ?? -1,
        liveness: (json['liveness'] as double?) ?? -1,
        valence: (json['valence'] as double?) ?? -1,
        tempo: (json['tempo'] as double?) ?? -1,
        type: json['type'] as String,
        id: json['id'] as String,
        uri: json['uri'] as String,
        trackHref: json['track_href'] as String,
        analysisUrl: json['analysis_url'] as String,
        durationMs: (json['duration_ms'] as int?) ?? -1,
        timeSignature: (json['time_signature'] as int?) ?? -1,
      );

  static final Map<String, AudioFeatures> _featureCache = {};

  static Future<Success<AudioFeatures>> fromTrack({
    required Track track,
    required SpotifyApi api,
    bool noCache = false,
  }) async {
    final id = track.id;
    if (_featureCache.containsKey(id) && !noCache) {
      _featureCache[id] =
          _featureCache[id]!.copyWith(createdAt: DateTime.now());
      return Success(data: _featureCache[id]);
    }
    final res = await api.tracks.getAudioFeaturesById(id: id);
    if (res.success) _featureCache[id] = res.data!;
    cleanCache();
    return res;
  }

  static int maxCacheSize = 128;

  static void cleanCache([int? maxSize]) {
    if (maxSize != null) maxCacheSize = maxSize;
    if (_featureCache.length < maxCacheSize) return;
    final sorted = _featureCache.entries.toList()
      ..sort((a, b) => a.value.createdAt.compareTo(b.value.createdAt));
    final toRemove = sorted.sublist(0, sorted.length - maxCacheSize);
    for (final entry in toRemove) {
      _featureCache.remove(entry.key);
    }
  }

  final DateTime createdAt;

  final double danceability;

  final double energy;

  final int key;

  final double loudness;

  final int mode;

  final double speechiness;

  final double acousticness;

  final num instrumentalness;

  final double liveness;

  final double valence;

  final double tempo;

  final String type;

  final String id;

  final String uri;

  final String trackHref;

  final String analysisUrl;

  final int durationMs;

  final int timeSignature;

  AudioFeatures copyWith({
    DateTime? createdAt,
    double? danceability,
    double? energy,
    int? key,
    double? loudness,
    int? mode,
    double? speechiness,
    double? acousticness,
    num? instrumentalness,
    double? liveness,
    double? valence,
    double? tempo,
    String? type,
    String? id,
    String? uri,
    String? trackHref,
    String? analysisUrl,
    int? durationMs,
    int? timeSignature,
  }) {
    return AudioFeatures(
      createdAt: createdAt ?? this.createdAt,
      danceability: danceability ?? this.danceability,
      energy: energy ?? this.energy,
      key: key ?? this.key,
      loudness: loudness ?? this.loudness,
      mode: mode ?? this.mode,
      speechiness: speechiness ?? this.speechiness,
      acousticness: acousticness ?? this.acousticness,
      instrumentalness: instrumentalness ?? this.instrumentalness,
      liveness: liveness ?? this.liveness,
      valence: valence ?? this.valence,
      tempo: tempo ?? this.tempo,
      type: type ?? this.type,
      id: id ?? this.id,
      uri: uri ?? this.uri,
      trackHref: trackHref ?? this.trackHref,
      analysisUrl: analysisUrl ?? this.analysisUrl,
      durationMs: durationMs ?? this.durationMs,
      timeSignature: timeSignature ?? this.timeSignature,
    );
  }
}
