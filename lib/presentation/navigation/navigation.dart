import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';

class Navigation {
  static const String initialRoute = HomeScreen.pageRoute;

  static final Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.pageRoute: (context) => const HomeScreen(),
  };
}
