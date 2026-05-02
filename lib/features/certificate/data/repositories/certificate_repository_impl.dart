import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import '../../domain/entities/certificate.dart';
import '../../domain/repositories/certificate_repository.dart';

@LazySingleton(as: CertificateRepository)
class CertificateRepositoryImpl implements CertificateRepository {
  @override
  Future<Either<Failure, Certificate>> generateCertificate({
    required String userId,
    required String userName,
    required String conferenceId,
    required String conferenceName,
  }) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    "CERTIFICATE OF PARTICIPATION",
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "This is to certify that",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    userName,
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    "has successfully participated in",
                    style: pw.TextStyle(fontSize: 18),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    conferenceName,
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    "Date: ${DateTime.now().toString().split(' ')[0]}",
                    style: pw.TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/certificate_$userId.pdf");
      await file.writeAsBytes(await pdf.save());

      return Right(
        Certificate(
          id: 'cert_${DateTime.now().millisecondsSinceEpoch}',
          userId: userId,
          conferenceId: conferenceId,
          issuedDate: DateTime.now().toIso8601String(),
          filePath: file.path,
        ),
      );
    } catch (e) {
      return Left(CertificateFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveCertificateToGallery(
    String filePath,
  ) async {
    try {
      final file = File(filePath);
      final bytes = await file.readAsBytes();
      final result = await ImageGallerySaverPlus.saveImage(
        bytes,
        name: "certificate_${DateTime.now().millisecondsSinceEpoch}",
      );
      
      if (result != null && result['isSuccess'] == true) {
        return const Right(null);
      } else {
        return Left(CertificateFailure('Failed to save certificate to gallery.'));
      }
    } catch (e) {
      return Left(CertificateFailure(e.toString()));
    }
  }
}
