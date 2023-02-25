// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:test/core/presentation/utils/functional.dart';

import 'package:test/features/providers/random_color_provider.dart';

/// home screen.
class HomeScreen extends HookConsumerWidget {
  /// const constructor
  const HomeScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newColor = ref.watch(randomColorProviderProvider).toNullable();
    final randomColor = useCallback(
      () async {
        final sub =
            // ignore: no-empty-block
            ref.listenManual(randomColorProviderProvider, (prev, value) {});
        ref.read(randomColorProviderProvider.notifier).update(
              (state) => Some(Random().nextInt(Colors.primaries.length)),
            );
        debugPrint(sub.toString());
      },
      [],
    );

    ///build
    return Scaffold(
      backgroundColor:
          newColor != null ? Colors.primaries[newColor] : Colors.white,
      body: InkWell(
        onTap: randomColor,
        child: const Center(
          child: Text(
            'Hey there',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
///Colors primaries don't include black color so the color of the text is a default color of black
