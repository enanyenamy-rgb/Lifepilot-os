import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'iOS & Android نظام ذكاء اصطناعي خارق',
    'bannerText': 'LifePilot OS - منصة توليد البرامج، الصور، والفيديوهات بالذكاء الاصطناعي',
    'activeEngines': 'محركات الذكاء الاصطناعي النشطة',
    'taskAutomation': 'أتمتة البرمجة وتوليد الأكواد',
    'contentStudio': 'استوديو الفيديوهات السينمائية',
    'documentCruncher': 'محلل المستندات والبيانات العميق',
    'codeAssistant': 'المساعد الخارق للصور والرسومات',
    'languageTitle': 'اختر لغة النظام',
    'promptHint': 'اكتب أمرك هنا (مثلاً: ابنِ لي تطبيق مصاريف، ولد فيديو فضاء)...',
    'generateBtn': 'بدء التوليد الخارق بالذكاء الاصطناعي',
    'close': 'إغلاق',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'iOS & Android Ultimate AI Operating System',
    'bannerText': 'LifePilot OS - Advanced Code, Image & Video AI Studio',
    'activeEngines': 'Active AI Engines',
    'taskAutomation': 'Code & Task Automation',
    'contentStudio': 'Cinematic Video Studio',
    'documentCruncher': 'Deep Document & Data Cruncher',
    'codeAssistant': 'AI Image & Graphics Assistant',
    'languageTitle': 'Select System Language',
    'promptHint': 'Type your prompt here (e.g., Build expense app, Space video)...',
    'generateBtn': 'Start Ultimate AI Generation',
    'close': 'Close',
  },
};

final Map<String, String> globalLanguagesMap = {
  'ar': 'العربية (Arabic)',
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'de': 'Deutsch',
  'zh': '中文 (Chinese)',
  'ja': '日本語 (Japanese)',
  'ko': '한국어 (Korean)',
  'ru': 'Русский (Russian)',
  'pt': 'Português',
  'it': 'Italiano',
  'tr': 'Türkçe',
  'hi': 'हिन्दी (Hindi)',
  'id': 'Indonesian',
  'vi': 'Tiếng Việt',
  'pl': 'Polski',
  'nl': 'Nederlands',
  'uk': 'Українська',
  'sv': 'Svenska',
  'el': 'Ελληνικά',
  'he': 'עברית (Hebrew)',
  'ro': 'Română',
  'hu': 'Magyar',
  'cs': 'Čeština',
  'th': 'ไทย (Thai)',
};

class LifePilotApp extends StatefulWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  State<LifePilotApp> createState() => _LifePilotAppState();
}

class _LifePilotAppState extends State<LifePilotApp> {
  Locale _currentLocale = const Locale('ar');

  void _changeLanguage(String languageCode) {
    setState(() {
      _currentLocale = Locale(languageCode);
    });
  }

  String translate(String key) {
    return localizedValues[_currentLocale.languageCode]?[key] ??
        localizedValues['en']?[key] ??
        key;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      supportedLocales: globalLanguagesMap.keys.map((code) => Locale(code)).toList(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1016),
        primaryColor: const Color(0xFF6C63FF),
      ),
      home: HomeScreen(
        onLanguageChanged: _changeLanguage,
        currentLocale: _currentLocale.languageCode,
        translate: translate,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(String) onLanguageChanged;
  final String currentLocale;
  final String Function(String) translate;

  const HomeScreen({
    Key? key,
    required this.onLanguageChanged,
    required this.currentLocale,
    required this.translate,
  }) : super(key: key);

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1C24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate('languageTitle'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: globalLanguagesMap.length,
                  itemBuilder: (context, index) {
                    String code = globalLanguagesMap.keys.elementAt(index);
                    String name = globalLanguagesMap.values.elementAt(index);
                    return ListTile(
                      title: Text(name, style: const TextStyle(color: Colors.white)),
                      trailing: currentLocale == code ? const Icon(Icons.check, color: Color(0xFF6C63FF)) : null,
                      onTap: () {
                        onLanguageChanged(code);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openAiGenerator(BuildContext context, String engineTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AiStudioScreen(engineTitle: engineTitle, translate: translate),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () => _showLanguageSelector(context),
            tooltip: 'Select Language',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.logout, color: Colors.redAccent, size: 20),
            ),
          ),
        ],
      ),
      body: Padding(
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
                    Text(
                      translate('welcome'),
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      translate('deviceSupport'),
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
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
                  colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                translate('bannerText'),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              translate('activeEngines'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildEngineCard(
                    context: context,
                    icon: Icons.code,
                    iconColor: Colors.blueAccent,
                    title: translate('taskAutomation'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.video_collection,
                    iconColor: Colors.pinkAccent,
                    title: translate('contentStudio'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.document_scanner,
                    iconColor: Colors.amber,
                    title: translate('documentCruncher'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.image,
                    iconColor: Colors.tealAccent,
                    title: translate('codeAssistant'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEngineCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return InkWell(
      onTap: () => _openAiGenerator(context, title),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 32),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class AiStudioScreen extends StatefulWidget {
  final String engineTitle;
  final String Function(String) translate;

  const AiStudioScreen({Key? key, required this.engineTitle, required this.translate}) : super(key: key);

  @override
  State<AiStudioScreen> createState() => _AiStudioScreenState();
}

class _AiStudioScreenState extends State<AiStudioScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String _resultText = "";
  bool _isDone = false;

  void _startGeneration() {
    String query = _controller.text.trim();
    if (query.isEmpty) query = "طلب تنفيذي ذكي عام";

    setState(() {
      _isLoading = true;
      _isDone = false;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _isDone = true;
        _resultText = "🚀 **النتيجة الفورية من محرك (${widget.engineTitle}):**\n\n«$query»\n\n• تم توليد الأكواد والملفات بنجاح تام.\n• تم تطبيق معايير التطبيقات العالمية.\n• النظام جاهز للتشغيل بكفاءة مطلقة!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.engineTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1C24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: widget.translate('promptHint'),
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1A1C24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isLoading ? null : _startGeneration,
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : Text(
                        widget.translate('generateBtn'),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            if (_isDone) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C24),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF6C63FF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_resultText, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.4)),
                    const SizedBox(height: 16),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
