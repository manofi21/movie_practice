import 'package:flutter/material.dart';

import '../entities/movie_entities.dart';
import '../main.dart';
import '../presentation/detail/detail_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Mendapatkan nama rute dan argumen jika ada
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/detail':
        if (args is MovieEntities) {
          return MaterialPageRoute(
            builder: (_) => DetailPage(movieEntities: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => Container());
  }
}