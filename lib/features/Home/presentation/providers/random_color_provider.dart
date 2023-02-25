import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/core/presentation/providers/notifier_update.dart';
import 'package:test/core/presentation/utils/functional.dart';

part 'random_color_provider.g.dart';

/// random color provider
@riverpod
class RandomColorProvider extends _$RandomColorProvider with NotifierUpdate {
  @override
  Option<int> build() => const None();
}

/// new color
@riverpod
Option<int> newColor(NewColorRef ref) {
  final selectedColor = ref.watch(newColorProvider);
  // ignore: newline-before-return
  return selectedColor.match(
    () => const None(),
    (t) => Option<int>.fromNullable(Random().nextInt(t)),
  );
}
