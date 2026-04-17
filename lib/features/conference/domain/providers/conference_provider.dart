import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/conference_config.dart';

class ConferenceNotifier extends Notifier<ConferenceConfig?> {
  @override
  ConferenceConfig? build() {
    // Initially no conference is selected.
    // Could optionally load a locally cached last-used conference here.
    return null;
  }

  void selectConference(ConferenceConfig config) {
    state = config;
  }

  void clearSelection() {
    state = null;
  }
}

final conferenceProvider =
    NotifierProvider<ConferenceNotifier, ConferenceConfig?>(() {
      return ConferenceNotifier();
    });
