import '../../base/pref_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static late String baseUrl;

  static Future<void> init() async {
    // Load environment variables from .env file
    await dotenv.load();

    // Initialize baseUrl from .env or use default
    baseUrl = dotenv.env['BASE_URL'] ?? 'https://192.168.100.212:8000/api';

    String? storedUrl = await PrefData.getBaseUrl();
    if (storedUrl != null && storedUrl.isNotEmpty) {
      setDynamicUrl(storedUrl);
    }
  }

  static void setDynamicUrl(String url) {
    if (url.endsWith('/')) {
      baseUrl = '${url}api';
    } else {
      baseUrl = '$url/api';
    }
  }

  static String get conferencesEndpoint =>
      dotenv.env['CONFERENCES_ENDPOINT'] ?? '/conferences';
  static String get googleClientId => dotenv.env['GOOGLE_CLIENT_ID'] ?? '';
  static String get microsoftClientId =>
      dotenv.env['MICROSOFT_CLIENT_ID'] ?? '';
}
