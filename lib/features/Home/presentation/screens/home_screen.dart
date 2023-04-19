// ignore_for_file: lines_longer_than_80_chars
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../providers/random_color.dart';

/// home screen.
class HomeScreen extends ConsumerWidget {
  /// const constructor
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? newColor = ref.watch(randomColorProvider).toNullable();
    void randomColor() async {
      ref.listenWhile(
        randomColorProvider,
        (notifier) async {
          notifier
              .update((_) => Some(Random().nextInt(Colors.primaries.length)));
        },
      );
    }

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
