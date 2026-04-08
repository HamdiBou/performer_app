import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.example.event_app";

  static String isIntro = "${prefName}isIntro";
  static String inSignIn = "${prefName}isSignIn";
  static String isSelect = "${prefName}isSelect";
  static String baseUrlKey = "${prefName}baseUrl";
  static String selectedConferenceIdKey = "${prefName}selectedConferenceId";
  static String selectedConferenceNameKey = "${prefName}selectedConferenceName";

  static Future<void> setBaseUrl(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(baseUrlKey, url);
  }

  static Future<String?> getBaseUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(baseUrlKey);
  }

  static setIsIntro(bool sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isIntro, sizes);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool intValue = prefs.getBool(isIntro) ?? true;
    return intValue;
  }

  static getIsSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(inSignIn) ?? false;
  }

  static setIsSignIn(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(inSignIn, isFav);
  }

  static getSelectInterest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isSelect) ?? false;
  }

  static setSelectInterest(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isSelect, isFav);
  }

  static Future<void> setSelectedConference(
    String conferenceId,
    String conferenceName,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedConferenceIdKey, conferenceId);
    await prefs.setString(selectedConferenceNameKey, conferenceName);
  }

  static Future<String?> getSelectedConferenceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedConferenceIdKey);
  }

  static Future<String?> getSelectedConferenceName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedConferenceNameKey);
  }

  static Future<void> clearSelectedConference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(selectedConferenceIdKey);
    await prefs.remove(selectedConferenceNameKey);
  }
}
