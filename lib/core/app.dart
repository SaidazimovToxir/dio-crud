import 'package:flutter/material.dart';

import '../ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const HomeScreen(),
    );
  }
}
