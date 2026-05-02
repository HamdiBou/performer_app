import 'package:freezed_annotation/freezed_annotation.dart';

part 'conference.freezed.dart';
part 'conference.g.dart';

/// Entity representing a Conference.
@freezed
abstract class Conference with _$Conference {
  const factory Conference({
    required String id,
    required String name,
    @JsonKey(name: 'logo_url') required String logoUrl,
    required String location,
    required DateTime startDate,
    required DateTime endDate,
    String? description,
    @Default(false) @JsonKey(name: 'is_demo') bool isDemo,
  }) = _Conference;

  factory Conference.fromJson(Map<String, dynamic> json) => _$ConferenceFromJson(json);
}
