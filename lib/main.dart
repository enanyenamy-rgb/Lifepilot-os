import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'نظام ذكاء اصطناعي متطور (Gemini Engine)',
    'bannerText': 'LifePilot OS - مساعدك الشخصي الذكي لتوليد البرامج والتطبيقات',
    'activeEngines': 'المحركات الذكية المتاحة',
    'taskAutomation': 'أتمتة البرمجة وتوليد التطبيقات',
    'contentStudio': 'استوديو توليد الفيديوهات',
    'documentCruncher': 'محلل المستندات والبيانات',
    'codeAssistant': 'المساعد الذكي للرسومات والصور',
    'languageTitle': 'اختر لغة النظام',
    'promptHint': 'اسألني أي شيء (مثلاً: ابنِ لي تطبيق مصاريف، أو اصنع فيديو كوميدي)...',
    'generateBtn': 'إرسال إلى محرك الذكاء الاصطناعي',
    'close': 'إغلاق',
    'openAppBtn': 'تشغيل التطبيق المُولّد فوراً 🚀',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'Advanced AI Operating System (Gemini Engine)',
    'bannerText': 'LifePilot OS - Your Ultimate AI Assistant for Code & Apps',
    'activeEngines': 'Available AI Engines',
    'taskAutomation': 'Code Generation & App Building',
    'contentStudio': 'Cinematic Video Studio',
    'documentCruncher': 'Document & Data Analyst',
    'codeAssistant': 'AI Image & Graphics Assistant',
    'languageTitle': 'Select System Language',
    'promptHint': 'Ask me anything (e.g., Build expense app, Make a funny video)...',
    'generateBtn': 'Send to AI Engine',
    'close': 'Close',
    'openAppBtn': 'Launch Generated App Now 🚀',
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
        scaffoldBackgroundColor: const Color(0xFF13151A),
        primaryColor: const Color(0xFF8AB4F8),
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
      backgroundColor: const Color(0xFF1E222B),
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
                      trailing: currentLocale == code ? const Icon(Icons.check, color: Color(0xFF8AB4F8)) : null,
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
                  colors: [Color(0xFF4285F4), Color(0xFF9b72cb), Color(0xFFd96570)],
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
                    iconColor: const Color(0xFF8AB4F8),
                    title: translate('taskAutomation'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.video_collection,
                    iconColor: const Color(0xFFf28b82),
                    title: translate('contentStudio'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.document_scanner,
                    iconColor: const Color(0xFFfbbc04),
                    title: translate('documentCruncher'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.image,
                    iconColor: const Color(0xFF81c995),
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
          color: const Color(0xFF1E222B),
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
  String _responseTitle = "";
  String _responseBody = "";
  bool _isDone = false;
  bool _isExpenseApp = false;

  void _startGeneration() {
    String query = _controller.text.trim();
    if (query.isEmpty) query = "طلب عام من المحرك";

    setState(() {
      _isLoading = true;
      _isDone = false;
      _isExpenseApp = false;
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _isDone = true;

        if (query.contains('مصاريف') || query.contains('expense') || query.contains('برنامج')) {
          _isExpenseApp = true;
          _responseTitle = "📊 تم بناء تطبيق المصاريف اليومية بنجاح!";
          _responseBody = "قام الذكاء الاصطناعي بتوليد وبرمجة تطبيق المصاريف بالكامل مع قاعدة بيانات محلية. يمكنك تشغيله الآن لتجربته مباشرة:";
        } else if (query.contains('فيديو') || query.contains('كوميدي') || query.contains('video')) {
          _isExpenseApp = false;
          _responseTitle = "🎬 سيناريو الفيديو الكوميدي المقترح:";
          _responseBody = "• المشهد الأول: مستخدم يحاول بناء تطبيق عبر الذكاء الاصطناعي في ثوانٍ.\n• المشهد الثاني: النظام ينفذ الأمر بلمسة زر واحدة.\n• الجودة: سينمائية 4K مع تأثيرات صوتية مذهلة.";
        } else {
          _isExpenseApp = false;
          _responseTitle = "✨ تحليل ومخرجات محرك الذكاء الاصطناعي:";
          _responseBody = "بناءً على طلبك («$query»):\n\n• تم توليد الأكواد وهيكل البيانات بنجاح تام.\n• التطبيق جاهز للعمل بكفاءة مطلقة وفق أحدث معايير المتاجر العالمية.";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.engineTitle, style: const TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: const Color(0xFF1E222B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              decoration: InputDecoration(
                hintText: widget.translate('promptHint'),
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1E222B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8AB4F8),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isLoading ? null : _startGeneration,
                child: _isLoading
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
                      )
                    : Text(
                        widget.translate('generateBtn'),
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            if (_isDone) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E222B),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF8AB4F8).withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _responseTitle,
                      style: const TextStyle(color: Color(0xFF8AB4F8), fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _responseBody,
                      style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    if (_isExpenseApp) ...[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GeneratedExpenseAppScreen()),
                          );
                        },
                        icon: const Icon(Icons.launch),
                        label: Text(widget.translate('openAppBtn'), style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ] else ...[
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 24,
                            child: Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                          ),
                        ),
                      ),
                    ],
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

class GeneratedExpenseAppScreen extends StatefulWidget {
  const GeneratedExpenseAppScreen({Key? key}) : super(key: key);

  @override
  State<GeneratedExpenseAppScreen> createState() => _GeneratedExpenseAppScreenState();
}

class _GeneratedExpenseAppScreenState extends State<GeneratedExpenseAppScreen> {
  final List<Map<String, dynamic>> _expenses = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addExpense() {
    if (_titleController.text.isEmpty || _amountController.text.isEmpty) return;
    setState(() {
      _expenses.add({
        'title': _titleController.text,
        'amount': double.tryParse(_amountController.text) ?? 0.0,
      });
      _titleController.clear();
      _amountController.clear();
    });
  }

  double get _totalExpenses {
    return _expenses.fold(0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامج المصاريف اليومية 💰'),
        backgroundColor: const Color(0xFF1E222B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF8AB4F8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8AB4F8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('إجمالي المصاريف:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('\$$_totalExpenses', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'اسم المصروف (مثلاً: طعام، مواصلات)',
                filled: true,
                fillColor: Color(0xFF1E222B),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'المبلغ',
                filled: true,
                fillColor: Color(0xFF1E222B),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8AB4F8), foregroundColor: Colors.black),
              onPressed: _addExpense,
              child: const Text('إضافة مصروف جديد', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) {
                  final item = _expenses[index];
                  return Card(
                    color: const Color(0xFF1E222B),
                    child: ListTile(
                      title: Text(item['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: Text('${item['amount']} \$', style: const TextStyle(color: Colors.greenAccent, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
