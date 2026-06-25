import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_login/features/ai_assistant/data/datasources/groq_assistant_data_source.dart';
import 'package:test_login/features/ai_assistant/data/repositories/ai_assistant_repository_impl.dart';
import 'package:test_login/features/ai_assistant/domain/entities/assistant_message.dart';
import 'package:test_login/features/ai_assistant/domain/repositories/ai_assistant_repository.dart';
import 'package:test_login/features/conferences/domain/entities/conference.dart';
import 'package:test_login/features/conferences/domain/repositories/conference_repository.dart';

import 'ai_assistant_repository_impl_test.mocks.dart';

@GenerateMocks([GroqAssistantDataSource, ConferenceRepository])
void main() {
  group('AiAssistantRepositoryImpl', () {
    late AiAssistantRepositoryImpl repository;
    late MockGroqAssistantDataSource mockDataSource;
    late MockConferenceRepository mockConferenceRepository;

    setUp(() {
      mockDataSource = MockGroqAssistantDataSource();
      mockConferenceRepository = MockConferenceRepository();
      repository = AiAssistantRepositoryImpl(
        mockDataSource,
        mockConferenceRepository,
      );
    });

    final testMessage = AssistantMessage(
      role: 'user',
      content: 'What sessions are available?',
      timestamp: DateTime.now(),
    );

    final testHistory = [
      AssistantMessage(
        role: 'assistant',
        content: 'Hello! How can I help you with the conference?',
        timestamp: DateTime.now(),
      ),
    ];

    group('sendMessage', () {
      test(
        'should return AssistantMessage on successful API response',
        () async {
          // Arrange
          final mockApiResponse = {
            'choices': [
              {
                'message': {'content': 'Here are the available sessions...'},
              },
            ],
          };

          when(
            mockConferenceRepository.getSelectedConference(),
          ).thenAnswer((_) async => const Right(null));
          when(
            mockDataSource.postChatCompletion(messages: anyNamed('messages')),
          ).thenAnswer((_) async => mockApiResponse);

          // Act
          final result = await repository.sendMessage(
            prompt: testMessage.content,
            history: testHistory,
          );

          // Assert
          expect(result.isRight(), true);
          result.fold((failure) => fail('Should not be failure'), (message) {
            expect(message.role, 'assistant');
            expect(message.content, 'Here are the available sessions...');
            expect(message.timestamp, isA<DateTime>());
          });

          verify(
            mockDataSource.postChatCompletion(messages: anyNamed('messages')),
          ).called(1);
        },
      );

      test('should include message history in API request', () async {
        // Arrange
        final mockApiResponse = {
          'choices': [
            {
              'message': {'content': 'Response'},
            },
          ],
        };

        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenAnswer((_) async => mockApiResponse);

        // Act
        await repository.sendMessage(
          prompt: testMessage.content,
          history: testHistory,
        );

        // Assert
        final capturedCall = verify(
          mockDataSource.postChatCompletion(
            messages: captureAnyNamed('messages'),
          ),
        ).captured;

        final messages = capturedCall[0] as List<Map<String, String>>;
        expect(
          messages.length,
          greaterThan(2),
        ); // system + history + new prompt
        expect(messages[0]['role'], 'system');
        expect(messages.last['role'], 'user');
        expect(messages.last['content'], testMessage.content);
      });

      test(
        'should include conference context in system prompt when available',
        () async {
          // Arrange
          final conference = Conference(
            id: '1',
            name: 'Tech Conference 2024',
            logoUrl: 'http://example.com/logo.jpg',
            location: 'San Francisco',
            description: 'A great tech conference',
          );

          final mockApiResponse = {
            'choices': [
              {
                'message': {'content': 'Response'},
              },
            ],
          };

          when(
            mockConferenceRepository.getSelectedConference(),
          ).thenAnswer((_) async => Right(conference));
          when(
            mockDataSource.postChatCompletion(messages: anyNamed('messages')),
          ).thenAnswer((_) async => mockApiResponse);

          // Act
          await repository.sendMessage(
            prompt: testMessage.content,
            history: testHistory,
          );

          // Assert
          final capturedCall = verify(
            mockDataSource.postChatCompletion(
              messages: captureAnyNamed('messages'),
            ),
          ).captured;

          final messages = capturedCall[0] as List<Map<String, String>>;
          final systemPrompt = messages[0]['content']!;

          expect(systemPrompt, contains('Tech Conference 2024'));
          expect(systemPrompt, contains('San Francisco'));
        },
      );

      test('should return Failure when data source throws exception', () async {
        // Arrange
        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenThrow(Exception('API Error'));

        // Act
        final result = await repository.sendMessage(
          prompt: testMessage.content,
          history: testHistory,
        );

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<AiAssistantFailure>());
        }, (message) => fail('Should not be success'));
      });

      test('should handle empty message history', () async {
        // Arrange
        final mockApiResponse = {
          'choices': [
            {
              'message': {'content': 'Response to initial message'},
            },
          ],
        };

        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenAnswer((_) async => mockApiResponse);

        // Act
        final result = await repository.sendMessage(
          prompt: testMessage.content,
          history: [],
        );

        // Assert
        expect(result.isRight(), true);
        final capturedCall = verify(
          mockDataSource.postChatCompletion(
            messages: captureAnyNamed('messages'),
          ),
        ).captured;

        final messages = capturedCall[0] as List<Map<String, String>>;
        // Should have system prompt + new user message
        expect(messages.length, 2);
      });

      test('should preserve message roles in history', () async {
        // Arrange
        final complexHistory = [
          AssistantMessage(
            role: 'assistant',
            content: 'First response',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'user',
            content: 'Follow-up question',
            timestamp: DateTime.now(),
          ),
          AssistantMessage(
            role: 'assistant',
            content: 'Second response',
            timestamp: DateTime.now(),
          ),
        ];

        final mockApiResponse = {
          'choices': [
            {
              'message': {'content': 'Final response'},
            },
          ],
        };

        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenAnswer((_) async => mockApiResponse);

        // Act
        await repository.sendMessage(
          prompt: testMessage.content,
          history: complexHistory,
        );

        // Assert
        final capturedCall = verify(
          mockDataSource.postChatCompletion(
            messages: captureAnyNamed('messages'),
          ),
        ).captured;

        final messages = capturedCall[0] as List<Map<String, String>>;
        // Skip system message at index 0
        expect(messages[1]['role'], 'assistant');
        expect(messages[2]['role'], 'user');
        expect(messages[3]['role'], 'assistant');
        expect(messages[4]['role'], 'user');
      });

      test('should create message with current timestamp', () async {
        // Arrange
        final beforeTest = DateTime.now();
        await Future.delayed(Duration(milliseconds: 10));

        final mockApiResponse = {
          'choices': [
            {
              'message': {'content': 'Response'},
            },
          ],
        };

        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenAnswer((_) async => mockApiResponse);

        // Act
        final result = await repository.sendMessage(
          prompt: testMessage.content,
          history: testHistory,
        );

        final afterTest = DateTime.now();

        // Assert
        expect(result.isRight(), true);
        result.fold((failure) => fail('Should not be failure'), (message) {
          expect(message.timestamp.isAfter(beforeTest), true);
          expect(
            message.timestamp.isBefore(afterTest.add(Duration(seconds: 1))),
            true,
          );
        });
      });

      test(
        'should correctly extract content from nested API response',
        () async {
          // Arrange
          final mockApiResponse = {
            'id': 'msg-123',
            'choices': [
              {
                'index': 0,
                'message': {
                  'role': 'assistant',
                  'content': 'Extracted content from nested structure',
                },
                'finish_reason': 'stop',
              },
            ],
            'usage': {'prompt_tokens': 100, 'completion_tokens': 50},
          };

          when(
            mockConferenceRepository.getSelectedConference(),
          ).thenAnswer((_) async => const Right(null));
          when(
            mockDataSource.postChatCompletion(messages: anyNamed('messages')),
          ).thenAnswer((_) async => mockApiResponse);

          // Act
          final result = await repository.sendMessage(
            prompt: testMessage.content,
            history: testHistory,
          );

          // Assert
          expect(result.isRight(), true);
          result.fold((failure) => fail('Should not be failure'), (message) {
            expect(message.content, 'Extracted content from nested structure');
          });
        },
      );

      test('should handle null conference gracefully', () async {
        // Arrange
        final mockApiResponse = {
          'choices': [
            {
              'message': {'content': 'Response without conference context'},
            },
          ],
        };

        when(
          mockConferenceRepository.getSelectedConference(),
        ).thenAnswer((_) async => const Right(null));
        when(
          mockDataSource.postChatCompletion(messages: anyNamed('messages')),
        ).thenAnswer((_) async => mockApiResponse);

        // Act
        final result = await repository.sendMessage(
          prompt: testMessage.content,
          history: testHistory,
        );

        // Assert
        expect(result.isRight(), true);

        final capturedCall = verify(
          mockDataSource.postChatCompletion(
            messages: captureAnyNamed('messages'),
          ),
        ).captured;

        final messages = capturedCall[0] as List<Map<String, String>>;
        final systemPrompt = messages[0]['content']!;
        expect(systemPrompt, contains('helpful AI assistant'));
      });
    });
  });
}
