import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'منصة LifePilot OS - نظام ذكاء اصطناعي تفاعلي متطور',
    'bannerText': 'مساعدك الذكي الشامل: محادثات حية، توليد برامج، وتشغيل استوديو الفيديوهات',
    'activeEngines': 'المحركات الذكية النشطة',
    'taskAutomation': 'المساعد المالي والتحليل الذكي',
    'contentStudio': 'استوديو توليد الفيديوهات',
    'documentCruncher': 'محلل المستندات والبيانات',
    'codeAssistant': 'المساعد الخارق للبرمجة',
    'languageTitle': 'اختر لغة النظام',
    'promptHint': 'اسأل الذكاء الاصطناعي أو اطلب توليد برنامج...',
    'newChat': 'محادثة جديدة',
    'historyVault': 'سجل المحادثات والتطبيقات المولدة',
    'send': 'إرسال',
    'emptyHistory': 'لا توجد محادثات سابقة مسجلة.',
    'launchApp': 'تشغيل التطبيق المُولّد 🚀',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'LifePilot OS - Advanced Interactive AI Platform',
    'bannerText': 'Your Ultimate AI Assistant: Live Chat, App Generator & Video Studio',
    'activeEngines': 'Active AI Engines',
    'taskAutomation': 'AI Financial Assistant & Analytics',
    'contentStudio': 'Cinematic Video Studio',
    'documentCruncher': 'Deep Document & Data Analyzer',
    'codeAssistant': 'AI Code Generation Assistant',
    'languageTitle': 'Select System Language',
    'promptHint': 'Ask AI or request app generation...',
    'newChat': 'New Chat',
    'historyVault': 'Chat History & Generated Apps Vault',
    'send': 'Send',
    'emptyHistory': 'No previous chats recorded.',
    'launchApp': 'Launch Generated App 🚀',
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

class GlobalAppVault {
  static final List<Map<String, dynamic>> savedVault = [];
}

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
        scaffoldBackgroundColor: const Color(0xFF0F1117),
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
      backgroundColor: const Color(0xFF1A1D26),
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

  void _openEngine(BuildContext context, String engineTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeminiChatScreen(engineTitle: engineTitle, translate: translate),
      ),
    );
  }

  void _openVault(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VaultScreen(translate: translate),
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
            icon: const Icon(Icons.history, color: Color(0xFF8AB4F8)),
            onPressed: () => _openVault(context),
            tooltip: translate('historyVault'),
          ),
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
            Text(
              translate('welcome'),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              translate('deviceSupport'),
              style: TextStyle(fontSize: 13, color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),
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
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              translate('activeEngines'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: [
                  _buildCard(context, Icons.psychology, const Color(0xFF8AB4F8), translate('taskAutomation')),
                  _buildCard(context, Icons.video_collection, const Color(0xFFf28b82), translate('contentStudio')),
                  _buildCard(context, Icons.document_scanner, const Color(0xFFfbbc04), translate('documentCruncher')),
                  _buildCard(context, Icons.code, const Color(0xFF81c995), translate('codeAssistant')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, Color color, String title) {
    return InkWell(
      onTap: () => _openEngine(context, title),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D26),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class GeminiChatScreen extends StatefulWidget {
  final String engineTitle;
  final String Function(String) translate;

  const GeminiChatScreen({Key? key, required this.engineTitle, required this.translate}) : super(key: key);

  @override
  State<GeminiChatScreen> createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isGenerating = false;

  void _startNewChat() {
    setState(() {
      _messages.clear();
    });
  }

  void _sendMessage() async {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _isGenerating = true;
    });

    await Future.delayed(const Duration(milliseconds: 1400));
    if (!mounted) return;

    String aiResponse = "";
    bool isAppGenerated = false;

    if (text.contains('مصاريف') || text.contains('expense') || text.contains('كشف')) {
      aiResponse = "📊 **مساعدك المالي الذكي:**\nتم تحليل طلبك وتوليد برنامج المصاريف اليومية بنجاح مع جداول الأسبوع والتصنيف التلقائي.";
      isAppGenerated = true;
    } else if (text.contains('فيديو') || text.contains('كوميدي') || text.contains('video')) {
      aiResponse = "🎬 **استوديو الفيديوهات السينمائية:**\nتم توليد السيناريو والإطارات البصرية بدقة 4K والمؤثرات الصوتية المتطورة للطلب الخاص بك.";
    } else {
      aiResponse = "🧠 **رد محرك Gemini الذكي:**\nبناءً على توجيهاتك («$text»):\nتمت معالجة البيانات بنجاح تام وتطبيق الهيكل البرمجي المعياري المناسب للطلب.";
    }

    setState(() {
      _isGenerating = false;
      _messages.add({
        'sender': 'ai',
        'text': aiResponse,
        'hasAppButton': isAppGenerated,
      });
    });

    GlobalAppVault.savedVault.add({
      'engine': widget.engineTitle,
      'prompt': text,
      'response': aiResponse,
      'time': DateTime.now().toString().substring(10, 16),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.engineTitle, style: const TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: const Color(0xFF1A1D26),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_outlined, color: Color(0xFF8AB4F8)),
            onPressed: _startNewChat,
            tooltip: widget.translate('newChat'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.auto_awesome, color: Color(0xFF8AB4F8), size: 48),
                        const SizedBox(height: 12),
                        Text(
                          widget.translate('promptHint'),
                          style: const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];
                      bool isUser = msg['sender'] == 'user';
                      return Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.all(14),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                          decoration: BoxDecoration(
                            color: isUser ? const Color(0xFF4285F4) : const Color(0xFF1A1D26),
                            borderRadius: BorderRadius.circular(16),
                            border: isUser ? null : Border.all(color: Colors.white.withOpacity(0.08)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                msg['text'],
                                style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                              ),
                              if (msg['hasAppButton'] == true) ...[
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent,
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const GeneratedExpenseAppScreen()),
                                    );
                                  },
                                  icon: const Icon(Icons.launch),
                                  label: Text(widget.translate('launchApp')),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_isGenerating)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(color: Color(0xFF8AB4F8)),
            ),
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF1A1D26),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: widget.translate('promptHint'),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF8AB4F8)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VaultScreen extends StatelessWidget {
  final String Function(String) translate;

  const VaultScreen({Key? key, required this.translate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('historyVault'), style: const TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: const Color(0xFF1A1D26),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GlobalAppVault.savedVault.isEmpty
          ? Center(
              child: Text(
                translate('emptyHistory'),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: GlobalAppVault.savedVault.length,
              itemBuilder: (context, index) {
                final item = GlobalAppVault.savedVault[index];
                return Card(
                  color: const Color(0xFF1A1D26),
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.auto_awesome, color: Color(0xFF8AB4F8)),
                    title: Text(item['engine'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    subtitle: Text('الطلب: ${item['prompt']}\nالوقت: ${item['time']}', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                    isThreeLine: true,
                  ),
                );
              },
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
  final List<Map<String, dynamic>> _expenses = [
    {'title': 'طعام ومأكولات الأسبوع', 'amount': 120.0},
    {'title': 'مواصلات وتنقلات', 'amount': 45.0},
    {'title': 'فواتير واشتراكات', 'amount': 65.0},
  ];
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();

  void _addExpense() {
    if (_titleCtrl.text.isEmpty || _amountCtrl.text.isEmpty) return;
    setState(() {
      _expenses.add({
        'title': _titleCtrl.text,
        'amount': double.tryParse(_amountCtrl.text) ?? 0.0,
      });
      _titleCtrl.clear();
      _amountCtrl.clear();
    });
  }

  double get _total => _expenses.fold(0.0, (sum, item) => sum + item['amount']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامج المصاريف الأسبوعية المُولّد بالذكاء الاصطناعي 💰'),
        backgroundColor: const Color(0xFF1A1D26),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF8AB4F8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF8AB4F8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('إجمالي مصاريف الأسبوع:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('\$$_total', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(labelText: 'بيان المصروف', filled: true, fillColor: Color(0xFF1A1D26)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'المبلغ (\$)', filled: true, fillColor: Color(0xFF1A1D26)),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8AB4F8), foregroundColor: Colors.black),
              onPressed: _addExpense,
              child: const Text('إضافة بند جديد', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) {
                  final item = _expenses[index];
                  return Card(
                    color: const Color(0xFF1A1D26),
                    child: ListTile(
                      title: Text(item['title'], style: const TextStyle(color: Colors.white)),
                      trailing: Text('${item['amount']} \$', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
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
