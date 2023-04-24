import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/random_index.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(randomIndexProvider);
    return Scaffold(
      backgroundColor: Colors.primaries[index],
      body: InkWell(
        onTap: () => ref
            .watch(randomIndexProvider.notifier)
            .update((_) => Random().nextInt(Colors.primaries.length)),
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
