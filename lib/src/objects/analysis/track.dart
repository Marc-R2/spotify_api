part of '../../../spotify_api.dart';

class AnalysisTrack {
  const AnalysisTrack({
    required this.numSamples,
    required this.duration,
    required this.sampleMd5,
    required this.offsetSeconds,
    required this.windowSeconds,
    required this.analysisSampleRate,
    required this.analysisChannels,
    required this.endOfFadeIn,
    required this.startOfFadeOut,
    required this.loudness,
    required this.tempo,
    required this.tempoConfidence,
    required this.timeSignature,
    required this.timeSignatureConfidence,
    required this.key,
    required this.keyConfidence,
    required this.mode,
    required this.modeConfidence,
    required this.codestring,
    required this.codeVersion,
    required this.echoprintstring,
    required this.echoprintVersion,
    required this.synchstring,
    required this.synchVersion,
    required this.rhythmstring,
    required this.rhythmVersion,
  });

  static AnalysisTrack fromJson(Map<String, dynamic> json) => AnalysisTrack(
        numSamples: json['num_samples'] as int,
        duration: json['duration'] as double,
        sampleMd5: json['sample_md5'] as String,
        offsetSeconds: json['offset_seconds'] as int,
        windowSeconds: json['window_seconds'] as int,
        analysisSampleRate: json['analysis_sample_rate'] as int,
        analysisChannels: json['analysis_channels'] as int,
        endOfFadeIn: json['end_of_fade_in'] as double,
        startOfFadeOut: json['start_of_fade_out'] as double,
        loudness: json['loudness'] as double,
        tempo: json['tempo'] as double,
        tempoConfidence: json['tempo_confidence'] as double,
        timeSignature: json['time_signature'] as int,
        timeSignatureConfidence: json['time_signature_confidence'] as double,
        key: json['key'] as int,
        keyConfidence: json['key_confidence'] as double,
        mode: json['mode'] as int,
        modeConfidence: json['mode_confidence'] as double,
        codestring: json['codestring'] as String,
        codeVersion: json['code_version'] as double,
        echoprintstring: json['echoprintstring'] as String,
        echoprintVersion: json['echoprint_version'] as double,
        synchstring: json['synchstring'] as String,
        synchVersion: json['synch_version'] as double,
        rhythmstring: json['rhythmstring'] as String,
        rhythmVersion: json['rhythm_version'] as double,
      );

  final int numSamples;

  final double duration;

  final String sampleMd5;

  final int offsetSeconds;

  final int windowSeconds;

  final int analysisSampleRate;

  final int analysisChannels;

  final double endOfFadeIn;

  final double startOfFadeOut;

  final double loudness;

  final double tempo;

  final double tempoConfidence;

  final int timeSignature;

  final double timeSignatureConfidence;

  final int key;

  final double keyConfidence;

  final int mode;

  final double modeConfidence;

  final String codestring;

  final double codeVersion;

  final String echoprintstring;

  final double echoprintVersion;

  final String synchstring;

  final double synchVersion;

  final String rhythmstring;

  final double rhythmVersion;
}
