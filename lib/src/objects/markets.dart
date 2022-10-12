part of '../../spotify_api.dart';

class Markets {
  const Markets({required this.markets});

  factory Markets.fromJson(List<dynamic> json) => Markets(
        markets: List<String>.from(json.map((x) => x.toString())),
      );

  final List<String> markets;

  Map<String, dynamic> toJson() => {'markets': markets};
}
