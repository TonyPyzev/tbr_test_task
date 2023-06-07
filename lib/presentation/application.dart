import 'package:flutter/material.dart';

import 'navigation/navigation.dart';
import 'theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'TBR test task';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: AppTheme().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Navigation.initialRoute,
      routes: Navigation.routes,
    );
  }
}
