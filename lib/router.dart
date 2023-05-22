import 'package:go_router/go_router.dart';

import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';

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
        path: '/',
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomeScreen();
        },
      )
    ]);
