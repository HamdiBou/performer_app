// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  speakerId: json['speaker_id'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  room: json['room'] as String,
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'speaker_id': instance.speakerId,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'room': instance.room,
};
