import 'package:dartz/dartz.dart';
import '../entities/user.dart';

/// Abstract repository for authentication operations.
abstract class AuthRepository {
  /// Signs in a user with Google.
  Future<Either<Failure, User>> signInWithGoogle();

  /// Signs out the current user.
  Future<Either<Failure, void>> signOut();

  /// Gets the currently authenticated user.
  Future<Either<Failure, User?>> getCurrentUser();
}

/// Base class for failures.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Authentication specific failure.
class AuthFailure extends Failure {
  AuthFailure(String message) : super(message);
}
