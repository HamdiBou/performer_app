import 'package:dartz/dartz.dart';
import '../entities/conference_shell_config.dart';

/// Abstract repository for fetching conference shell configuration.
abstract class ConferenceShellRepository {
  /// Fetches the shell configuration for a specific conference.
  Future<Either<Failure, ConferenceShellConfig>> getShellConfig(
    String conferenceId,
  );
}

/// Base class for failures.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Shell specific failure.
class ShellFailure extends Failure {
  ShellFailure(String message) : super(message);
}
