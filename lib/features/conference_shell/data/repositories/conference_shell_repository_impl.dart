import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/conference_shell_config.dart';
import '../../domain/repositories/conference_shell_repository.dart';

@LazySingleton(as: ConferenceShellRepository)
class ConferenceShellRepositoryImpl implements ConferenceShellRepository {
  @override
  Future<Either<Failure, ConferenceShellConfig>> getShellConfig(
    String conferenceId,
  ) async {
    try {
      if (conferenceId == 'demo') {
        return const Right(
          ConferenceShellConfig(
            conferenceId: 'demo',
            primaryColorHex: '#FF5722', // Deep Orange for Demo
            logoUrl: 'assets/images/event_logo.svg',
            enabledSections: ShellSection.values, // All sections for demo
            metadata: {'welcome_message': 'Welcome to the Demo Conference!'},
          ),
        );
      }

      // Simulate network delay for other conferences
      await Future.delayed(const Duration(milliseconds: 500));

      return Right(
        ConferenceShellConfig(
          conferenceId: conferenceId,
          primaryColorHex: '#6200EE',
          logoUrl: 'assets/images/event_logo.svg',
          enabledSections: [
            ShellSection.schedule,
            ShellSection.speakers,
            ShellSection.sponsors,
            ShellSection.announcements,
            ShellSection.certificate,
          ],
          metadata: {'theme': 'light'},
        ),
      );
    } catch (e) {
      return Left(ShellFailure(e.toString()));
    }
  }
}
