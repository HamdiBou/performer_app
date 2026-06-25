import 'package:dartz/dartz.dart';
import '../entities/assistant_message.dart';
import 'package:test_login/features/conferences/domain/repositories/conference_repository.dart'; // Reusing Failure from here if needed or define a local one.

/// Base class for AI Assistant failures.
abstract class AiFailure extends Failure {
  AiFailure(String message) : super(message);
}

class AiAssistantFailure extends AiFailure {
  AiAssistantFailure(String message) : super(message);
}

/// Abstract repository for AI Assistant operations.
abstract class AiAssistantRepository {
  /// Sends a message to the AI assistant and gets a response.
  Future<Either<AiFailure, AssistantMessage>> sendMessage({
    required String prompt,
    required List<AssistantMessage> history,
  });
}
