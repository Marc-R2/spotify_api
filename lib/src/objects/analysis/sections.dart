part of '../../../spotify_api.dart';

class Section extends Timed {
  const Section({
    required super.startTime,
    required super.duration,
    required super.confidence,
    required this.loudness,
    required this.tempo,
    required this.tempoConfidence,
    required this.key,
    required this.keyConfidence,
    required this.mode,
    required this.modeConfidence,
    required this.timeSignature,
    required this.timeSignatureConfidence,
  });

  static Section fromJson(Map<String, dynamic> json) => Section(
    startTime: json['start'] as double,
    duration: json['duration'] as double,
    confidence: json['confidence'] as double,
    loudness: json['loudness'] as double,
    tempo: json['tempo'] as double,
    tempoConfidence: json['tempo_confidence'] as double,
    key: json['key'] as int,
    keyConfidence: json['key_confidence'] as double,
    mode: json['mode'] as int,
    modeConfidence: json['mode_confidence'] as double,
    timeSignature: json['time_signature'] as int,
    timeSignatureConfidence: json['time_signature_confidence'] as double,
  );

  static TimedList<Section> fromJsonList(List<dynamic> json) {
    final list = TimedList<Section>();
    for (final item in json) {
      list.insert(Section.fromJson(item as Map<String, dynamic>));
    }
    return list;
  }

  final double loudness;

  final double tempo;

  final double tempoConfidence;

  final int key;

  final double keyConfidence;

  final int mode;

  final double modeConfidence;

  final int timeSignature;

  final double timeSignatureConfidence;
}
