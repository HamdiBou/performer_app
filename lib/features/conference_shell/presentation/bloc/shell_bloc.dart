import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/conference_shell_config.dart';
import '../../domain/repositories/conference_shell_repository.dart';

part 'shell_bloc.freezed.dart';

@freezed
abstract class ShellEvent with _$ShellEvent {
  const factory ShellEvent.loadConfig(String conferenceId) = LoadConfig;
}

@freezed
abstract class ShellState with _$ShellState {
  const factory ShellState.initial() = ShellInitial;
  const factory ShellState.loading() = ShellLoading;
  const factory ShellState.loaded(ConferenceShellConfig config) = ShellLoaded;
  const factory ShellState.error(String message) = ShellError;
}

@injectable
class ShellBloc extends Bloc<ShellEvent, ShellState> {
  final ConferenceShellRepository _shellRepository;

  ShellBloc(this._shellRepository) : super(const ShellState.initial()) {
    on<LoadConfig>(_onLoadConfig);
  }

  Future<void> _onLoadConfig(LoadConfig event, Emitter<ShellState> emit) async {
    emit(const ShellState.loading());
    final result = await _shellRepository.getShellConfig(event.conferenceId);
    result.fold(
      (failure) => emit(ShellState.error(failure.message)),
      (config) => emit(ShellState.loaded(config)),
    );
  }
}
