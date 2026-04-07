import '../../base/pref_data.dart';

class ApiConfig {
  // TODO: ADD API KEYS AND URLS HERE
  static String baseUrl = 'https://192.168.100.212:8000/api';

  static Future<void> init() async {
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

  static const String conferencesEndpoint = '/conferences';
  static const String googleClientId =
      '908043888724-uua5c2680grj7hic3ghpo661860vo634.apps.googleusercontent.com';
  static const String microsoftClientId = 'YOUR_MICROSOFT_CLIENT_ID';
}
