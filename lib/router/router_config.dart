import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/views/onboarding/onboarding_page.dart';
import 'package:spontaneo_pro/views/splashscreen/splashscreen_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashscreenPage(),
      routes: [
        GoRoute(
          path: 'onboarding',
          builder: (context, state) => const OnBoardingPage(),
        ),
      ],
    )
  ],
);
