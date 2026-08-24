import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      home: Scaffold(
        appBar: AppBar(title: const Text('LifePilot OS')),
        body: const Center(child: Text('Welcome to LifePilot OS!')),
      ),
    );
  }
}
