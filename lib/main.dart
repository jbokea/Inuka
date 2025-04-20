import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const FlashApp());
}

class FlashApp extends StatelessWidget {
  const FlashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}
