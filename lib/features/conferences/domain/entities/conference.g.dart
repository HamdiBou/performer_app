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
  description: json['description'] as String?,
  websiteUrl: json['website_url'] as String?,
  performerUrl: json['performer_url'] as String?,
  state: json['state'] as String? ?? 'Ongoing',
  date: json['date'] as String?,
  time: json['time'] as String?,
  isDemo: json['is_demo'] as bool? ?? false,
  sessions: (json['sessions'] as List<dynamic>?)
      ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
      .toList(),
  speakers: (json['speakers'] as List<dynamic>?)
      ?.map((e) => Speaker.fromJson(e as Map<String, dynamic>))
      .toList(),
  sponsors: (json['sponsors'] as List<dynamic>?)
      ?.map((e) => Sponsor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ConferenceToJson(_Conference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'location': instance.location,
      'description': instance.description,
      'website_url': instance.websiteUrl,
      'performer_url': instance.performerUrl,
      'state': instance.state,
      'date': instance.date,
      'time': instance.time,
      'is_demo': instance.isDemo,
      'sessions': instance.sessions,
      'speakers': instance.speakers,
      'sponsors': instance.sponsors,
    };
