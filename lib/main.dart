import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatefulWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  State<LifePilotApp> createState() => _LifePilotAppState();
}

class _LifePilotAppState extends State<LifePilotApp> {
  // اللغة الافتراضية هي الإنجليزية، مع دعم 25 لغة عالمية
  String _currentLanguage = 'English';

  final Map<String, String> _languageCodes = {
    'English': 'en-US',
    'العربية': 'ar-SA',
    'Español': 'es-ES',
    'Français': 'fr-FR',
    'Deutsch': 'de-DE',
    'Italiano': 'it-IT',
    'Português': 'pt-PT',
    'Русский': 'ru-RU',
    '中文': 'zh-CN',
    '日本語': 'ja-JP',
    '한국어': 'ko-KR',
    'Türkçe': 'tr-TR',
    'हिन्दी': 'hi-IN',
    'Nederlands': 'nl-NL',
    'Polski': 'pl-PL',
    'Svenska': 'sv-SE',
    'Bahasa Indonesia': 'id-ID',
    'Tiếng Việt': 'vi-VN',
    'ภาษาไทย': 'th-TH',
    'Ελληνικά': 'el-GR',
    'Čeština': 'cs-CZ',
    'Magyar': 'hu-HU',
    'Română': 'ro-RO',
    'Dansk': 'da-DK',
    'Suomi': 'fi-FI',
  };

  final Map<String, Map<String, String>> _translations = {
    'English': {
      'title': 'LifePilot OS',
      'welcome': 'Welcome, Commander',
      'subtitle': 'AI Engines Operating at Full Capacity',
      'audio_welcome': 'Welcome to LifePilot OS. AI engines are ready.',
      'active_engines': 'Active AI Engines',
      'task_automation': 'Task Automation',
      'content_studio': 'Content Studio',
      'doc_cruncher': 'Document Cruncher',
      'code_assistant': 'Code Assistant',
      'nav_home': 'Home',
      'nav_chat': 'AI Chat',
      'nav_engines': 'Engines',
      'nav_settings': 'Settings',
      'settings_title': 'Settings & Language',
      'select_lang': 'Select Application Language',
    },
    'العربية': {
      'title': 'LifePilot OS',
      'welcome': 'أهلاً بك، قائد المشروع',
      'subtitle': 'محركات الذكاء الاصطناعي تعمل بكفاءة تامة',
      'audio_welcome': 'أهلاً بك في منصة لايف بايلوت. محركات الذكاء الاصطناعي جاهزة.',
      'active_engines': 'محركات الذكاء الاصطناعي النشطة',
      'task_automation': 'أتمتة المهام',
      'content_studio': 'استديو المحتوى',
      'doc_cruncher': 'محلل المستندات',
      'code_assistant': 'المساعد البرمجي',
      'nav_home': 'الرئيسية',
      'nav_chat': 'المساعد',
      'nav_engines': 'المحركات',
      'nav_settings': 'الإعدادات',
      'settings_title': 'الإعدادات واللغة',
      'select_lang': 'اختر لغة التطبيق',
    },
    'Español': {
      'title': 'LifePilot OS',
      'welcome': 'Bienvenido, Comandante',
      'subtitle': 'Motores de IA operando al máximo',
      'audio_welcome': 'Bienvenido a LifePilot OS. Los motores de IA están listos.',
      'active_engines': 'Motores de IA Activos',
      'task_automation': 'Automatización',
      'content_studio': 'Estudio de Contenido',
      'doc_cruncher': 'Analizador de Docs',
      'code_assistant': 'Asistente de Código',
      'nav_home': 'Inicio',
      'nav_chat': 'Chat IA',
      'nav_engines': 'Motores',
      'nav_settings': 'Ajustes',
      'settings_title': 'Ajustes e Idioma',
      'select_lang': 'Seleccionar idioma',
    },
    'Français': {
      'title': 'LifePilot OS',
      'welcome': 'Bienvenue, Commandant',
      'subtitle': 'Moteurs IA opérationnels',
      'audio_welcome': 'Bienvenue sur LifePilot OS. Les moteurs IA sont prêts.',
      'active_engines': 'Moteurs IA Actifs',
      'task_automation': 'Automatisation',
      'content_studio': 'Studio de Contenu',
      'doc_cruncher': 'Analyseur de Docs',
      'code_assistant': 'Assistant Code',
      'nav_home': 'Accueil',
      'nav_chat': 'Chat IA',
      'nav_engines': 'Moteurs',
      'nav_settings': 'Paramètres',
      'settings_title': 'Paramètres et Langue',
      'select_lang': 'Sélectionner la langue',
    },
  };

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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: const Color(0xFF6366F1),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFFEC4899),
          surface: Color(0xFF1E293B),
        ),
        fontFamily: 'Inter',
      ),
      home: MainDashboard(
        currentLanguage: _currentLanguage,
        languageCodes: _languageCodes,
        translations: _translations,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

class MainDashboard extends StatefulWidget {
  final String currentLanguage;
  final Map<String, String> languageCodes;
  final Map<String, Map<String, String>> translations;
  final Function(String) onLanguageChanged;

  const MainDashboard({
    Key? key,
    required this.currentLanguage,
    required this.languageCodes,
    required this.translations,
    required this.onLanguageChanged,
  }) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _speakWelcomeMessage();
  }

  @override
  void didUpdateWidget(covariant MainDashboard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentLanguage != widget.currentLanguage) {
      _speakWelcomeMessage();
    }
  }

  Future<void> _speakWelcomeMessage() async {
    final t = widget.translations[widget.currentLanguage] ?? widget.translations['English']!;
    final langCode = widget.languageCodes[widget.currentLanguage] ?? 'en-US';
    
    await _flutterTts.setLanguage(langCode);
    await _flutterTts.setSpeechRate(0.5); // سرعة نطق طبيعية وهادئة
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(t['audio_welcome']!);
  }

  @override
  Widget build(BuildContext context) {
    // إذا كانت اللغات الأخرى غير معرّفة بالكامل نأخذ الإنجليزية كافتراضي مؤقت
    final t = widget.translations[widget.currentLanguage] ?? widget.translations['English']!;

    final List<Widget> screens = [
      HomeTab(t: t),
      AIChatTab(t: t),
      EnginesTab(t: t),
      SettingsTab(
        currentLanguage: widget.currentLanguage,
        languagesList: widget.languageCodes.keys.toList(),
        onLanguageChanged: widget.onLanguageChanged,
        t: t,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF6366F1),
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.grid_view_rounded), label: t['nav_home']!),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_awesome_rounded), label: t['nav_chat']!),
            BottomNavigationBarItem(icon: const Icon(Icons.analytics_rounded), label: t['nav_engines']!),
            BottomNavigationBarItem(icon: const Icon(Icons.settings_rounded), label: t['nav_settings']!),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final Map<String, String> t;
  const HomeTab({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t['welcome']!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t['subtitle']!,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: const Color(0xFF6366F1).withOpacity(0.2),
                child: const Icon(Icons.bolt_rounded, color: Color(0xFF6366F1)),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            t['active_engines']!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                EngineCard(title: t['task_automation']!, icon: Icons.task_alt_rounded, color: Colors.blueAccent),
                EngineCard(title: t['content_studio']!, icon: Icons.edit_note_rounded, color: Colors.pinkAccent),
                EngineCard(title: t['doc_cruncher']!, icon: Icons.document_scanner_rounded, color: Colors.amberAccent),
                EngineCard(title: t['code_assistant']!, icon: Icons.code_rounded, color: Colors.greenAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EngineCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const EngineCard({Key? key, required this.title, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AIChatTab extends StatelessWidget {
  final Map<String, String> t;
  const AIChatTab({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('AI Assistant Engine', style: TextStyle(color: Colors.grey)));
  }
}

class EnginesTab extends StatelessWidget {
  final Map<String, String> t;
  const EnginesTab({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Advanced AI Workflows', style: TextStyle(color: Colors.grey)));
  }
}

class SettingsTab extends StatelessWidget {
  final String currentLanguage;
  final List<String> languagesList;
  final Function(String) onLanguageChanged;
  final Map<String, String> t;

  const SettingsTab({
    Key? key,
    required this.currentLanguage,
    required this.languagesList,
    required this.onLanguageChanged,
    required this.t,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t['settings_title']!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(t['select_lang']!, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: DropdownButton<String>(
              value: currentLanguage,
              dropdownColor: const Color(0xFF1E293B),
              style: const TextStyle(color: Colors.white),
              isExpanded: true,
              underline: const SizedBox(),
              items: languagesList.map((String lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
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
    );
  }
}
