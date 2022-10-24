part of '../../../spotify_api.dart';

class Beat extends Timed {
  const Beat({
    required super.startTime,
    required super.duration,
    required super.confidence,
  });

  static Beat fromJson(Map<String, dynamic> json) => Beat(
        startTime: json['start'] as double,
        duration: json['duration'] as double,
        confidence: json['confidence'] as double,
      );

  static TimedList<Beat> fromJsonList(List<dynamic> json) {
    final list = TimedList<Beat>();
    for (final item in json) {
      list.insert(Beat.fromJson(item as Map<String, dynamic>));
    }
    return list;
  }
}
