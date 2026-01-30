import 'package:flutter/material.dart';
import '../../features/auth/pages/forgot_password_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/signup_page.dart';
import '../../features/auth/pages/welcome_page.dart';
import '../../features/splash/pages/splash_page.dart';
import '../../shared/layouts/main_shell.dart';
import 'app_routes.dart';

Route<dynamic> controlRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (_) => const WelcomePage());
    case AppRoutes.onboarding:
      return MaterialPageRoute(builder: (_) => const WelcomePage());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginPage());

    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => const SignupPage());

    case AppRoutes.forgotPassword:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());

    case AppRoutes.marketplace:
      return MaterialPageRoute(
        builder: (_) => const MainShell(initialIndex: 0),
      );

    case AppRoutes.search:
      return MaterialPageRoute(
        builder: (_) => const MainShell(initialIndex: 1),
      );

    case AppRoutes.sell:
      return MaterialPageRoute(
        builder: (_) => const MainShell(initialIndex: 2),
      );

    case AppRoutes.community:
      return MaterialPageRoute(
        builder: (_) => const MainShell(initialIndex: 3),
      );

    case AppRoutes.profile:
      return MaterialPageRoute(
        builder: (_) => const MainShell(initialIndex: 4),
      );

    default:
      return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}
