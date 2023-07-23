import 'package:confess/app/view/app.dart';
import 'package:confess/screen/dashboard/screen/dashboard_screen.dart';
import 'package:confess/screen/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

// GoRouter configuration
final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: alice.getNavigatorKey(),
  initialLocation: SplashScreen.routeName,
  restorationScopeId: 'confess',
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const ResponsiveBox(widget: SplashScreen()),
    ),
    GoRoute(
      path: DashboardScreen.routeName,
      builder: (context, state) => const ResponsiveBox(
        widget: DashboardScreen(),
      ),
    ),
  ],
);

class ResponsiveBox extends StatelessWidget {
  const ResponsiveBox({
    required this.widget,
    super.key,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1980,
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(
          context,
          conditionalValues: [
            const Condition.equals(name: MOBILE, value: 450),
            const Condition.between(start: 800, end: 1100, value: 800),
            const Condition.between(start: 1000, end: 1980, value: 1000),
          ],
        ).value,
        child: BouncingScrollWrapper.builder(
          context,
          widget,
          dragWithMouse: true,
        ),
      ),
    );
  }
}
