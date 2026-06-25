// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => _Sponsor(
  id: json['id'] as String,
  name: json['name'] as String,
  tier: json['tier'] as String,
  logoUrl: json['logo_url'] as String,
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tier': instance.tier,
  'logo_url': instance.logoUrl,
};
