import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker.freezed.dart';
part 'speaker.g.dart';

@freezed
abstract class Speaker with _$Speaker {
  const factory Speaker({
    required String id,
    required String name,
    required String role,
    required String bio,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) => _$SpeakerFromJson(json);
}
