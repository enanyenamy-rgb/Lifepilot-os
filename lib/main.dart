import 'package:flutter/material.dart';

class AppTranslations {
  final Locale locale;
  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Phone Hub',
      'welcomeMessage': 'Next-Gen AI Phone Market & Specs',
      'searchHint': 'Search Samsung, iPhone, specs...',
      'usedMarketTab': 'Live Market',
      'specsTab': 'Smart Specs',
      'aiAssistantTab': 'AI Expert',
      'revealContact': 'Unlock Direct Contact (\$1)',
      'phoneDetails': 'Verified Device Details',
      'condition': 'Condition: Pristine',
      'noResults': 'No smartphones found matching your search.',
    },
    'ar': {
      'appTitle': 'منصة آي فون الذكية',
      'welcomeMessage': 'الجيل القادم لسوق ومواصفات الهواتف بالذكاء الاصطناعي',
      'searchHint': 'ابحث عن سامسونج، أيفون، مواصفات...',
      'usedMarketTab': 'السوق الحي',
      'specsTab': 'المواصفات الذكية',
      'aiAssistantTab': 'خبير الذكاء الاصطناعي',
      'revealContact': 'فتح رقم التواصل المباشر (1\$)',
      'phoneDetails': 'تفاصيل الهاتف الموثقة',
      'condition': 'الحالة: ممتازة جداً',
      'noResults': 'لا توجد هواتف تطابق بحثك حالياً.',
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
      title: 'AI Phone Hub',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6366F1),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF10B981),
          surface: Color(0xFF1E293B),
        ),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFF1E293B),
          selectedItemColor: const Color(0xFF818CF8),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.storefront_rounded), label: t.get('usedMarketTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.phone_iphone_rounded), label: t.get('specsTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_awesome_rounded), label: t.get('aiAssistantTab')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(t.get('appTitle'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language_rounded, color: Color(0xFF818CF8)),
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

class HomeScreen extends StatefulWidget {
  final AppTranslations t;
  const HomeScreen({super.key, required this.t});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";

  final List<Map<String, dynamic>> _phones = [
    {'name': 'iPhone 15 Pro Max', 'brand': 'apple', 'price': '\$850', 'cond': 'Like New - Local', 'battery': '95%'},
    {'name': 'Samsung Galaxy S24 Ultra', 'brand': 'samsung', 'price': '\$790', 'cond': 'Excellent - Local', 'battery': '92%'},
    {'name': 'Samsung Galaxy S23 Ultra', 'brand': 'samsung', 'price': '\$620', 'cond': 'Good - Local', 'battery': '88%'},
    {'name': 'iPhone 14 Pro', 'brand': 'apple', 'price': '\$680', 'cond': 'Pristine - Local', 'battery': '90%'},
    {'name': 'Honor X9d / Magic V', 'brand': 'honor', 'price': '\$450', 'cond': 'Brand New Box', 'battery': '100%'},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPhones = _phones.where((phone) {
      final name = phone['name'].toString().toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF9333EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Color(0x554F46E5), blurRadius: 15, offset: Offset(0, 8))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bolt_rounded, color: Colors.amber, size: 36),
                const SizedBox(height: 12),
                Text(widget.t.get('appTitle'), style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(widget.t.get('welcomeMessage'), style: const TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (val) => setState(() => _searchQuery = val),
            decoration: InputDecoration(
              hintText: widget.t.get('searchHint'),
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF818CF8)),
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 24),
          Text(widget.t.get('usedMarketTab'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          filteredPhones.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(child: Text(widget.t.get('noResults'), style: const TextStyle(color: Colors.grey))),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredPhones.length,
                  itemBuilder: (context, index) {
                    final phone = filteredPhones[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UsedPhoneDetailsScreen(t: widget.t, phone: phone)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(phone['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                                  Text(phone['price'], style: const TextStyle(color: Color(0xFF34D399), fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(phone['cond'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF059669),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    elevation: 0,
                                  ),
                                  icon: const Icon(Icons.lock_open_rounded, size: 18),
                                  label: Text(widget.t.get('revealContact')),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => UsedPhoneDetailsScreen(t: widget.t, phone: phone)));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
    final List<Map<String, String>> specsList = [
      {'name': 'Samsung Galaxy S25 Ultra', 'spec': 'Snapdragon 8 Gen 4 • 200MP • 5000mAh', 'price': '\$1299'},
      {'name': 'iPhone 16 Pro Max', 'spec': 'A18 Pro Chip • 48MP Triple • Titanium', 'price': '\$1399'},
      {'name': 'Samsung Galaxy Z Fold 6', 'spec': 'Foldable Dynamic AMOLED 2X • AI Hub', 'price': '\$1799'},
      {'name': 'Honor Magic 6 Pro', 'spec': 'Snapdragon 8 Gen 3 • 5600mAh Battery', 'price': '\$999'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(t.get('specsTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 16),
        ...specsList.map((item) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: const Color(0xFF4F46E5).withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.phone_android_rounded, color: Color(0xFF818CF8)),
            ),
            title: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            subtitle: Padding(padding: const EdgeInsets.only(top: 6), child: Text(item['spec']!, style: const TextStyle(color: Colors.grey, fontSize: 12))),
            trailing: Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF34D399), fontSize: 15)),
          ),
        )),
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome_rounded, size: 50, color: Color(0xFF818CF8)),
                  SizedBox(height: 16),
                  Text(
                    'AI Phone Expert & Advisor',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ask me anything about smartphone performance, comparing Samsung vs Apple, or battery ratings.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t.get('searchHint'),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.send_rounded),
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
  final Map<String, dynamic> phone;
  const UsedPhoneDetailsScreen({super.key, required this.t, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.get('phoneDetails')),
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF334155), Color(0xFF1E293B)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.phone_iphone_rounded, size: 90, color: Color(0xFF818CF8)),
              ),
            ),
            const SizedBox(height: 20),
            Text(phone['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text(phone['price'], style: const TextStyle(fontSize: 22, color: Color(0xFF34D399), fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Divider(color: Colors.white10),
            const SizedBox(height: 8),
            Text('Battery Health: ${phone['battery']}', style: const TextStyle(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 8),
            Text('Condition: ${phone['cond']}', style: const TextStyle(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 8),
            const Text('Location Match: Same Country Local Only', style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF059669),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                icon: const Icon(Icons.lock_open_rounded),
                label: Text(t.get('revealContact')),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF1E293B),
                      title: const Text('Secure Payment', style: TextStyle(color: Colors.white)),
                      content: const Text('Pay \$1 securely to reveal seller contact details.', style: TextStyle(color: Colors.white70)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK', style: TextStyle(color: Color(0xFF818CF8))),
                        ),
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
