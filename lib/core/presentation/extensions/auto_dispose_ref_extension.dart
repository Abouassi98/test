import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// auto Dispose Ref Extension
extension AutoDisposeRefExtension on AutoDisposeRef {
  // When invoked keeps your provider alive for [duration]
  ///cache
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, () => link.close());
    onDispose(() => timer.cancel());
  }
}
