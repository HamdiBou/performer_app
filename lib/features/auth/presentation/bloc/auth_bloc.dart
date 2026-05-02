import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.appStarted() = AppStarted;
  const factory AuthEvent.signInWithGoogle() = SignInWithGoogle;
  const factory AuthEvent.signOut() = SignOut;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(User user) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.error(String message) = AuthError;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AppStarted>(_onAppStarted);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final result = await _authRepository.getCurrentUser();
    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) =>
          user != null ? emit(AuthState.authenticated(user)) : emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _authRepository.signInWithGoogle();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _authRepository.signOut();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
