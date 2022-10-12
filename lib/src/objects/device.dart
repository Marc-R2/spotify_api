part of '../../spotify_api.dart';

class Device {
  const Device({
    required this.id,
    required this.isActive,
    required this.isPrivateSession,
    required this.isRestricted,
    required this.name,
    required this.type,
    required this.volumePercent,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json['id'] as String,
        isActive: json['is_active'] as bool,
        isPrivateSession: json['is_private_session'] as bool,
        isRestricted: json['is_restricted'] as bool,
        name: json['name'] as String,
        type: json['type'] as String,
        volumePercent: json['volume_percent'] as int,
      );

  final String id;
  final bool isActive;
  final bool isPrivateSession;
  final bool isRestricted;
  final String name;
  final String type;
  final int volumePercent;

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_active': isActive,
        'is_private_session': isPrivateSession,
        'is_restricted': isRestricted,
        'name': name,
        'type': type,
        'volume_percent': volumePercent,
      };
}
