part of '../../../spotify_api.dart';

class Tatum extends Timed {
  const Tatum({
    required super.startTime,
    required super.duration,
    required super.confidence,
  });

  static Tatum fromJson(Map<String, dynamic> json) => Tatum(
        startTime: json['start'] as double,
        duration: json['duration'] as double,
        confidence: json['confidence'] as double,
      );

  static TimedList<Tatum> fromJsonList(List<dynamic> json) {
    final list = TimedList<Tatum>();
    for (final item in json) {
      list.insert(Tatum.fromJson(item as Map<String, dynamic>));
    }
    return list;
  }
}
