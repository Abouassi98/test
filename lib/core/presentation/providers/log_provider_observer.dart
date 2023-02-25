// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

///provider observer
class LogProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('DidUpdateProvider: [${provider.name ?? provider.runtimeType}] value: $newValue');
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('ProviderDidFail: [${provider.name ?? provider.runtimeType}] error: $error stackTrace: $stackTrace');
  }
}
