import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await _authDataSource.signInWithGoogle();
      if (user != null) {
        return Right(user);
      } else {
        return Left(AuthFailure('Google sign-in failed.'));
      }
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = await _authDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
