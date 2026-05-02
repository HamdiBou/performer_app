import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

/// Entity representing a generated certificate.
@freezed
abstract class Certificate with _$Certificate {
  const factory Certificate({
    required String id,
    required String userId,
    required String conferenceId,
    required String issuedDate,
    required String filePath,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
}
