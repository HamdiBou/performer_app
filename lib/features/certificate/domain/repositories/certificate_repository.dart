import 'package:dartz/dartz.dart';
import '../entities/certificate.dart';

/// Abstract repository for certificate operations.
abstract class CertificateRepository {
  /// Generates a certificate for a user and conference.
  Future<Either<Failure, Certificate>> generateCertificate({
    required String userId,
    required String userName,
    required String conferenceId,
    required String conferenceName,
  });

  /// Saves the certificate to the device gallery.
  Future<Either<Failure, void>> saveCertificateToGallery(String filePath);
}

/// Base class for failures.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Certificate specific failure.
class CertificateFailure extends Failure {
  CertificateFailure(String message) : super(message);
}
