import '../../app/view/create_event/create_event_screen.dart';
import '../../app/view/featured_event/buy_ticket.dart';
import '../../app/view/featured_event/feature_event_list.dart';
import '../../app/view/featured_event/featured_event_detail.dart';
import '../../app/view/featured_event/payment.dart';
import '../../app/view/home/home_screen.dart';
import '../../app/view/intro/intro.dart';
import '../../app/view/login/forgot_password.dart';
import '../../app/view/login/reset_password.dart';
import '../../app/view/my_card/edit_card_screen.dart';
import '../../app/view/my_card/my_card_screen.dart';
import '../../app/view/notification/notification_screen.dart';
import '../../app/view/profile/edit_profile.dart';
import '../../app/view/select_interset/select_interest_screen.dart';
import '../../app/view/setting/help_screen.dart';
import '../../app/view/setting/privacy_screen.dart';
import '../../app/view/setting/setting_screen.dart';
import '../../app/view/signup/select_country_screen.dart';
import '../../app/view/signup/signup_screen.dart';
import '../../app/view/signup/verify_screen.dart';
import '../../app/view/public/public_conferences_screen.dart';
import '../../app/view/ticket/ticket_detail.dart';
import '../../app/view/trending/trending_screen.dart';
import 'package:get/get.dart';

import '../view/login/login_screen.dart';

import '../view/popular_event/popular_event_list.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(name: Routes.homeRoute, page: () => PublicConferencesScreen()),
    GetPage(name: Routes.introRoute, page: () => const IntroScreen()),
    GetPage(name: Routes.loginRoute, page: () => const LoginScreen()),
    GetPage(name: Routes.homeScreenRoute, page: () => const HomeScreen()),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => const ForgotPassword(),
    ),
    GetPage(name: Routes.resetPasswordRoute, page: () => const ResetPassword()),
    GetPage(name: Routes.signUpRoute, page: () => const SignUpScreen()),
    GetPage(
      name: Routes.selectCountryRoute,
      page: () => const SelectCountryScreen(),
    ),
    GetPage(name: Routes.verifyRoute, page: () => const VerifyScreen()),
    GetPage(
      name: Routes.selectInterestRoute,
      page: () => const SelectInterestScreen(),
    ),
    GetPage(
      name: Routes.trendingScreenRoute,
      page: () => const TrendingScreen(),
    ),
    GetPage(
      name: Routes.featuredEventDetailRoute,
      page: () => const FeaturedEventDetail(),
    ),
    GetPage(name: Routes.buyTicketRoute, page: () => const BuyTicket()),
    GetPage(name: Routes.paymentRoute, page: () => const PaymentScreen()),
    GetPage(
      name: Routes.createEventRoute,
      page: () => const CreateEventScreen(),
    ),
    GetPage(name: Routes.ticketDetailRoute, page: () => const TicketDetail()),
    GetPage(name: Routes.settingRoute, page: () => const SettingScreen()),
    GetPage(name: Routes.editProfileRoute, page: () => const EditProfile()),
    GetPage(
      name: Routes.notificationScreenRoute,
      page: () => const NotificationScreen(),
    ),
    GetPage(name: Routes.myCardScreenRoute, page: () => const MyCardScreen()),
    GetPage(
      name: Routes.editCardScreenRoute,
      page: () => const EditCardScreen(),
    ),
    GetPage(name: Routes.privacyScreenRoute, page: () => const PrivacyScreen()),
    GetPage(name: Routes.helpScreenRoute, page: () => const HelpScreen()),
    GetPage(
      name: Routes.featureEventListRoute,
      page: () => const FeatureEventList(),
    ),
    GetPage(
      name: Routes.popularEventListRoute,
      page: () => const PopularEventList(),
    ),
  ];
}
