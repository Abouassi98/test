part of '../utils/riverpod_framework.dart';

extension WidgetRefExtension on WidgetRef {
  

  /// Keep listening to [AutoDisposeNotifierProvider] until a Future function is complete.
  ///
  /// This method should be called asynchronously, like inside an onPressed.
  /// It shouldn't be used directly inside the build method.
  ///
  /// This is primarily used to preserve the state of the provider when navigating
  /// to a route until that route is popped off.
  Future<void> listenWhile<NotifierT extends AutoDisposeNotifier<T>, T>(
    AutoDisposeNotifierProvider<NotifierT, T> provider,
    Future<void> Function(NotifierT notifier) cb,
  ) async {
    final sub = listenManual(provider, (_, __) {});
    try {
      return await cb(read(provider.notifier));
    } finally {
      sub.close();
    }
  }
}
