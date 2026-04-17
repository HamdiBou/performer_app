import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/domain/providers/auth_provider.dart';
import '../../features/conference/domain/providers/conference_provider.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  final selectedConference = ref.watch(conferenceProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuth = authState == AuthState.authenticated;
      final isLoggingIn = state.uri.path == '/login';
      final hasSelectedConference = selectedConference != null;
      final isSelectingConference = state.uri.path == '/select-conference';

      // 1. If not authenticated and not already on the login page -> /login
      if (!isAuth && !isLoggingIn) {
        return '/login';
      }

      // 2. If authenticated, but hasn't selected a conference -> /select-conference
      if (isAuth && !hasSelectedConference && !isSelectingConference) {
        return '/select-conference';
      }

      // 3. If authenticated & selected conference, but trying to access login or select -> /
      if (isAuth &&
          hasSelectedConference &&
          (isLoggingIn || isSelectingConference)) {
        return '/';
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Login Screen Placeholder')),
        ),
      ),
      GoRoute(
        path: '/select-conference',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Select Conference Screen Placeholder')),
        ),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Home / Dashboard Placeholder')),
        ),
      ),
    ],
  );
});
