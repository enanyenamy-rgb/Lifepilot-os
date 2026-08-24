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
      'welcomeMessage': 'Discover smart specs & global local markets',
      'searchHint': 'Search any smartphone...',
      'usedMarketTab': 'Used Market',
      'specsTab': 'Phone Specs',
      'revealContact': 'Unlock Contact (\$1)',
      'phoneDetails': 'Phone Details & Local Seller',
      'condition': 'Condition',
      'price': 'Price',
    },
    'ar': {
      'appTitle': 'آي فون (AI Phone)',
      'welcomeMessage': 'اكتشف المواصفات الذكية والأسواق المحلية والعالمية',
      'searchHint': 'ابحث عن أي هاتف ذكي...',
      'usedMarketTab': 'سوق المستعمل',
      'specsTab': 'مواصفات الهواتف',
      'revealContact': 'كشف رقم التواصل (1\$)',
      'phoneDetails': 'تفاصيل الهاتف والبائع المحلي',
      'condition': 'الحالة',
      'price': 'السعر',
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
      home: HomeScreen(onLanguageChanged: _changeLanguage),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;
  const HomeScreen({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(t.get('appTitle'), style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newCode = Localizations.localeOf(context).languageCode == 'en' ? 'ar' : 'en';
              onLanguageChanged(Locale(newCode));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
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
