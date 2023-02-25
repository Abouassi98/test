// ignore: depend_on_referenced_packages, implementation_imports
import 'package:riverpod/src/notifier.dart' as notifier;

export 'package:test/core/presentation/extensions/auto_dispose_ref_extension.dart';

///notifier update
// ignore: invalid_use_of_internal_member
mixin NotifierUpdate<T> on notifier.NotifierBase<T> {
  ///
  void update(T Function(T state) cb) => state = cb(state);
}
