import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/conference.dart';
import '../../domain/repositories/conference_repository.dart';

part 'conference_bloc.freezed.dart';

@freezed
abstract class ConferenceEvent with _$ConferenceEvent {
  const factory ConferenceEvent.loadConferences() = LoadConferences;
  const factory ConferenceEvent.selectConference(Conference conference) =
      SelectConference;
  const factory ConferenceEvent.loadSelectedConference() =
      LoadSelectedConference;
  const factory ConferenceEvent.clearSelectedConference() =
      ClearSelectedConference;
}

@freezed
abstract class ConferenceState with _$ConferenceState {
  const factory ConferenceState.initial() = ConferenceInitial;
  const factory ConferenceState.loading() = ConferenceLoading;
  const factory ConferenceState.loaded(
    List<Conference> conferences,
    Conference? selected,
  ) = ConferenceLoaded;
  const factory ConferenceState.error(String message) = ConferenceError;
}

@injectable
class ConferenceBloc extends Bloc<ConferenceEvent, ConferenceState> {
  final ConferenceRepository _conferenceRepository;

  ConferenceBloc(this._conferenceRepository)
    : super(const ConferenceState.initial()) {
    on<LoadConferences>(_onLoadConferences);
    on<SelectConference>(_onSelectConference);
    on<LoadSelectedConference>(_onLoadSelectedConference);
    on<ClearSelectedConference>(_onClearSelectedConference);
  }

  Future<void> _onLoadConferences(
    LoadConferences event,
    Emitter<ConferenceState> emit,
  ) async {
    emit(const ConferenceState.loading());
    final result = await _conferenceRepository.getConferences();
    await result.fold(
      (failure) async => emit(ConferenceState.error(failure.message)),
      (conferences) async {
        final selectedResult = await _conferenceRepository
            .getSelectedConference();
        final selected = selectedResult.fold((_) => null, (u) => u);
        emit(ConferenceState.loaded(conferences, selected));
      },
    );
  }

  Future<void> _onSelectConference(
    SelectConference event,
    Emitter<ConferenceState> emit,
  ) async {
    final result = await _conferenceRepository.selectConference(
      event.conference,
    );
    await result.fold(
      (failure) async => emit(ConferenceState.error(failure.message)),
      (_) async {
        List<Conference> currentList = [];
        if (state is ConferenceLoaded) {
          currentList = (state as ConferenceLoaded).conferences;
        }

        final conferencesResult = await _conferenceRepository.getConferences();
        conferencesResult.fold(
          (failure) =>
              emit(ConferenceState.loaded(currentList, event.conference)),
          (conferences) =>
              emit(ConferenceState.loaded(conferences, event.conference)),
        );
      },
    );
  }

  Future<void> _onLoadSelectedConference(
    LoadSelectedConference event,
    Emitter<ConferenceState> emit,
  ) async {
    final result = await _conferenceRepository.getSelectedConference();
    result.fold((failure) => emit(ConferenceState.error(failure.message)), (
      selected,
    ) {
      if (selected == null) {
        emit(const ConferenceState.initial());
      } else {
        emit(ConferenceState.loaded(const [], selected));
      }
    });
  }

  Future<void> _onClearSelectedConference(
    ClearSelectedConference event,
    Emitter<ConferenceState> emit,
  ) async {
    final result = await _conferenceRepository.clearSelectedConference();
    await result.fold(
      (failure) async => emit(ConferenceState.error(failure.message)),
      (_) async {
        List<Conference> currentList = [];
        if (state is ConferenceLoaded) {
          currentList = (state as ConferenceLoaded).conferences;
        }

        final conferencesResult = await _conferenceRepository.getConferences();
        conferencesResult.fold(
          (failure) => emit(ConferenceState.loaded(currentList, null)),
          (conferences) => emit(ConferenceState.loaded(conferences, null)),
        );
      },
    );
  }
}
