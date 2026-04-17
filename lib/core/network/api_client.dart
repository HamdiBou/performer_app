import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/conference/domain/providers/conference_provider.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> get(String endpoint) async {
    // TODO: Implement HTTP GET (e.g., using dio or http package)
    print('GET $baseUrl$endpoint');
  }

  // TODO: Add post, put, delete, etc.
}

final apiClientProvider = Provider<ApiClient>((ref) {
  final conference = ref.watch(conferenceProvider);
  // Fallback to a default API URL if no conference is selected yet
  final baseUrl = conference?.apiUrl ?? 'https://default.api.example.com';

  return ApiClient(baseUrl: baseUrl);
});
