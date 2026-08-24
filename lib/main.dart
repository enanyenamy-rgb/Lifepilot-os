import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// ضع مفتاح الـ API الخاص بـ Gemini هنا (مؤقتاً أو مفتاحك الحقيقي)
const String apiKey = "AIzaSyYourActualApiKeyHerePlaceholder";

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
        if (title == "Task Automation") {
          _showAiStudioDialog(context, title, Colors.blueAccent, "Suggest an automation script for: ");
        } else if (title == "Content Studio") {
          _showAiStudioDialog(context, title, Colors.pinkAccent, "Write engaging content about: ");
        } else if (title == "Document Cruncher") {
          _showAiStudioDialog(context, title, Colors.amber, "Summarize and extract key insights from: ");
        } else if (title == "Code Assistant") {
          _showAiStudioDialog(context, title, Colors.tealAccent, "Write clean code or debug for: ");
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

  // دالة موحدة ذكية تتصل بـ Generative AI (Gemini)
  void _showAiStudioDialog(BuildContext context, String engineName, Color themeColor, String promptPrefix) {
    final TextEditingController inputController = TextEditingController();
    ValueNotifier<String> outputNotifier = ValueNotifier<String>("Enter your prompt and tap Generate...");
    ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E2C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.auto_awesome, color: themeColor),
              const SizedBox(width: 8),
              Text(engineName, style: const TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Command $engineName AI:", style: const TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 12),
                TextField(
                  controller: inputController,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Type what you need...",
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: const Color(0xFF0F0F1A),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("AI Response:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 150),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFF0F0F1A), borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: loadingNotifier,
                      builder: (context, loading, child) {
                        if (loading) {
                          return Center(child: CircularProgressIndicator(color: themeColor));
                        }
                        return ValueListenableBuilder<String>(
                          valueListenable: outputNotifier,
                          builder: (context, res, child) => Text(res, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                        );
                      },
                    ),
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
              style: ElevatedButton.styleFrom(backgroundColor: themeColor, foregroundColor: Colors.black),
              onPressed: () async {
                String userInput = inputController.text.trim();
                if (userInput.isEmpty) return;

                loadingNotifier.value = true;
                outputNotifier.value = "AI is thinking...";

                try {
                  final model = GenerativeModel(
                    model: 'gemini-1.5-flash',
                    apiKey: apiKey,
                  );

                  final prompt = "$promptPrefix $userInput";
                  final response = await model.generateContent([Content.text(prompt)]);

                  outputNotifier.value = response.text ?? "No response generated.";
                } catch (e) {
                  outputNotifier.value = "Error connecting to Generative AI. Please check API Key.\nDetails: $e";
                } finally {
                  loadingNotifier.value = false;
                }
              },
              child: const Text("Generate", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
