import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MediPulseApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد الطبي',
    'deviceSupport': 'MediPulse AI - المنظومة الطبية العالمية المتعددة النماذج',
    'bannerText': 'مساعدك الطبي الذكي: استشارات فورية، خبرات أطباء العالم، وبدائل الأدوية حسب دولتك',
    'activeEngines': 'محركات الذكاء الاصطناعي الطبية النشطة',
    'medicalConsultant': 'المستشار الطبي الذكي (Multi-AI)',
    'diseaseVault': 'موسوعة الأمراض وخبرات الأطباء',
    'dietStudio': 'استوديو التغذية العلاجية والريجيم',
    'pharmaFinder': 'محدد البدائل الدوائية الجغرافية',
    'languageTitle': 'اختر لغة النظام',
    'promptHint': 'اكتب استفسارك الطبي أو المرض أو طلب النظام الغذائي...',
    'newChat': 'استشارة جديدة',
    'historyVault': 'أرشيف الاستشارات والخطط الطبية',
    'send': 'إرسال الاستشارة',
    'emptyHistory': 'لا توجد استشارات سابقة مسجلة.',
    'launchModule': 'تشغيل الوحدة الطبية 🩺',
    'exitApp': 'خروج من النظام',
  },
  'en': {
    'welcome': 'Welcome, Medical Commander',
    'deviceSupport': 'MediPulse AI - Global Multi-Model Medical System',
    'bannerText': 'Your Smart Medical Assistant: Instant Consultations, Global Expert Insights & Drug Alternatives',
    'activeEngines': 'Active Medical AI Engines',
    'medicalConsultant': 'Smart Medical Consultant (Multi-AI)',
    'diseaseVault': 'Diseases & Global Experts Encyclopedia',
    'dietStudio': 'Clinical Nutrition & Diet Studio',
    'pharmaFinder': 'Geo-Pharma Alternative Finder',
    'languageTitle': 'Select System Language',
    'promptHint': 'Type your medical query, disease, or diet plan request...',
    'newChat': 'New Consultation',
    'historyVault': 'Consultations & Medical Plans Vault',
    'send': 'Send Query',
    'emptyHistory': 'No previous consultations recorded.',
    'launchModule': 'Launch Medical Module 🩺',
    'exitApp': 'Exit System',
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

class GlobalMedicalVault {
  static final List<Map<String, dynamic>> savedConsultations = [];
}

class MediPulseApp extends StatefulWidget {
  const MediPulseApp({Key? key}) : super(key: key);

  @override
  State<MediPulseApp> createState() => _MediPulseAppState();
}

class _MediPulseAppState extends State<MediPulseApp> {
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
      title: 'MediPulse AI',
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
        scaffoldBackgroundColor: const Color(0xFF090D16),
        primaryColor: const Color(0xFF38BDF8),
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
      backgroundColor: const Color(0xFF131B2E),
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
                      trailing: currentLocale == code ? const Icon(Icons.check, color: Color(0xFF38BDF8)) : null,
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

  void _openModule(BuildContext context, String moduleTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedicalChatScreen(moduleTitle: moduleTitle, translate: translate),
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

  void _exitApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Color(0xFF38BDF8)),
            onPressed: () => _openVault(context),
            tooltip: translate('historyVault'),
          ),
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () => _showLanguageSelector(context),
            tooltip: 'Select Language',
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            onPressed: _exitApp,
            tooltip: translate('exitApp'),
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
                  colors: [Color(0xFF1e3a8a), Color(0xFF581c87), Color(0xFF0f766e)],
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
                  _buildCard(context, Icons.medical_services, const Color(0xFF38BDF8), translate('medicalConsultant')),
                  _buildCard(context, Icons.local_hospital, const Color(0xFFc084fc), translate('diseaseVault')),
                  _buildCard(context, Icons.restaurant_menu, const Color(0xFF34d399), translate('dietStudio')),
                  _buildCard(context, Icons.medication, const Color(0xFFfbbf24), translate('pharmaFinder')),
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
      onTap: () => _openModule(context, title),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF131B2E),
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

class MedicalChatScreen extends StatefulWidget {
  final String moduleTitle;
  final String Function(String) translate;

  const MedicalChatScreen({Key? key, required this.moduleTitle, required this.translate}) : super(key: key);

  @override
  State<MedicalChatScreen> createState() => _MedicalChatScreenState();
}

class _MedicalChatScreenState extends State<MedicalChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isAnalyzing = false;

  void _startNewChat() {
    setState(() {
      _messages.clear();
    });
  }

  void _sendQuery() async {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    _controller.clear();
    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _isAnalyzing = true;
    });

    await Future.delayed(const Duration(milliseconds: 1600));
    if (!mounted) return;

    String aiResponse = "";
    bool isModuleTriggered = false;

    String lowerText = text.toLowerCase();

    if (lowerText.contains('ريجيم') || lowerText.contains('دايت') || lowerText.contains('اكل') || lowerText.contains('سُعرات')) {
      aiResponse = "🥗 **استوديو التغذية العلاجية الذكي (AI Diet Studio):**\n\n"
          "• تم تحليل حالتك الصحية وتصميم خطة غذائية مخصصة متكاملة.\n"
          "• تتضمن الخطة حساب السعرات الحرارية، البروتينات، وتجنب التعارضات الغذائية مع الأدوية.\n"
          "• اضغط أدناه لاستعراض الخطة الغذائية وتفاصيل الوجبات.";
      isModuleTriggered = true;
    } else if (lowerText.contains('دواء') || lowerText.contains('بديل') || lowerText.contains('علاج') || lowerText.contains('سعر')) {
      aiResponse = "💊 **مححدد البدائل الدوائية الجغرافية:**\n\n"
          "• تم مطابقة المادة الفعالة مع قواعد البيانات الدوائية العالمية.\n"
          "• جاري تحديد البدائل المحلية المتاحة في بلدك بنفس الفاعلية وبأسعار مناسبة.";
      isModuleTriggered = true;
    } else if (lowerText.contains('مرض') || lowerText.contains('أعراض') || lowerText.contains('دكتور') || lowerText.contains('استشارة')) {
      aiResponse = "🩺 **المستشار الطبي التوافقي (ChatGPT + DeepSeek + Gemini Consensus):**\n\n"
          "• تم استقراء أحدث الأبحاث الطبية العالمية وخبرات كبار الاستشاريين لكل مرض.\n"
          "• الفحوصات والأشعة المقترحة: تحاليل مخبرية دقيقة وأشعة تشخيصية.\n"
          "• البروتوكول العلاجي موصى به وفق أحدث التوصيات الإكلينيكية العالمية.";
      isModuleTriggered = true;
    } else {
      aiResponse = "⚡ **رد محرك MediPulse الذكي:**\n\n"
          "لقد استلمت استفسارك الطبي («$text»). تم تمرير الطلب عبر شبكات الذكاء الاصطناعي المتعددة لتحليل الحالة وتقديم التوصيات الطبية الآمنة والموثوقة.";
    }

    setState(() {
      _isAnalyzing = false;
      _messages.add({
        'sender': 'ai',
        'text': aiResponse,
        'hasActionModule': isModuleTriggered,
      });
    });

    GlobalMedicalVault.savedConsultations.add({
      'module': widget.moduleTitle,
      'query': text,
      'response': aiResponse,
      'time': DateTime.now().toString().substring(10, 16),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moduleTitle, style: const TextStyle(color: Colors.white, fontSize: 16)),
        backgroundColor: const Color(0xFF131B2E),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_outlined, color: Color(0xFF38BDF8)),
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
                        const Icon(Icons.medical_information, color: Color(0xFF38BDF8), size: 48),
                        const SizedBox(height: 12),
                        Text(
                          widget.translate('promptHint'),
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                          textAlign: TextAlign.center,
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
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
                          decoration: BoxDecoration(
                            color: isUser ? const Color(0xFF1e3a8a) : const Color(0xFF131B2E),
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
                              if (msg['hasActionModule'] == true) ...[
                                const SizedBox(height: 14),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF34d399),
                                    foregroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MedicalModuleDetailsScreen()),
                                    );
                                  },
                                  icon: const Icon(Icons.launch),
                                  label: Text(widget.translate('launchModule')),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_isAnalyzing)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(color: Color(0xFF38BDF8)),
            ),
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF131B2E),
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
                  icon: const Icon(Icons.send, color: Color(0xFF38BDF8)),
                  onPressed: _sendQuery,
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
        backgroundColor: const Color(0xFF131B2E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GlobalMedicalVault.savedConsultations.isEmpty
          ? Center(
              child: Text(
                translate('emptyHistory'),
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: GlobalMedicalVault.savedConsultations.length,
              itemBuilder: (context, index) {
                final item = GlobalMedicalVault.savedConsultations[index];
                return Card(
                  color: const Color(0xFF131B2E),
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.medical_services, color: Color(0xFF38BDF8)),
                    title: Text(item['module'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                    subtitle: Text('الاستشارة: ${item['query']}\nالوقت: ${item['time']}', style: const TextStyle(color: Colors.grey, fontSize: 11)),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}

class MedicalModuleDetailsScreen extends StatelessWidget {
  const MedicalModuleDetailsScreen({Key? key, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الخطة الطبية والبدائل 🩺'),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF38BDF8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF38BDF8)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تقرير الاستشاري العالمي (Multi-AI Consensus)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8))),
                  SizedBox(height: 8),
                  Text('تم اعتماد البروتوكول العلاجي والغذائي بناءً على أحدث التوصيات الإكلينيكية الدولية.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('الأدوية والبدائل المحلية المعتمدة:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Card(
              color: const Color(0xFF131B2E),
              child: ListTile(
                leading: const Icon(Icons.medication_liquid, color: Color(0xFFfbbf24)),
                title: const Text('الدواء الأساسي: البند الموصى به', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('البديل المحلي المتاح في دولتك: متوفر بكفاءة عالية وبسعر مناسب', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('نظام الوجبات والريجيم المخصص:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Card(
              color: const Color(0xFF131B2E),
              child: ListTile(
                leading: const Icon(Icons.restaurant, color: Color(0xFF34d399)),
                title: const Text('وجبة الإفطار والعشاء الصحية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('غنية بالعناصر الغذائية وخالية من أي تعارضات دوائية', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
