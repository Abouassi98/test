import 'package:flutter/material.dart';
import 'features/Home/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      home: const TestTask(),
    );
  }
}
