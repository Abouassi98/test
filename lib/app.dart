import 'package:flutter/material.dart';

import 'package:test/features/Home/presentation/screens/home_screen.dart';

/// A good thing.
class App extends StatelessWidget {
  /// A good thing.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
