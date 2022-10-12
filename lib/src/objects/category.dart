part of '../../spotify_api.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.href,
    required this.limit,
    required this.offset,
    required this.total,
    required this.next,
    required this.previous,
  });

  final String href;

  final int limit;
  final int offset;

  final String? next;
  final String? previous;

  final String id;
  final String name;

  final int total;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        href: json['href'] as String,
        limit: json['limit'] as int,
        offset: json['offset'] as int,
        total: json['total'] as int,
        next: json['next'] as String?,
        previous: json['previous'] as String?,
        id: json['items'][0]['id'] as String,
        name: json['items'][0]['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'limit': limit,
        'offset': offset,
        'total': total,
        'next': next,
        'previous': previous,
      };
}
