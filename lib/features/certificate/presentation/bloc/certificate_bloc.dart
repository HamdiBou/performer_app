import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/certificate.dart';
import '../../domain/repositories/certificate_repository.dart';

part 'certificate_bloc.freezed.dart';

@freezed
abstract class CertificateEvent with _$CertificateEvent {
  const factory CertificateEvent.generate({
    required String userId,
    required String userName,
    required String conferenceId,
    required String conferenceName,
  }) = GenerateCertificate;
  const factory CertificateEvent.save(String filePath) = SaveCertificate;
}

@freezed
abstract class CertificateState with _$CertificateState {
  const factory CertificateState.initial() = CertificateInitial;
  const factory CertificateState.loading() = CertificateLoading;
  const factory CertificateState.generated(Certificate certificate) = CertificateGenerated;
  const factory CertificateState.saved() = CertificateSaved;
  const factory CertificateState.error(String message) = CertificateError;
}

@injectable
class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  final CertificateRepository _certificateRepository;

  CertificateBloc(this._certificateRepository) : super(const CertificateState.initial()) {
    on<GenerateCertificate>(_onGenerate);
    on<SaveCertificate>(_onSave);
  }

  Future<void> _onGenerate(
    GenerateCertificate event,
    Emitter<CertificateState> emit,
  ) async {
    emit(const CertificateState.loading());
    final result = await _certificateRepository.generateCertificate(
      userId: event.userId,
      userName: event.userName,
      conferenceId: event.conferenceId,
      conferenceName: event.conferenceName,
    );
    result.fold(
      (failure) => emit(CertificateState.error(failure.message)),
      (certificate) => emit(CertificateState.generated(certificate)),
    );
  }

  Future<void> _onSave(
    SaveCertificate event,
    Emitter<CertificateState> emit,
  ) async {
    emit(const CertificateState.loading());
    final result = await _certificateRepository.saveCertificateToGallery(
      event.filePath,
    );
    result.fold(
      (failure) => emit(CertificateState.error(failure.message)),
      (_) => emit(const CertificateState.saved()),
    );
  }
}
