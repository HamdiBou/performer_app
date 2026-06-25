// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Speaker _$SpeakerFromJson(Map<String, dynamic> json) => _Speaker(
  id: json['id'] as String,
  name: json['name'] as String,
  role: json['role'] as String,
  bio: json['bio'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$SpeakerToJson(_Speaker instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'role': instance.role,
  'bio': instance.bio,
  'image_url': instance.imageUrl,
};
