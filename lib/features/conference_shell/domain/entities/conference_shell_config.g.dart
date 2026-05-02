// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference_shell_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConferenceShellConfig _$ConferenceShellConfigFromJson(
  Map<String, dynamic> json,
) => _ConferenceShellConfig(
  conferenceId: json['conferenceId'] as String,
  primaryColorHex: json['primaryColorHex'] as String,
  logoUrl: json['logoUrl'] as String,
  enabledSections: (json['enabledSections'] as List<dynamic>)
      .map((e) => $enumDecode(_$ShellSectionEnumMap, e))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ConferenceShellConfigToJson(
  _ConferenceShellConfig instance,
) => <String, dynamic>{
  'conferenceId': instance.conferenceId,
  'primaryColorHex': instance.primaryColorHex,
  'logoUrl': instance.logoUrl,
  'enabledSections': instance.enabledSections
      .map((e) => _$ShellSectionEnumMap[e]!)
      .toList(),
  'metadata': instance.metadata,
};

const _$ShellSectionEnumMap = {
  ShellSection.schedule: 'schedule',
  ShellSection.speakers: 'speakers',
  ShellSection.attendees: 'attendees',
  ShellSection.sponsors: 'sponsors',
  ShellSection.certificate: 'certificate',
  ShellSection.announcements: 'announcements',
};
