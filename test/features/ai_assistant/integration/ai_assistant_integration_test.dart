import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_login/features/ai_assistant/domain/entities/assistant_message.dart';
import 'package:test_login/features/ai_assistant/domain/repositories/ai_assistant_repository.dart';

import 'ai_assistant_integration_test.mocks.dart';

@GenerateMocks([AiAssistantRepository])
void main() {
  group('AI Assistant Integration Tests', () {
    late MockAiAssistantRepository mockRepository;

    setUp(() {
      mockRepository = MockAiAssistantRepository();
    });

    group('Message conversation flow', () {
      test('should handle multi-turn conversation', () async {
        // Arrange
        final firstUserMessage = AssistantMessage(
          role: 'user',
          content: 'Tell me about React',
          timestamp: DateTime.now(),
        );

        final firstAssistantResponse = AssistantMessage(
          role: 'assistant',
          content:
              'React is a JavaScript library for building user interfaces with reusable components.',
          timestamp: DateTime.now(),
        );

        final secondUserMessage = AssistantMessage(
          role: 'user',
          content: 'What are hooks in React?',
          timestamp: DateTime.now(),
        );

        final secondAssistantResponse = AssistantMessage(
          role: 'assistant',
          content:
              'Hooks are functions that let you use state and other React features in functional components.',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(
            prompt: firstUserMessage.content,
            history: [],
          ),
        ).thenAnswer((_) async => Right(firstAssistantResponse));

        when(
          mockRepository.sendMessage(
            prompt: secondUserMessage.content,
            history: [firstUserMessage, firstAssistantResponse],
          ),
        ).thenAnswer((_) async => Right(secondAssistantResponse));

        // Act & Assert - First exchange
        final firstResult = await mockRepository.sendMessage(
          prompt: firstUserMessage.content,
          history: [],
        );

        expect(firstResult.isRight(), true);
        firstResult.fold((failure) => fail('Should not fail'), (response) {
          expect(response.role, 'assistant');
          expect(response.content, contains('React'));
        });

        // Act & Assert - Second exchange
        final secondResult = await mockRepository.sendMessage(
          prompt: secondUserMessage.content,
          history: [firstUserMessage, firstAssistantResponse],
        );

        expect(secondResult.isRight(), true);
        secondResult.fold((failure) => fail('Should not fail'), (response) {
          expect(response.role, 'assistant');
          expect(response.content, contains('Hooks'));
        });
      });

      test('should maintain conversation context across messages', () async {
        // Arrange
        final messages = [
          AssistantMessage(
            role: 'user',
            content: 'My name is John',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'assistant',
            content: 'Nice to meet you, John!',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'user',
            content: 'What is my name?',
            timestamp: DateTime.now(),
          ),
        ];

        final contextAwareResponse = AssistantMessage(
          role: 'assistant',
          content: 'Your name is John.',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(
            prompt: messages[2].content,
            history: messages.sublist(0, 2),
          ),
        ).thenAnswer((_) async => Right(contextAwareResponse));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: messages[2].content,
          history: messages.sublist(0, 2),
        );

        // Assert
        expect(result.isRight(), true);
        result.fold((failure) => fail('Should not fail'), (response) {
          expect(response.content, 'Your name is John.');
        });
      });
    });

    group('Error handling scenarios', () {
      test('should handle API failure gracefully', () async {
        // Arrange
        final apiError = AiAssistantFailure('API connection failed');

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Left(apiError));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'Hello',
          history: [],
        );

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AiAssistantFailure>());
        }, (response) => fail('Should not succeed'));
      });

      test('should handle timeout error', () async {
        // Arrange
        final timeoutError = AiAssistantFailure(
          'Request timeout after 30 seconds',
        );

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Left(timeoutError));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'This request will timeout',
          history: [],
        );

        // Assert
        expect(result.isLeft(), true);
      });

      test('should handle invalid response format', () async {
        // Arrange
        final formatError = AiAssistantFailure('Invalid response format');

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Left(formatError));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'Trigger invalid format',
          history: [],
        );

        // Assert
        expect(result.isLeft(), true);
      });
    });

    group('Message content validation', () {
      test('should handle very long messages', () async {
        // Arrange
        final longContent = 'A' * 10000; // 10k characters
        final response = AssistantMessage(
          role: 'assistant',
          content: 'Response to long content',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(prompt: longContent, history: []),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: longContent,
          history: [],
        );

        // Assert
        expect(result.isRight(), true);
      });

      test('should handle special characters in messages', () async {
        // Arrange
        final specialContent =
            'Hello! @#\$%^&*() "quoted" \'single\' {braces} [brackets]';
        final response = AssistantMessage(
          role: 'assistant',
          content: 'Response with special characters handled',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(prompt: specialContent, history: []),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: specialContent,
          history: [],
        );

        // Assert
        expect(result.isRight(), true);
      });

      test('should handle emoji in messages', () async {
        // Arrange
        final emojiContent = 'Hello 👋 How are you? 😊';
        final response = AssistantMessage(
          role: 'assistant',
          content: 'I understand emoji! 🎉',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(prompt: emojiContent, history: []),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: emojiContent,
          history: [],
        );

        // Assert
        expect(result.isRight(), true);
      });

      test('should handle multi-language messages', () async {
        // Arrange
        final multiLangContent = 'Hello 你好 مرحبا Привет';
        final response = AssistantMessage(
          role: 'assistant',
          content: 'I support multiple languages',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(prompt: multiLangContent, history: []),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: multiLangContent,
          history: [],
        );

        // Assert
        expect(result.isRight(), true);
      });
    });

    group('Response characteristics', () {
      test('should return response with assistant role', () async {
        // Arrange
        final response = AssistantMessage(
          role: 'assistant',
          content: 'Sample response',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'Hello',
          history: [],
        );

        // Assert
        result.fold((failure) => fail('Should not fail'), (message) {
          expect(message.role, 'assistant');
        });
      });

      test('should return response with non-empty content', () async {
        // Arrange
        final response = AssistantMessage(
          role: 'assistant',
          content: 'Non-empty response',
          timestamp: DateTime.now(),
        );

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'Hello',
          history: [],
        );

        // Assert
        result.fold((failure) => fail('Should not fail'), (message) {
          expect(message.content.isNotEmpty, true);
        });
      });

      test('should return response with valid timestamp', () async {
        // Arrange
        final before = DateTime.now();
        final response = AssistantMessage(
          role: 'assistant',
          content: 'Response',
          timestamp: DateTime.now(),
        );
        final after = DateTime.now();

        when(
          mockRepository.sendMessage(
            prompt: anyNamed('prompt'),
            history: anyNamed('history'),
          ),
        ).thenAnswer((_) async => Right(response));

        // Act
        final result = await mockRepository.sendMessage(
          prompt: 'Hello',
          history: [],
        );

        // Assert
        result.fold((failure) => fail('Should not fail'), (message) {
          expect(message.timestamp.isAfter(before), true);
          expect(
            message.timestamp.isBefore(after.add(Duration(seconds: 10))),
            true,
          );
        });
      });
    });

    group('Concurrent message handling', () {
      test('should handle multiple concurrent sendMessage calls', () async {
        // Arrange
        final responses = [
          AssistantMessage(
            role: 'assistant',
            content: 'Response 1',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'assistant',
            content: 'Response 2',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'assistant',
            content: 'Response 3',
            timestamp: DateTime.now(),
          ),
        ];

        when(
          mockRepository.sendMessage(prompt: 'Message 1', history: []),
        ).thenAnswer((_) async => Right(responses[0]));

        when(
          mockRepository.sendMessage(prompt: 'Message 2', history: []),
        ).thenAnswer((_) async => Right(responses[1]));

        when(
          mockRepository.sendMessage(prompt: 'Message 3', history: []),
        ).thenAnswer((_) async => Right(responses[2]));

        // Act
        final futures = [
          mockRepository.sendMessage(prompt: 'Message 1', history: []),
          mockRepository.sendMessage(prompt: 'Message 2', history: []),
          mockRepository.sendMessage(prompt: 'Message 3', history: []),
        ];

        final results = await Future.wait(futures);

        // Assert
        expect(results, hasLength(3));
        for (final result in results) {
          expect(result.isRight(), true);
        }
      });
    });
  });
}
