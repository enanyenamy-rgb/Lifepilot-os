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
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
      ),
      home: const LoginScreen(),
    );
  }
}

// 1. شاشة تسجيل الدخول (مع خانة "تذكرني")
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  void _handleLogin() {
    String email = _emailController.text.trim().toLowerCase();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      // التحقق من بيانات المالك الحصرية
      bool isOwner = (email == "enanyenamy@gmail.com" && password == "Ahmed_238080@");

      if (email == "enanyenamy@gmail.com" && !isOwner) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("⚠️ Incorrect Owner Password! Access denied."),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      if (isOwner) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("👑 Owner Access Granted: Welcome Back, Master Enany!"),
            backgroundColor: Colors.tealAccent,
          ),
        );
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainHubScreen(isOwner: isOwner)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4A3B8C), Color(0xFFC24875)],
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(Icons.auto_awesome, color: Colors.white, size: 48),
                ),
                const SizedBox(height: 24),
                const Text(
                  "LifePilot OS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Your Ultimate AI Ecosystem",
                  style: TextStyle(color: Colors.white54, fontSize: 13),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Commander Email",
                    hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
                    prefixIcon: const Icon(Icons.email_outlined, color: Colors.tealAccent),
                    filled: true,
                    fillColor: const Color(0xFF1E1E2C),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Access Password",
                    hintStyle: const TextStyle(color: Colors.white38, fontSize: 12),
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.tealAccent),
                    filled: true,
                    fillColor: const Color(0xFF1E1E2C),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        activeColor: Colors.tealAccent,
                        checkColor: Colors.black,
                        side: const BorderSide(color: Colors.white54),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Remember Me (Auto-Login)",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: _isLoading ? null : _handleLogin,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.black)
                        : const Text(
                            "Initialize Access",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainHubScreen(isOwner: false)),
                    );
                  },
                  child: const Text(
                    "Continue as Guest",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 2. الشاشة الرئيسية مع زر تسجيل الخروج (Logout) في الأعلى
class MainHubScreen extends StatefulWidget {
  final bool isOwner;
  const MainHubScreen({Key? key, this.isOwner = false}) : super(key: key);

  @override
  State<MainHubScreen> createState() => _MainHubScreenState();
}

class _MainHubScreenState extends State<MainHubScreen> {
  String _currentLanguage = 'English';

  void _changeLanguage(String lang) {
    setState(() {
      _currentLanguage = lang;
    });
  }

  // دالة تسجيل الخروج للعودة لشاشة الدخول
  void _handleLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = _currentLanguage.contains('Arabic');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            isArabic ? "أهلاً بك، أيها القائد" : "Welcome, Commander",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.isOwner) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "OWNER",
                                style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isArabic ? "محركات الذكاء الاصطناعي تعمل بأقصى طاقة" : "AI Engines Operating at Full Capacity",
                        style: const TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                  
                  // صف يضم قائمة اللغات بجوار زر تسجيل الخروج (Logout)
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E2C),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: DropdownButton<String>(
                          value: _currentLanguage,
                          dropdownColor: const Color(0xFF1E1E2C),
                          icon: const Icon(Icons.language, color: Colors.tealAccent, size: 18),
                          underline: const SizedBox(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                          items: const [
                            'English', 'Arabic (العربية)', 'Spanish (Español)', 'French (Français)',
                            'German (Deutsch)', 'Chinese (中文)', 'Japanese (日本語)', 'Russian (Русский)',
                            'Portuguese (Português)', 'Italian (Italiano)', 'Korean (한국어)', 'Turkish (Türkçe)',
                            'Hindi (हिन्दी)', 'Urdu (اردو)', 'Dutch (Nederlands)', 'Polish (Polski)',
                            'Swedish (Svenska)', 'Greek (Ελληνικά)', 'Vietnamese (Tiếng Việt)', 'Thai (ไทย)',
                            'Indonesian (Bahasa)', 'Malay (Melayu)', 'Romanian (Română)', 'Czech (Čeština)', 'Hungarian (Magyar)'
                          ].map((String lang) {
                            return DropdownMenuItem<String>(
                              value: lang,
                              child: Text(lang, style: const TextStyle(color: Colors.white, fontSize: 11)),
                            );
                          }).toList(),
                          onChanged: (String? newLang) {
                            if (newLang != null) {
                              _changeLanguage(newLang);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      // زر تسجيل الخروج السريع (Logout Button)
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.redAccent, size: 22),
                        tooltip: "Logout",
                        onPressed: _handleLogout,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                          ? "مرحباً بك في LifePilot OS - مركزك العالمي ($_currentLanguage)"
                          : "Welcome to LifePilot OS - Your AI Hub ($_currentLanguage)",
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
        _showPersonaDialog(context, title, color);
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

  void _showPersonaDialog(BuildContext context, String engineName, Color themeColor) {
    final TextEditingController inputController = TextEditingController();
    ValueNotifier<String> outputNotifier = ValueNotifier<String>("Select AI persona and type your prompt...");
    ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(false);
    
    String selectedPersona = "Professional & Detailed";
    final List<String> personas = ["Professional & Detailed", "Creative & Engaging", "Short & Concise"];

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
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
                    const Text("Select AI Intelligence Persona:", style: TextStyle(color: Colors.white54, fontSize: 11)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F0F1A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        value: selectedPersona,
                        isExpanded: true,
                        dropdownColor: const Color(0xFF0F0F1A),
                        underline: const SizedBox(),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        items: personas.map((String persona) {
                          return DropdownMenuItem<String>(
                            value: persona,
                            child: Text(persona),
                          );
                        }).toList(),
                        onChanged: (String? newPersona) {
                          if (newPersona != null) {
                            setStateDialog(() {
                              selectedPersona = newPersona;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: inputController,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: "Type what you need...",
                        hintStyle: const TextStyle(color: Colors.white38),
                        filled: true,
                        fillColor: const Color(0xFF0F0F1A),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("AI Response:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 8),
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
                    outputNotifier.value = "Generating with persona [$selectedPersona]...";

                    Timer(const Duration(seconds: 2), () {
                      outputNotifier.value = "Result for: '$userInput'\n\n[Persona]: $selectedPersona\n[Language]: $_currentLanguage\n[Status]: Success! 🚀";
                      loadingNotifier.value = false;
                    });
                  },
                  child: const Text("Generate", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
