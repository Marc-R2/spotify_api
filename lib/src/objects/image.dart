part of '../../spotify_api.dart';

class Image {
  String url;
  int width;
  int height;

  Image({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'] as String,
        width: json['width'] as int,
        height: json['height'] as int,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}
