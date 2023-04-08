import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          return const Text('data');
        },
      )
    ]);
