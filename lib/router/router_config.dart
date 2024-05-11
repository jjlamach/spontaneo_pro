import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/views/onboarding/select_your_interests_page.dart';
import 'package:spontaneo_pro/views/splashscreen/splashscreen_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashscreenPage(),
      routes: [
        GoRoute(
          path: 'select-your-interests',
          builder: (context, state) => const SelectYourInterestsPage(),
        ),
      ],
    )
  ],
);
