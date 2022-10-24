part of '../../../spotify_api.dart';

class Segment extends Timed {
  const Segment({
    required super.startTime,
    required super.duration,
    required super.confidence,
    required this.loudnessStart,
    required this.loudnessMax,
    required this.loudnessMaxTime,
    required this.loudnessEnd,
    required this.pitches,
    required this.timbre,
  });

  static Segment fromJson(Map<String, dynamic> json) => Segment(
    startTime: json['start'] as double,
    duration: json['duration'] as double,
    confidence: json['confidence'] as double,
    loudnessStart: json['loudness_start'] as double,
    loudnessMax: json['loudness_max'] as double,
    loudnessMaxTime: json['loudness_max_time'] as double,
    loudnessEnd: json['loudness_end'] as double,
    pitches: (json['pitches'] as List<dynamic>).cast<double>(),
    timbre: (json['timbre'] as List<dynamic>).cast<double>(),
  );

  static TimedList<Segment> fromJsonList(List<dynamic> json) {
    final list = TimedList<Segment>();
    for (final item in json) {
      list.insert(Segment.fromJson(item as Map<String, dynamic>));
    }
    return list;
  }

  final double loudnessStart;

  final double loudnessMax;

  final double loudnessMaxTime;

  final double loudnessEnd;

  final List<double> pitches;

  final List<double> timbre;
}
