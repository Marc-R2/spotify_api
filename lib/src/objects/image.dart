part of '../../spotify_api.dart';

class CoverImage {
  const CoverImage({
    required this.url,
    required this.width,
    required this.height,
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        url: json['url'] as String,
        width: json['width'] as int,
        height: json['height'] as int,
      );

  final String url;
  final int width;
  final int height;

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
