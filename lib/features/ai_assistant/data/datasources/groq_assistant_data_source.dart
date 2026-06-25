import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_login/app/data/api_config.dart';

@lazySingleton
class GroqAssistantDataSource {
  final Dio _dio;

  GroqAssistantDataSource(this._dio);

  Future<Map<String, dynamic>> postChatCompletion({
    required List<Map<String, String>> messages,
    String model = 'llama-3.1-8b-instant',
  }) async {
    try {
      print('📤 Sending API request to Groq...');
      print('   Model: $model');
      print('   Messages count: ${messages.length}');
      print(
        '   API Key: ${ApiConfig.groqApiKey.isNotEmpty ? "✅ Loaded (${ApiConfig.groqApiKey.substring(0, 10)}...)" : "❌ NOT FOUND"}',
      );
      print('   Base URL: ${ApiConfig.groqBaseUrl}');

      final response = await _dio.post(
        ApiConfig.groqBaseUrl + '/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiConfig.groqApiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': model,
          'messages': messages,
          'temperature': 0.7,
          'max_tokens': 1024,
        },
      );

      if (response.statusCode == 200) {
        print('✅ API Response successful');
        return response.data;
      } else {
        print('❌ API Error Status: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      print('   Type: ${e.type}');
      print('   Status: ${e.response?.statusCode}');
      print('   Response: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print('❌ Unknown Error: $e');
      rethrow;
    }
  }
}
