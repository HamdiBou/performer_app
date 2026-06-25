import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../sessions/domain/entities/session.dart';
import '../../../speakers/domain/entities/speaker.dart';
import '../../../sponsors/domain/entities/sponsor.dart';

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
    List<Session>? sessions,
    List<Speaker>? speakers,
    List<Sponsor>? sponsors,
  }) = _Conference;

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);

  // Added this method to help with mapping in controllers
  const Conference._();
  Map<String, dynamic> toMap() => toJson();
}
