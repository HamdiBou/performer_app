import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:test_login/features/auth/presentation/pages/login_page.dart';
import 'package:test_login/features/conferences/presentation/bloc/conference_bloc.dart';
import 'package:test_login/features/conferences/domain/entities/conference.dart';
import 'package:test_login/features/conferences/presentation/pages/select_conference_page.dart';
import 'package:test_login/features/conference_shell/presentation/pages/conference_shell_page.dart';
import 'package:test_login/app/view/public/public_conferences_screen.dart';

@lazySingleton
class AppRouter {
  final AuthBloc authBloc;
  final ConferenceBloc conferenceBloc;

  AppRouter(this.authBloc, this.conferenceBloc);

  GoRouter get router => GoRouter(
    initialLocation: '/public',
    refreshListenable: _MultiRefreshListenable([authBloc, conferenceBloc]),
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final conferenceState = context.read<ConferenceBloc>().state;

      final isAuth = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      final isLoggingIn = state.uri.path == '/login';
      final isOnPublicPage = state.uri.path == '/public';
      final isSelectingConference = state.uri.path == '/select-conference';

      Conference? selectedConference = conferenceState.maybeWhen(
        loaded: (_, selected) => selected,
        orElse: () => null,
      );

      final hasSelectedConference = selectedConference != null;
      final isDemoMode = selectedConference?.isDemo ?? false;

      // 1. If we are on public page, let them stay there unless they selected something
      if (isOnPublicPage) {
        if (hasSelectedConference) {
          if (isDemoMode || isAuth) {
            return '/';
          } else {
            return '/login';
          }
        }
        return null;
      }

      // 2. If not authenticated and not in demo mode, must login
      if (!isAuth && !isDemoMode) {
        if (!isLoggingIn) return '/login';
        return null;
      }

      // 3. If authenticated or in demo mode, but no conference selected, must select one (or go back to public)
      if ((isAuth || isDemoMode) && !hasSelectedConference) {
        if (!isSelectingConference && !isOnPublicPage) return '/public';
        return null;
      }

      // 4. If everything is ready but user is on login or selection page, go to home
      if ((isAuth || isDemoMode) && hasSelectedConference) {
        if (isLoggingIn || isSelectingConference || isOnPublicPage) return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/public',
        builder: (context, state) => PublicConferencesScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/select-conference',
        builder: (context, state) => const SelectConferencePage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const ConferenceShellPage(),
      ),
    ],
  );
}

class _MultiRefreshListenable extends ChangeNotifier {
  _MultiRefreshListenable(List<BlocBase> blocs) {
    for (var bloc in blocs) {
      _subscriptions.add(bloc.stream.listen((_) => notifyListeners()));
    }
  }

  final List<dynamic> _subscriptions = [];

  @override
  void dispose() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
    super.dispose();
  }
}
