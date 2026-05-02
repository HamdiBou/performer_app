import '../../app/view/intro/intro.dart';
import '../../app/view/login/forgot_password.dart';
import '../../app/view/login/reset_password.dart';
import '../../app/view/signup/signup_screen.dart';
import '../../app/view/signup/verify_screen.dart';
import '../../app/view/public/public_conferences_screen.dart';
import '../../features/conferences/presentation/screens/conference_dashboard_screen.dart';
import 'package:get/get.dart';

import '../view/login/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(name: Routes.homeRoute, page: () => PublicConferencesScreen()),
    GetPage(name: Routes.introRoute, page: () => const IntroScreen()),
    GetPage(name: Routes.loginRoute, page: () => const LoginScreen()),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => const ForgotPassword(),
    ),
    GetPage(name: Routes.resetPasswordRoute, page: () => const ResetPassword()),
    GetPage(name: Routes.signUpRoute, page: () => const SignUpScreen()),
    GetPage(name: Routes.verifyRoute, page: () => const VerifyScreen()),
    GetPage(
      name: Routes.conferenceDashboardRoute,
      page: () => const ConferenceDashboardScreen(),
    ),
  ];
}
