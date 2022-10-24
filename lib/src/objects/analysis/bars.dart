part of '../../../spotify_api.dart';

class Bar extends Timed {
  const Bar({
    required super.startTime,
    required super.duration,
    required super.confidence,
  });

  static Bar fromJson(Map<String, dynamic> json) => Bar(
        startTime: json['start'] as double,
        duration: json['duration'] as double,
        confidence: json['confidence'] as double,
      );

  static TimedList<Bar> fromJsonList(List<dynamic> json) {
    final list = TimedList<Bar>();
    for (final item in json) {
      list.insert(Bar.fromJson(item as Map<String, dynamic>));
    }
    return list;
  }
}
