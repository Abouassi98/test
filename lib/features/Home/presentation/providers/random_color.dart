

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';

part 'random_color.g.dart';

/// random color provider
@riverpod
class RandomColor extends _$RandomColor with NotifierUpdate {
  @override
  Option<int> build() => const None();
}

