part of '../../spotify_api.dart';

class Image {
  const Image({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
