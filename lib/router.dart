import 'package:go_router/go_router.dart';

import 'screens/error/error_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/pages/events_example.dart';

final GoRouter route = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    if ('state author' == 'true') {
      return '/home';
    }
    return null;
  },
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) {
        return TableEventsExample();
      },
    )
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
