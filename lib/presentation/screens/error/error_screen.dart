import 'package:flutter/material.dart';

import '../../../core/constants/app_paddings.dart';

class ErrorScreen extends StatelessWidget {
  static const String pageRoute = '/error';

  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ooops!\nSomething went wrong...',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppPaddings.big),
            Text(
              "try again later, we'll try to fix it!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
