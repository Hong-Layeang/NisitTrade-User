import 'package:flutter/material.dart';
import '../../features/auth/pages/forgot_password_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/signup_page.dart';
import '../../features/auth/pages/welcome_page.dart';
import '../../features/community/pages/community_page.dart';
import '../../features/marketplace/pages/marketplace_page.dart';
import '../../features/marketplace/widgets/marketplace_app_bar.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/search/pages/search_page.dart';
import '../../features/sell/pages/sell_page.dart';
import '../../features/splash/pages/splash_page.dart';
import '../../shared/layouts/main_layouts.dart';
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
        builder: (_) => const MainLayout(
          currentNavIndex: 0,
          appBar: MarketplaceAppBar(chatBadgeCount: 6),
          child: MarketplacePage(),
        ),
      );

    case AppRoutes.search:
      return MaterialPageRoute(
        builder: (_) =>
            const MainLayout(currentNavIndex: 1, child: SearchPage()),
      );

    case AppRoutes.sell:
      return MaterialPageRoute(
        builder: (_) => MainLayout(
          currentNavIndex: 2,
          appBar: const SellAppBar(),
          child: SellPage(),
        ),
      );

    case AppRoutes.community:
      return MaterialPageRoute(
        builder: (_) =>
            const MainLayout(currentNavIndex: 3, child: CommunityPage()),
      );

    case AppRoutes.profile:
      return MaterialPageRoute(
        builder: (_) =>
            const MainLayout(currentNavIndex: 4, child: ProfilePage()),
      );

    default:
      return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}
