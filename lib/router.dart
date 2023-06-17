import 'package:go_router/go_router.dart';
import 'package:meeting_room_calender/screens/home/edit_calendar_screen.dart';

import 'screens/error/error_screen.dart';
import 'screens/home/add_calendar_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/management/management_request_screen.dart';
import 'screens/management/management_screen.dart';

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
        return HomeScreen();
      },
    ),
    GoRoute(
      name: 'management_request',
      path: '/management_request',
      builder: (context, state) {
        return ManagementRequestScreen();
      },
    ),
    GoRoute(
      name: 'management',
      path: '/management',
      builder: (context, state) {
        return ManagementScreen();
      },
    ),
    GoRoute(
      name: 'addcalendar',
      path: '/addcalendar',
      builder: (context, state) {
        return AddCalendarScreen();
      },
    ),
    GoRoute(
      name: 'editcalendar',
      path: '/editcalendar',
      builder: (context, state) {
        return EditCalendarScreen();
      },
    )
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
