// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conference _$ConferenceFromJson(Map<String, dynamic> json) => _Conference(
  id: json['id'] as String,
  name: json['name'] as String,
  logoUrl: json['logo_url'] as String,
  location: json['location'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  description: json['description'] as String?,
  isDemo: json['is_demo'] as bool? ?? false,
);

Map<String, dynamic> _$ConferenceToJson(_Conference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'location': instance.location,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'description': instance.description,
      'is_demo': instance.isDemo,
    };
