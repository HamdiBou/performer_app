// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Certificate _$CertificateFromJson(Map<String, dynamic> json) => _Certificate(
  id: json['id'] as String,
  userId: json['userId'] as String,
  conferenceId: json['conferenceId'] as String,
  issuedDate: json['issuedDate'] as String,
  filePath: json['filePath'] as String,
);

Map<String, dynamic> _$CertificateToJson(_Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'conferenceId': instance.conferenceId,
      'issuedDate': instance.issuedDate,
      'filePath': instance.filePath,
    };
