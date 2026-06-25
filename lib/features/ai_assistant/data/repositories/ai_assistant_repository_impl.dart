import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/assistant_message.dart';
import '../../domain/repositories/ai_assistant_repository.dart';
import '../datasources/groq_assistant_data_source.dart';
import 'package:test_login/features/conferences/domain/repositories/conference_repository.dart';

@LazySingleton(as: AiAssistantRepository)
class AiAssistantRepositoryImpl implements AiAssistantRepository {
  final GroqAssistantDataSource _dataSource;
  final ConferenceRepository _conferenceRepository;

  AiAssistantRepositoryImpl(this._dataSource, this._conferenceRepository);

  @override
  Future<Either<AiFailure, AssistantMessage>> sendMessage({
    required String prompt,
    required List<AssistantMessage> history,
  }) async {
    try {
      // 1. Fetch current conference for context
      final conferenceResult = await _conferenceRepository
          .getSelectedConference();
      String systemPrompt =
          "You are a helpful AI assistant for a conference application. Your goal is to help users navigate the conference and attend sessions properly.";

      conferenceResult.fold((failure) => null, (conference) {
        if (conference != null) {
          systemPrompt +=
              "\n\nCurrently, the user is attending the conference: ${conference.name}.\nLocation: ${conference.location}.\nDescription: ${conference.description ?? 'No description provided'}.";
        }
      });

      // 2. Prepare messages for Groq API
      final messages = <Map<String, String>>[];
      messages.add({'role': 'system', 'content': systemPrompt});

      for (var msg in history) {
        messages.add({'role': msg.role, 'content': msg.content});
      }
      messages.add({'role': 'user', 'content': prompt});

      // 3. Call data source
      print('🤖 Sending message to AI Assistant...');
      final response = await _dataSource.postChatCompletion(messages: messages);
      print('✅ AI Response received');

      // 4. Parse response
      final content = response['choices'][0]['message']['content'];

      return Right(
        AssistantMessage(
          role: 'assistant',
          content: content,
          timestamp: DateTime.now(),
        ),
      );
    } catch (e, stackTrace) {
      print('❌ AI Assistant Error: $e');
      print('Stack trace: $stackTrace');

      String errorMessage = 'Failed to get response from AI assistant';
      if (e.toString().contains('401')) {
        errorMessage = 'Authentication failed. Please check your API key.';
      } else if (e.toString().contains('429')) {
        errorMessage = 'Rate limited. Please try again later.';
      } else if (e.toString().contains('Connection')) {
        errorMessage = 'Connection error. Please check your internet.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Request timed out. Please try again.';
      }

      return Left(AiAssistantFailure(errorMessage));
    }
  }
}
