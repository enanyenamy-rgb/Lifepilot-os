import 'package:flutter/material.dart';

class AppTranslations {
  final Locale locale;
  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Phone',
      'welcomeMessage': 'Your Ultimate Smart Assistant & Phone Market',
      'searchHint': 'Search smartphones or ask AI...',
      'usedMarketTab': 'Used Market',
      'specsTab': 'Phone Specs',
      'aiAssistantTab': 'AI Assistant',
      'revealContact': 'Unlock Contact (\$1)',
      'phoneDetails': 'Phone Details & Local Seller',
      'condition': 'Condition',
      'price': 'Price',
      'aiPromptHint': 'Ask AI about any phone or comparison...',
      'send': 'Send',
    },
    'ar': {
      'appTitle': 'آي فون (AI Phone)',
      'welcomeMessage': 'مساعدك الذكي الشامل وسوق الهواتف',
      'searchHint': 'ابحث عن هاتف أو اسأل الذكاء الاصطناعي...',
      'usedMarketTab': 'سوق المستعمل',
      'specsTab': 'مواصفات الهواتف',
      'aiAssistantTab': 'المساعد الذكي',
      'revealContact': 'كشف رقم التواصل (1\$)',
      'phoneDetails': 'تفاصيل الهاتف والبائع المحلي',
      'condition': 'الحالة',
      'price': 'السعر',
      'aiPromptHint': 'اسأل الذكاء الاصطناعي عن أي هاتف...',
      'send': 'إرسال',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']![key]!;
  }
}

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) async => AppTranslations(locale);

  @override
  bool shouldReload(AppTranslationsDelegate old) => false;
}

void main() {
  runApp(const AiPhoneApp());
}

class AiPhoneApp extends StatefulWidget {
  const AiPhoneApp({super.key});

  @override
  State<AiPhoneApp> createState() => _AiPhoneAppState();
}

class _AiPhoneAppState extends State<AiPhoneApp> {
  Locale _currentLocale = const Locale('en');

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Phone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      locale: _currentLocale,
      supportedLocales: const [Locale('en', ''), Locale('ar', '')],
      localizationsDelegates: const [AppTranslationsDelegate()],
      home: MainScreen(onLanguageChanged: _changeLanguage),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  const MainScreen({super.key, required this.onLanguageChanged});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));

    final List<Widget> pages = [
      HomeScreen(t: t),
      SpecsScreen(t: t),
      AiAssistantScreen(t: t),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.store),
            label: t.get('usedMarketTab'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.phone_android),
            label: t.get('specsTab'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.psychology),
            label: t.get('aiAssistantTab'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(t.get('appTitle'), style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newCode = Localizations.localeOf(context).languageCode == 'en' ? 'ar' : 'en';
              widget.onLanguageChanged(Locale(newCode));
            },
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppTranslations t;
  const HomeScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF1E40AF)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.get('appTitle'), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(t.get('welcomeMessage'), style: const TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: t.get('searchHint'),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF2563EB)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 24),
          Text(t.get('usedMarketTab'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsedPhoneDetailsScreen(t: t)));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('iPhone 15 Pro Max (Used)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('\$850', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Condition: Excellent (Local Country Only)', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.lock_open),
                        label: Text(t.get('revealContact')),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UsedPhoneDetailsScreen(t: t)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecsScreen extends StatelessWidget {
  final AppTranslations t;
  const SpecsScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(t.get('specsTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.phone_android, color: Colors.blue),
          title: const Text('Samsung Galaxy S25 Ultra'),
          subtitle: const Text('Snapdragon 8 Gen 4 • 200MP Camera'),
          trailing: const Text('\$1299', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.white,
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.phone_android, color: Colors.blue),
          title: const Text('iPhone 16 Pro Max'),
          subtitle: const Text('A18 Pro Chip • Titanium Design'),
          trailing: const Text('\$1399', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.white,
        ),
      ],
    );
  }
}

class AiAssistantScreen extends StatelessWidget {
  final AppTranslations t;
  const AiAssistantScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Hello! I am your AI Phone Assistant. How can I help you choose or compare phones today?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t.get('aiPromptHint'),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                style: IconButton.styleFrom(backgroundColor: const Color(0xFF2563EB), foregroundColor: Colors.white),
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UsedPhoneDetailsScreen extends StatelessWidget {
  final AppTranslations t;
  const UsedPhoneDetailsScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.get('phoneDetails')),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.phone_iphone, size: 80, color: Color(0xFF2563EB)),
            ),
            const SizedBox(height: 16),
            const Text('iPhone 15 Pro Max - 256GB', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('\$850', style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Divider(),
            const Text('Battery Health: 95%', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text('Location: Same Country Match Only', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.payment),
                label: Text(t.get('revealContact')),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Secure Payment'),
                      content: const Text('Pay \$1 to reveal seller contact details securely.'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                      ],
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
