import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistant_message.freezed.dart';
part 'assistant_message.g.dart';

@freezed
abstract class AssistantMessage with _$AssistantMessage {
  const factory AssistantMessage({
    required String role, // 'user' or 'assistant'
    required String content,
    required DateTime timestamp,
  }) = _AssistantMessage;

  factory AssistantMessage.fromJson(Map<String, dynamic> json) =>
      _$AssistantMessageFromJson(json);
}
