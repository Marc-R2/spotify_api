part of '../../spotify_api.dart';

class Markets {
  const Markets({required this.markets});

  factory Markets.fromJson(Map<String, dynamic> json) => Markets(
        markets: List<String>.from(
          (json['markets'] as List).map((x) => x as String),
        ),
      );

  final List<String> markets;

  Map<String, dynamic> toJson() => {
        'markets': markets,
      };
}
