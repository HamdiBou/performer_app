import '../../base/pref_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static late String baseUrl; // Real API URL for authentication
  static late String conferenceUrl; // Conference-specific URL
  static late String googleClientId; // Google OAuth Client ID
  static late String
  googleServerClientId; // Google OAuth Server Client ID (for Android)
  static late String groqApiKey; // Groq API Key
  static late String groqBaseUrl; // Groq API Base URL

  static Future<void> init() async {
    print('🔧 Starting API Config initialization...');
    try {
      // Load .env from assets using rootBundle
      final envContent = await rootBundle.loadString('.env');
      print('📄 .env file loaded successfully from assets');

      // Parse the .env content manually into a Map
      Map<String, String> envVars = {};
      final lines = envContent.split('\n');
      for (var line in lines) {
        line = line.trim();
        if (line.isNotEmpty && line.contains('=') && !line.startsWith('#')) {
          final parts = line.split('=');
          if (parts.length == 2) {
            final key = parts[0].trim();
            var value = parts[1].trim();
            // Remove quotes if present
            if (value.startsWith('"') && value.endsWith('"')) {
              value = value.substring(1, value.length - 1);
            }
            if (value.startsWith("'") && value.endsWith("'")) {
              value = value.substring(1, value.length - 1);
            }
            envVars[key] = value;
            print('   ✓ Loaded: $key = $value');
          }
        }
      }

      // Get BASE_URL from our parsed map
      String? envBaseUrl = envVars['BASE_URL'];
      print('🔍 BASE_URL from .env: $envBaseUrl');

      // Get GOOGLE_CLIENT_ID from our parsed map
      String? envGoogleClientId = envVars['GOOGLE_CLIENT_ID'];
      print('🔍 GOOGLE_CLIENT_ID from .env: $envGoogleClientId');

      // Get GOOGLE_SERVER_CLIENT_ID from our parsed map
      String? envGoogleServerClientId = envVars['GOOGLE_SERVER_CLIENT_ID'];
      print('🔍 GOOGLE_SERVER_CLIENT_ID from .env: $envGoogleServerClientId');

      // Initialize baseUrl from .env or use default
      baseUrl = envBaseUrl ?? 'http://192.168.100.212:8000/api';
      googleClientId = envGoogleClientId ?? '';
      googleServerClientId = envGoogleServerClientId ?? '';
      groqApiKey = envVars['GROQ_API_KEY'] ?? '';
      groqBaseUrl =
          envVars['GROQ_BASE_URL'] ?? 'https://api.groq.com/openai/v1';

      print('✅ API Config Initialized');
      print('📍 Base URL: $baseUrl');
      print(
        '🔑 Groq API Key loaded: ${groqApiKey.isNotEmpty ? "✅ Yes (${groqApiKey.substring(0, 10)}...)" : "❌ No"}',
      );
      print('🌐 Groq Base URL: $groqBaseUrl');

      // Initialize conferenceUrl to be same as baseUrl by default
      conferenceUrl = baseUrl;

      String? storedConferenceUrl = await PrefData.getBaseUrl();
      if (storedConferenceUrl != null && storedConferenceUrl.isNotEmpty) {
        setConferenceUrl(storedConferenceUrl);
      }
    } catch (e, stackTrace) {
      print('❌ API Config Error: $e');
      print('Stack trace: $stackTrace');
      // Set default values if .env loading fails
      baseUrl = 'http://192.168.100.212:8000/api';
      conferenceUrl = baseUrl;
      print('⚠️ Using default URL: $baseUrl');
    }
  }

  static void setConferenceUrl(String url) {
    if (url.endsWith('/')) {
      conferenceUrl = '${url}api';
    } else {
      conferenceUrl = '$url/api';
    }
    print('Conference URL set to: $conferenceUrl');
  }

  @deprecated
  static void setDynamicUrl(String url) {
    // Deprecated: use setConferenceUrl instead
    setConferenceUrl(url);
  }

  static String get conferencesEndpoint =>
      dotenv.env['CONFERENCES_ENDPOINT'] ?? '/conferences';
  static String get microsoftClientId =>
      dotenv.env['MICROSOFT_CLIENT_ID'] ?? '';
}
