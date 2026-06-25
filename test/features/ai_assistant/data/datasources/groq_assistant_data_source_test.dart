import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_login/features/ai_assistant/data/datasources/groq_assistant_data_source.dart';

import 'groq_assistant_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('GroqAssistantDataSource', () {
    late GroqAssistantDataSource dataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dataSource = GroqAssistantDataSource(mockDio);
    });

    group('postChatCompletion', () {
      final testMessages = [
        {'role': 'system', 'content': 'You are a helpful assistant'},
        {'role': 'user', 'content': 'Hello'},
      ];

      final mockResponse = {
        'id': 'chatcmpl-123',
        'object': 'chat.completion',
        'created': 1677652288,
        'model': 'llama-3.1-8b-instant',
        'choices': [
          {
            'index': 0,
            'message': {
              'role': 'assistant',
              'content': 'Hello! How can I help you today?',
            },
            'finish_reason': 'stop',
          },
        ],
        'usage': {
          'prompt_tokens': 10,
          'completion_tokens': 15,
          'total_tokens': 25,
        },
      };

      test('should return response data on successful API call', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act
        final result = await dataSource.postChatCompletion(
          messages: testMessages,
        );

        // Assert
        expect(result, mockResponse);
        verify(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).called(1);
      });

      test('should throw DioException on non-200 status code', () async {
        // Arrange
        final response = Response(
          data: {'error': 'Unauthorized'},
          statusCode: 401,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act & Assert
        expect(
          () => dataSource.postChatCompletion(messages: testMessages),
          throwsA(isA<DioException>()),
        );
      });

      test('should use custom model when provided', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act
        await dataSource.postChatCompletion(
          messages: testMessages,
          model: 'llama-3.1-8b-instant',
        );

        // Assert
        verify(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: argThat(contains('model')),
          ),
        ).called(1);
      });

      test('should include proper headers in request', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act
        await dataSource.postChatCompletion(messages: testMessages);

        // Assert
        final capturedCall = verify(
          mockDio.post(
            any,
            options: captureAnyNamed('options'),
            data: anyNamed('data'),
          ),
        ).captured;

        final options = capturedCall[0] as Options;
        expect(
          options.headers,
          containsPair('Content-Type', 'application/json'),
        );
        expect(options.headers!['Authorization'], isNotEmpty);
      });

      test('should include messages in request body', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act
        await dataSource.postChatCompletion(messages: testMessages);

        // Assert
        final capturedCall = verify(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: captureAnyNamed('data'),
          ),
        ).captured;

        final data = capturedCall[0] as Map<String, dynamic>;
        expect(data['messages'], testMessages);
        expect(data['temperature'], 0.7);
        expect(data['max_tokens'], 1024);
      });

      test('should handle empty message list', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        final emptyMessages = <Map<String, String>>[];

        // Act
        final result = await dataSource.postChatCompletion(
          messages: emptyMessages,
        );

        // Assert
        expect(result, mockResponse);
      });

      test('should throw DioException on network error', () async {
        // Arrange
        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/chat/completions'),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        // Act & Assert
        expect(
          () => dataSource.postChatCompletion(messages: testMessages),
          throwsA(isA<DioException>()),
        );
      });

      test('should correctly parse assistant response', () async {
        // Arrange
        final response = Response(
          data: mockResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/chat/completions'),
        );

        when(
          mockDio.post(
            any,
            options: anyNamed('options'),
            data: anyNamed('data'),
          ),
        ).thenAnswer((_) async => response);

        // Act
        final result = await dataSource.postChatCompletion(
          messages: testMessages,
        );

        // Assert
        expect(result['choices'], isNotEmpty);
        expect(result['choices'][0]['message']['role'], 'assistant');
        expect(
          result['choices'][0]['message']['content'],
          'Hello! How can I help you today?',
        );
      });
    });
  });
}
