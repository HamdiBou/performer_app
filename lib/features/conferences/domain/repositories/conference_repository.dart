import 'package:dartz/dartz.dart';
import '../entities/conference.dart';

/// Abstract repository for conference operations.
abstract class ConferenceRepository {
  /// Fetches the list of available conferences.
  Future<Either<Failure, List<Conference>>> getConferences();

  /// Persists the selected conference.
  Future<Either<Failure, void>> selectConference(Conference conference);

  /// Retrieves the currently selected conference.
  Future<Either<Failure, Conference?>> getSelectedConference();

  /// Clears the selected conference.
  Future<Either<Failure, void>> clearSelectedConference();
}

/// Base class for failures.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Conference specific failure.
class ConferenceFailure extends Failure {
  ConferenceFailure(String message) : super(message);
}
