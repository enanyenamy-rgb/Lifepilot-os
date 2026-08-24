import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'iOS & Android نظام ذكاء اصطناعي متكامل',
    'bannerText': 'LifePilot OS - جاهز لتوليد البرامج، الصور، والفيديوهات',
    'activeEngines': 'محركات الذكاء الاصطناعي النشطة',
    'taskAutomation': 'أتمتة المهام البرمجية',
    'contentStudio': 'استوديو توليد الفيديو',
    'documentCruncher': 'معالج المستندات والتحليل',
    'codeAssistant': 'المساعد الذكي للصور والرسومات',
    'languageTitle': 'اختر لغة التطبيق',
    'promptHint': 'اكتب أمرك هنا (مثلاً: تصميم برنامج مصاريف أو توليد فيديو)...',
    'generateBtn': 'بدء توليد الذكاء الاصطناعي',
    'close': 'إغلاق',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'iOS & Android AI Operating System',
    'bannerText': 'LifePilot OS - Ready for Code, Image & Video Generation',
    'activeEngines': 'Active AI Engines',
    'taskAutomation': 'Task Automation',
    'contentStudio': 'Video Studio',
    'documentCruncher': 'Document Cruncher',
    'codeAssistant': 'AI Image Assistant',
    'languageTitle': 'Select App Language',
    'promptHint': 'Type your prompt here (e.g., Expense app, Video concept)...',
    'generateBtn': 'Start AI Generation',
    'close': 'Close',
  },
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
      supportedLocales: const [Locale('ar'), Locale('en')],
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
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate('languageTitle'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('العربية (Arabic)', style: TextStyle(color: Colors.white)),
                trailing: currentLocale == 'ar' ? const Icon(Icons.check, color: Color(0xFF6C63FF)) : null,
                onTap: () {
                  onLanguageChanged('ar');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('English', style: TextStyle(color: Colors.white)),
                trailing: currentLocale == 'en' ? const Icon(Icons.check, color: Color(0xFF6C63FF)) : null,
                onTap: () {
                  onLanguageChanged('en');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openAiGenerator(BuildContext context, String engineTitle) {
    final TextEditingController promptController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1C24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateModal) {
            bool isLoading = false;
            String resultText = "";
            bool isMediaGenerated = false;

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16,
                right: 16,
                top: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          engineTitle,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: promptController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: translate('promptHint'),
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFF0F1016),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C63FF),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          String text = promptController.text.trim();
                          if (text.isEmpty) text = "طلب تنفيذي عام";

                          setStateModal(() {
                            isLoading = true;
                            resultText = "";
                            isMediaGenerated = false;
                          });

                          Future.delayed(const Duration(seconds: 1), () {
                            setStateModal(() {
                              isLoading = false;
                              isMediaGenerated = true;
                              if (text.contains('مصاريف') || text.contains('finance') || text.contains('برنامج')) {
                                resultText = "🚀 **تم إنشاء برنامج المصاريف بنجاح!**\n• هيكل الواجهة: جاهز.\n• قواعد البيانات المحلية: مرتبطة.\n• ملف الـ APK والمنطق البرمجي: تم توليدهم عبر الذكاء الاصطناعي.";
                              } else if (text.contains('فيديو') || text.contains('video')) {
                                resultText = "🎬 **تم توليد فيديو الذكاء الاصطناعي بنجاح!**\n• الدقة: 1080p عالية الوضوح.\n• المدة: 15 ثانية.\n• تم تطبيق المؤثرات السينمائية بامتياز.";
                              } else {
                                resultText = "✨ **نتيجة محرك ($engineTitle):**\nتم تنفيذ طلبك بدقة متناهية بناءً على الأمر:\n«$text»\n\nالنظام جاهز للعمل العالمي!";
                              }
                            });
                          });
                        },
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                translate('generateBtn'),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (isMediaGenerated) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F1016),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF6C63FF)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              resultText,
                              style: const TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Center(
                                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        );
      },
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
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      translate('deviceSupport'),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
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
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              translate('activeEngines'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
}
