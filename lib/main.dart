import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // للتحكم بالنسخ إلى الحافظة
import 'dart:async';

void main() {
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatefulWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  State<LifePilotApp> createState() => _LifePilotAppState();
}

class _LifePilotAppState extends State<LifePilotApp> {
  String _currentLanguage = 'English';

  void _changeLanguage(String lang) {
    setState(() {
      _currentLanguage = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
      ),
      home: HomeScreen(
        currentLanguage: _currentLanguage,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String currentLanguage;
  final Function(String) onLanguageChanged;

  HomeScreen({
    Key? key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  }) : super(key: key);

  final List<String> _languages = const [
    'English', 'Arabic (العربية)', 'Spanish (Español)', 'French (Français)',
    'German (Deutsch)', 'Chinese (中文)', 'Japanese (日本語)', 'Russian (Русский)',
    'Portuguese (Português)', 'Italian (Italiano)', 'Korean (한국어)', 'Turkish (Türkçe)',
    'Hindi (हिन्दी)', 'Urdu (اردو)', 'Dutch (Nederlands)', 'Polish (Polski)',
    'Swedish (Svenska)', 'Greek (Ελληνικά)', 'Vietnamese (Tiếng Việt)', 'Thai (ไทย)',
    'Indonesian (Bahasa)', 'Malay (Melayu)', 'Romanian (Română)', 'Czech (Čeština)', 'Hungarian (Magyar)'
  ];

  @override
  Widget build(BuildContext context) {
    bool isArabic = currentLanguage.contains('Arabic');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صف الترحيب وقائمة اللغات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic ? "أهلاً بك، أيها القائد" : "Welcome, Commander",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isArabic ? "محركات الذكاء الاصطناعي تعمل بأقصى طاقة" : "AI Engines Operating at Full Capacity",
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E2C),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: DropdownButton<String>(
                      value: currentLanguage,
                      dropdownColor: const Color(0xFF1E1E2C),
                      icon: const Icon(Icons.language, color: Colors.tealAccent, size: 20),
                      underline: const SizedBox(),
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                      items: _languages.map((String lang) {
                        return DropdownMenuItem<String>(
                          value: lang,
                          child: Text(lang, style: const TextStyle(color: Colors.white, fontSize: 12)),
                        );
                      }).toList(),
                      onChanged: (String? newLang) {
                        if (newLang != null) {
                          onLanguageChanged(newLang);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Top Banner بلمسة بصرية مرئية
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4A3B8C), Color(0xFFC24875)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        isArabic 
                          ? "مرحباً بك في LifePilot OS - مركزك العالمي للذكاء الاصطناعي ($currentLanguage)"
                          : "Welcome to LifePilot OS - Your Ultimate AI Hub ($currentLanguage)",
                        style: const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                isArabic ? "محركات الذكاء الاصطناعي النشطة" : "Active AI Engines",
                style: const TextStyle(
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
                    _buildEngineCard(context, title: "Task Automation", icon: Icons.task_alt, color: Colors.blueAccent),
                    _buildEngineCard(context, title: "Content Studio", icon: Icons.edit_note, color: Colors.pinkAccent),
                    _buildEngineCard(context, title: "Document Cruncher", icon: Icons.document_scanner, color: Colors.amber),
                    _buildEngineCard(context, title: "Code Assistant", icon: Icons.code, color: Colors.tealAccent),
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
        _showAdvancedAiDialog(context, title, color);
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

  // نافذة تفاعلية مطورة تشمل الأوامر السريعة وأزرار النسخ والمشاركة
  void _showAdvancedAiDialog(BuildContext context, String engineName, Color themeColor) {
    final TextEditingController inputController = TextEditingController();
    ValueNotifier<String> outputNotifier = ValueNotifier<String>("Select a quick prompt or type below...");
    ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);

    // أمثلة لأوامر سريعة جاهزة لكل محرك (Quick Prompts Library)
    List<String> quickPrompts = [];
    if (engineName == "Task Automation") {
      quickPrompts = ["Clean cache files", "Backup daily database", "Optimize battery usage"];
    } else if (engineName == "Content Studio") {
      quickPrompts = ["Write tech startup post", "Create catchy YouTube title", "Draft weekly newsletter"];
    } else if (engineName == "Document Cruncher") {
      quickPrompts = ["Summarize financial PDF", "Extract legal clauses", "Scan invoice details"];
    } else {
      quickPrompts = ["Write a Dart function", "Debug null-safety error", "Create API request"];
    }

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
                const Text("Quick Prompts (Tap to apply):", style: TextStyle(color: Colors.white54, fontSize: 11)),
                const SizedBox(height: 6),
                // شريط الأوامر السريعة الجاهزة
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: quickPrompts.map((prompt) {
                    return ActionChip(
                      backgroundColor: const Color(0xFF0F0F1A),
                      label: Text(prompt, style: const TextStyle(color: Colors.white70, fontSize: 10)),
                      onPressed: () {
                        inputController.text = prompt;
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: inputController,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: "Type or select a prompt...",
                    hintStyle: const TextStyle(color: Colors.white38),
                    filled: true,
                    fillColor: const Color(0xFF0F0F1A),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    const Text("AI Output & Export:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    // أزرار النسخ والمشاركة السريعة (Export Hub)
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy, size: 16, color: Colors.tealAccent),
                          tooltip: "Copy Output",
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: outputNotifier.value));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Copied to clipboard!"), duration: Duration(seconds: 1)),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.share, size: 16, color: Colors.blueAccent),
                          tooltip: "Share Result",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Sharing features ready!"), duration: Duration(seconds: 1)),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 130),
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
                          builder: (context, res, child) => Text(res, style: const TextStyle(color: Colors.white70, fontSize: 12)),
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
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: const Text("Close", style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: themeColor, foregroundColor: Colors.black),
              onPressed: () {
                String userInput = inputController.text.trim();
                if (userInput.isEmpty) return;

                loadingNotifier.value = true;
                outputNotifier.value = "AI is processing your request...";

                Timer(const Duration(seconds: 2), () {
                  outputNotifier.value = "Generated result for: '$userInput'\n\n[Status]: Executed successfully with optimal AI parameters! 🚀";
                  loadingNotifier.value = false;
                });
              },
              child: const Text("Generate", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
