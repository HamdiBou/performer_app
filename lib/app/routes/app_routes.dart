abstract class Routes {
  static const homeRoute = Paths.homePath;
  static const introRoute = Paths.introPath;
  static const loginRoute = Paths.loginPath;
  static const forgotPasswordRoute = Paths.forgotPasswordPath;
  static const resetPasswordRoute = Paths.resetPasswordPath;
  static const signUpRoute = Paths.signUpPath;
  static const verifyRoute = Paths.verifyPath;
  static const conferenceDashboardRoute = Paths.conferenceDashboardPath;
}

abstract class Paths {
  static const homePath = "/";
  static const introPath = "/IntroScreen";
  static const loginPath = "/LoginScreen";
  static const forgotPasswordPath = "/ForgotPassword";
  static const resetPasswordPath = "/ResetPassword";
  static const signUpPath = "/SignUpScreen";
  static const verifyPath = "/VerifyScreen";
  static const conferenceDashboardPath = "/ConferenceDashboard";
}
