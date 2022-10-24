part of '../../../spotify_api.dart';

abstract class Timed {
  const Timed({
    required this.startTime,
    required this.duration,
    required this.confidence,
  });

  final double startTime;
  final double duration;
  final double confidence;

  double get endTime => startTime + duration;

  int get startMs => (startTime * 1000).round();

  int get durationMs => (duration * 1000).round();
}
