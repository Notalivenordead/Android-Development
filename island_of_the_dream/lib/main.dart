import 'package:flutter/material.dart';
import 'screens/browser_screen.dart';

void main() {
  runApp(const MiniBrowserApp());
}

class MiniBrowserApp extends StatelessWidget {
  const MiniBrowserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Browser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BrowserScreen(),
    );
  }
}