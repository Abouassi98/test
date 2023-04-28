import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'core/presentation/providers/log_provider_observer.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [LogProviderObserver()],
      child: const App(),
    ),
  );
}
