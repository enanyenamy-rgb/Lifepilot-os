import 'package:flutter/material.dart';

void main() {
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatelessWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot OS'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في منصة LifePilot OS الذكية',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
