import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference_shell_config.freezed.dart';
part 'conference_shell_config.g.dart';

@freezed
abstract class ConferenceShellConfig with _$ConferenceShellConfig {
  const factory ConferenceShellConfig({
    required String conferenceId,
    required String primaryColorHex,
    required String logoUrl,
    required List<ShellSection> enabledSections,
    required Map<String, dynamic> metadata,
  }) = _ConferenceShellConfig;

  factory ConferenceShellConfig.fromJson(Map<String, dynamic> json) => _$ConferenceShellConfigFromJson(json);
}

enum ShellSection {
  schedule,
  speakers,
  attendees,
  sponsors,
  certificate,
  announcements,
}
