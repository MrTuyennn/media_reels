import 'package:flutter/material.dart';
import 'package:media_reels/core/app_string_routers.dart';
import 'package:media_reels/views/index.dart';

class AppRouters {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppStringRouters.SplashPage:
        return _buildPageRoute(const SplashPage(), settings);
      case AppStringRouters.LoginPage:
        return _buildPageRoute(const LoginPage(), settings);
      case AppStringRouters.HomePage:
        return _buildPageRoute(const HomePage(), settings);
      default:
        return _buildPageRoute(const NotFoundPage(), settings);
    }
  }

  static MaterialPageRoute _buildPageRoute(
      Widget page, RouteSettings? settings) {
    return MaterialPageRoute(settings: settings, builder: (context) => page);
  }
}