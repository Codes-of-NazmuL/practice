// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:template_flutter/features/kids%20side/auth/presentation/kids_sign_up_screen.dart';
import 'package:template_flutter/features/onboarding/presentation/callin_test_screen.dart';
import 'package:template_flutter/features/onboarding/presentation/onboarding_screen.dart';
import 'package:template_flutter/features/role%20section/presentation/role_section_screeen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;
  // Main App Routes
  static const String onboardingScreen = "/OnboardingScreen";
  static const String roleSectionScreeen = "/roleSectionScreen";
  static const String kidsSignupScreen = "/kidsSignupScreen";
  static const String callinTestScreen = "/CallinTestScreen";
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes
      case Routes.onboardingScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const OnboardingScreen())
            : _FadedTransitionRoute(
                widget: const OnboardingScreen(), settings: settings);
      case Routes.roleSectionScreeen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const RoleSectionScreeen())
            : _FadedTransitionRoute(
                widget: const RoleSectionScreeen(), settings: settings);
      case Routes.kidsSignupScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const KidsSignUpScreen())
            : _FadedTransitionRoute(
                widget: const KidsSignUpScreen(), settings: settings);
      case Routes.callinTestScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const CallinTestScreen())
            : _FadedTransitionRoute(
                widget: const CallinTestScreen(), settings: settings);
      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
