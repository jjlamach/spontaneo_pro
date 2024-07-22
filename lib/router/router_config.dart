import 'package:go_router/go_router.dart';
import 'package:spontaneo_pro/home/home_page.dart';
import 'package:spontaneo_pro/main.dart';
import 'package:spontaneo_pro/views/onboarding/finish_registration_page.dart';
import 'package:spontaneo_pro/views/onboarding/select_your_interests_page.dart';
import 'package:spontaneo_pro/views/splashscreen/splashscreen_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  redirect: (context, state) async {
    final String? token = kPreferences.getString('accessToken');
    if (token == null || token.isEmpty == true) {
      if (state.path == '/home') {
        return '/';
      }
    } else {
      return '/home';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashscreenPage(),
      routes: [
        GoRoute(
          path: 'select-your-interests',
          builder: (context, state) => const SelectYourInterestsPage(),
          routes: [
            GoRoute(
              path: 'finish-registration',
              builder: (context, state) => const FinishRegistrationPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomePage(),
        )
      ],
    )
  ],
);
