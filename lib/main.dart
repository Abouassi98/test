import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/app.dart';
import 'package:test/core/presentation/providers/log_provider_observer.dart';

void main() async {
  runApp(
    ProviderScope(
      observers: [LogProviderObserver()],
      child: const App(),
    ),
  );
}
