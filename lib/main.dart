import 'package:flutter/material.dart';

import 'app.dart';
import 'core/presentation/providers/log_provider_observer.dart';

import 'core/presentation/utils/riverpod_framework.dart';

void main() async {
  runApp(
    ProviderScope(
      observers: [LogProviderObserver()],
      child: const App(),
    ),
  );
}
