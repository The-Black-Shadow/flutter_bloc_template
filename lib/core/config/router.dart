import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String splash = '/';
  // Add more routes here
}

final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) =>
          const Placeholder(), // Replace with actual Home Page
    ),
  ],
);
