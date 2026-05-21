import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:test_login/core/network/api_client.dart';
import 'package:test_login/base/pref_data.dart';
import '../../domain/entities/user.dart';

/// Data source for authentication.
abstract class AuthDataSource {
  Future<User?> signInWithGoogle();
  Future<User?> signInWithEmail(
    String email,
    String password,
    String conferenceId,
  );
  Future<void> signOut();
  Future<User?> getCurrentUser();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final GoogleSignIn _googleSignIn;
  final ApiClient _apiClient;

  AuthDataSourceImpl(this._googleSignIn, this._apiClient);

  @override
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Send the idToken to your server for verification and session creation
    final response = await _apiClient.post(
      'auth/google-signin',
      data: {
        'idToken': googleAuth.idToken,
        'accessToken': googleAuth.accessToken,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final user = User.fromJson(data['user']);
      final token = data['token'] as String;

      // Persist locally
      await PrefData.setAuthToken(token);
      await PrefData.setUser(jsonEncode(user.toJson()));
      await PrefData.setIsSignIn(true);

      return user;
    } else {
      throw Exception('Server authentication failed');
    }
  }

  @override
  Future<User?> signInWithEmail(
    String email,
    String password,
    String conferenceId,
  ) async {
    final response = await _apiClient.post(
      'conferences/$conferenceId/login',
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      final user = User.fromJson(data['user']);
      final token = data['token'] as String;

      // Persist locally
      await PrefData.setAuthToken(token);
      await PrefData.setUser(jsonEncode(user.toJson()));
      await PrefData.setIsSignIn(true);

      return user;
    } else {
      throw Exception('Login failed with status: ${response.statusCode}');
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await PrefData.clearAuth();
  }

  @override
  Future<User?> getCurrentUser() async {
    final userJson = await PrefData.getUser();
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}
