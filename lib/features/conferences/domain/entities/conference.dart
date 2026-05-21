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
    String? description,
    @JsonKey(name: 'website_url') String? websiteUrl,
    @JsonKey(name: 'performer_url') String? performerUrl,
    @Default('Ongoing') String state,
    String? date,
    String? time,
    @Default(false) @JsonKey(name: 'is_demo') bool isDemo,
  }) = _Conference;

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);
}
