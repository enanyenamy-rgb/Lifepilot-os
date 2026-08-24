import 'package:flutter/material.dart';
import 'dart:async';

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
      supportedLocales: const [Locale('en', 'US')],
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome, Commander",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "AI Engines Operating at Full Capacity",
                style: TextStyle(color: Colors.white54, fontSize: 13),
              ),
              const SizedBox(height: 20),

              // Top Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A3B8C), Color(0xFFC24875)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Welcome to LifePilot OS - Your Ultimate AI Hub",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Active AI Engines",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Grid Engines
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildEngineCard(
                      context,
                      title: "Task Automation",
                      icon: Icons.task_alt,
                      color: Colors.blueAccent,
                    ),
                    _buildEngineCard(
                      context,
                      title: "Content Studio",
                      icon: Icons.edit_note,
                      color: Colors.pinkAccent,
                    ),
                    _buildEngineCard(
                      context,
                      title: "Document Cruncher",
                      icon: Icons.document_scanner,
                      color: Colors.amber,
                    ),
                    _buildEngineCard(
                      context,
                      title: "Code Assistant",
                      icon: Icons.code,
                      color: Colors.tealAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEngineCard(BuildContext context, {required String title, required IconData icon, required Color color}) {
    return GestureDetector(
      onTap: () {
        if (title == "Code Assistant") {
          _showCodeAssistantDialog(context);
        } else {
          _showStandardLoadingPopup(context, title);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2C),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // النافذة الخاصة بمساعد البرمجة (تفاعلية حقيقية)
  void _showCodeAssistantDialog(BuildContext context) {
    final TextEditingController promptController = TextEditingController();
    ValueNotifier<String> aiResponseNotifier = ValueNotifier<String>("Type your coding question below...");
    ValueNotifier<bool> isThinkingNotifier = ValueNotifier<bool>(false);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E2C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.code, color: Colors.tealAccent),
              SizedBox(width: 8),
              Text("Code Assistant", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ask AI to write or debug code:", style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 12),
                TextField(
                  controller: promptController,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "e.g., Write a function in Dart...",
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: const Color(0xFF0F0F1A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("AI Output:", style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F0F1A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: isThinkingNotifier,
                    builder: (context, isThinking, child) {
                      if (isThinking) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(color: Colors.tealAccent),
                          ),
                        );
                      }
                      return ValueListenableBuilder<String>(
                        valueListenable: aiResponseNotifier,
                        builder: (context, response, child) {
                          return Text(response, style: const TextStyle(color: Colors.white, fontSize: 13));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close", style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent, foregroundColor: Colors.black),
              onPressed: () {
                if (promptController.text.trim().isEmpty) return;
                isThinkingNotifier.value = true;
                
                // هنا سنقوم لاحقاً بربط الـ API الحقيقي (مثل OpenAI أو Gemini)
                // حالياً نقوم بمحاكاة ذكية للرد بعد ثوانٍ قليلة
                Timer(const Duration(seconds: 2), () {
                  aiResponseNotifier.value = "AI Generated Solution for: '${promptController.text}'\n\n// Sample Code:\nvoid main() {\n  print('Hello from LifePilot AI!');\n}";
                  isThinkingNotifier.value = false;
                });
              },
              child: const Text("Generate", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  // النافذة العادية لباقي الأيقونات مؤقتاً
  void _showStandardLoadingPopup(BuildContext context, String engineName) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E2C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(engineName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.greenAccent, size: 48),
              const SizedBox(height: 20),
              Text("$engineName is Ready & Active!", style: const TextStyle(color: Colors.white70), textAlign: TextAlign.center),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close", style: TextStyle(color: Colors.purpleAccent)),
            ),
          ],
        );
      },
    );
  }
}
