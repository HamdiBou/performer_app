import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState { initial, unauthenticated, authenticated }

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Determine initial state based on secure storage or cache
    return AuthState.unauthenticated;
  }

  Future<void> login(String username, String password) async {
    // TODO: Implement actual login logic via repository/API
    state = AuthState.authenticated;
  }

  Future<void> loginAsGuest() async {
    // Guest authentication for demo conference
    // In a real app, this might fetch a guest token from the backend
    state = AuthState.authenticated;
  }

  void logout() {
    state = AuthState.unauthenticated;
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
