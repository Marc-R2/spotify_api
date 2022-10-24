part of '../../spotify_api.dart';

class AudioAnalysis {
  AudioAnalysis({
    required this.createdAt,
    required this.meta,
    required this.track,
    required this.bars,
  });

  static AudioAnalysis fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>;
    final track = json['track'] as Map<String, dynamic>;
    final bars = json['bars'] as List<dynamic>;
   return  AudioAnalysis(
      createdAt: DateTime.now(),
      meta: AnalysisMeta.fromJson(meta),
      track: AnalysisTrack.fromJson(track),
      bars: Bar.fromJsonList(bars),
    );
  }

  static final Map<String, AudioFeatures> _analysisCache = {};

  static Future<Success<AudioFeatures>> fromTrack({
    required Track track,
    required SpotifyApi api,
    bool noCache = false,
  }) async {
    final id = track.id;
    if (_analysisCache.containsKey(id) && !noCache) {
      return Success(data: _analysisCache[id]);
    }
    final res = await api.tracks.getAudioFeaturesById(id: id);
    if (res.success) _analysisCache[id] = res.data!;
    return res;
  }

  static int maxCacheSize = 32;

  static void cleanCache([int? maxSize]) {
    if (maxSize != null) maxCacheSize = maxSize;
    if (_analysisCache.length < maxCacheSize) return;
    // remove oldest
    final oldest = _analysisCache.entries.toList()
      ..sort((a, b) => a.value.createdAt.compareTo(b.value.createdAt));
    final toRemove = oldest.sublist(0, oldest.length - maxCacheSize);
    for (final entry in toRemove) {
      _analysisCache.remove(entry.key);
    }
  }

  final DateTime createdAt;

  final AnalysisMeta meta;

  final AnalysisTrack track;

  final TimedList<Bar> bars;
}
