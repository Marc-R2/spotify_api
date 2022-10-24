part of '../../../spotify_api.dart';

class AnalysisMeta {
  const AnalysisMeta({
    required this.analyserVersion,
    required this.platform,
    required this.detailedStatus,
    required this.statusCode,
    required this.timestamp,
    required this.analysisTime,
    required this.inputProcess,
  });

  static AnalysisMeta fromJson(Map<String, dynamic> json) => AnalysisMeta(
        analyserVersion: json['analyser_version'] as String,
        platform: json['platform'] as String,
        detailedStatus: json['detailed_status'] as String,
        statusCode: json['status_code'] as int,
        timestamp: json['timestamp'] as int,
        analysisTime: json['analysis_time'] as double,
        inputProcess: json['input_process'] as String,
      );

  final String analyserVersion;

  final String platform;

  final String detailedStatus;

  final int statusCode;

  final int timestamp;

  final double analysisTime;

  final String inputProcess;
}
