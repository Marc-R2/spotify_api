part of '../../spotify_api.dart';

class ExternalIds {
  const ExternalIds({
    this.isrc,
    this.ean,
    this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json['isrc'] as String?,
        ean: json['ean'] as String?,
        upc: json['upc'] as String?,
      );

  final String? isrc;
  final String? ean;
  final String? upc;

  Map<String, dynamic> toJson() => {
        'isrc': isrc,
        'ean': ean,
        'upc': upc,
      };
}
