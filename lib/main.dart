import 'package:flutter/material.dart';

class AppTranslations {
  final Locale locale;
  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Phone Universe',
      'welcomeMessage': 'Ultimate Global Smartphone & AI Hub',
      'searchHint': 'Search any brand, phone, or specs...',
      'usedMarketTab': 'Used Market',
      'newPhonesTab': 'New Models',
      'specsTab': 'Compare Specs',
      'aiAssistantTab': 'AI Expert',
      'revealContact': 'Unlock Direct Contact (\$1)',
      'phoneDetails': 'Device Comprehensive Specs',
      'brandCategories': 'All Global Brands',
      'selectLanguage': 'Select Global Language',
    },
    'ar': {
      'appTitle': 'عالم الهواتف الذكية',
      'welcomeMessage': 'المنصة العالمية الشاملة للهواتف والذكاء الاصطناعي',
      'searchHint': 'ابحث عن أي ماركة، هاتف، أو مواصفات...',
      'usedMarketTab': 'سوق المستعمل',
      'newPhonesTab': 'الهواتف الجديدة',
      'specsTab': 'مقارنة المواصفات',
      'aiAssistantTab': 'خبير الذكاء الاصطناعي',
      'revealContact': 'فتح رقم التواصل المباشر (1\$)',
      'phoneDetails': 'المواصفات الشاملة للجهاز',
      'brandCategories': 'جميع الماركات العالمية',
      'selectLanguage': 'اختر لغة التطبيق العالمية',
    },
    'es': {
      'appTitle': 'Universo Teléfono IA',
      'welcomeMessage': 'Centro Global de Smartphones e IA',
      'searchHint': 'Buscar cualquier marca, teléfono...',
      'usedMarketTab': 'Mercado Usado',
      'newPhonesTab': 'Nuevos Modelos',
      'specsTab': 'Especificaciones',
      'aiAssistantTab': 'Experto IA',
      'revealContact': 'Desbloquear Contacto (\$1)',
      'phoneDetails': 'Especificaciones del Dispositivo',
      'brandCategories': 'Todas las Marcas',
      'selectLanguage': 'Seleccionar Idioma Global',
    },
    'fr': {
      'appTitle': 'Univers Téléphone IA',
      'welcomeMessage': 'Centre Mondial Smartphones & IA',
      'searchHint': 'Rechercher une marque, un téléphone...',
      'usedMarketTab': 'Marché Occasion',
      'newPhonesTab': 'Nouveaux Modèles',
      'specsTab': 'Spécifications',
      'aiAssistantTab': 'Expert IA',
      'revealContact': 'Déverrouiller le Contact (\$1)',
      'phoneDetails': 'Spécifications de l\'Appareil',
      'brandCategories': 'Toutes les Marques',
      'selectLanguage': 'Sélectionner la Langue',
    }
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']![key]!;
  }
}

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar', 'es', 'fr', 'de', 'zh', 'ru', 'ja', 'it', 'tr'].contains(locale.languageCode);

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
      title: 'AI Phone Universe',
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
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
        Locale('es', ''),
        Locale('fr', ''),
        Locale('de', ''),
        Locale('zh', ''),
        Locale('ru', ''),
        Locale('ja', ''),
        Locale('it', ''),
        Locale('tr', ''),
      ],
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

  void _showLanguageSelector(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));
    
    final List<Map<String, String>> languages = [
      {'name': 'English (الإنجليزية)', 'code': 'en'},
      {'name': 'العربية (Arabic)', 'code': 'ar'},
      {'name': 'Español (Spanish)', 'code': 'es'},
      {'name': 'Français (French)', 'code': 'fr'},
      {'name': 'Deutsch (German)', 'code': 'de'},
      {'name': '中文 (Chinese)', 'code': 'zh'},
      {'name': 'Русский (Russian)', 'code': 'ru'},
      {'name': '日本語 (Japanese)', 'code': 'ja'},
      {'name': 'Italiano (Italian)', 'code': 'it'},
      {'name': 'Türkçe (Turkish)', 'code': 'tr'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.get('selectLanguage'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Divider(color: Colors.white10),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return ListTile(
                      title: Text(lang['name']!, style: const TextStyle(color: Colors.white)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF818CF8)),
                      onTap: () {
                        widget.onLanguageChanged(Locale(lang['code']!));
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

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));

    final List<Widget> pages = [
      HomeScreen(t: t),
      NewPhonesScreen(t: t),
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
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.storefront_rounded), label: t.get('usedMarketTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.new_releases_rounded), label: t.get('newPhonesTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.phone_iphone_rounded), label: t.get('specsTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_awesome_rounded), label: t.get('aiAssistantTab')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(t.get('appTitle'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language_rounded, color: Color(0xFF818CF8)),
            onPressed: () => _showLanguageSelector(context),
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
    final List<Map<String, dynamic>> usedPhones = [
      {'name': 'iPhone 15 Pro Max', 'price': '\$850', 'cond': 'Like New - Local', 'battery': '95%'},
      {'name': 'Samsung Galaxy S24 Ultra', 'price': '\$790', 'cond': 'Excellent - Local', 'battery': '92%'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF9333EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bolt_rounded, color: Colors.amber, size: 34),
                const SizedBox(height: 10),
                Text(t.get('appTitle'), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(t.get('welcomeMessage'), style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: t.get('searchHint'),
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF818CF8)),
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 24),
          Text(t.get('usedMarketTab'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          ...usedPhones.map((phone) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
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
                      label: Text(t.get('revealContact')),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF1E293B),
                            title: const Text('Secure Payment', style: TextStyle(color: Colors.white)),
                            content: const Text('Pay \$1 to reveal seller contact details securely.', style: TextStyle(color: Colors.white70)),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK', style: TextStyle(color: Color(0xFF818CF8)))),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class NewPhonesScreen extends StatelessWidget {
  final AppTranslations t;
  NewPhonesScreen({super.key, required this.t});

  final List<Map<String, dynamic>> brands = [
    {
      'brand': 'Samsung',
      'icon': Icons.phone_android,
      'models': [
        {'name': 'Galaxy S25 Ultra', 'specs': 'Snapdragon 8 Gen 4, 200MP, 5000mAh', 'price': '\$1299'},
        {'name': 'Galaxy Z Fold 6', 'specs': 'Foldable AMOLED, AI Multitasking', 'price': '\$1799'},
        {'name': 'Galaxy A55 5G', 'specs': 'Exynos 1480, 50MP Camera, 5000mAh', 'price': '\$420'},
      ]
    },
    {
      'brand': 'Apple',
      'icon': Icons.phone_iphone,
      'models': [
        {'name': 'iPhone 16 Pro Max', 'specs': 'A18 Pro Chip, 48MP Triple Cam, Titanium', 'price': '\$1399'},
        {'name': 'iPhone 16', 'specs': 'A18 Chip, Action Button, Dual Camera', 'price': '\$799'},
        {'name': 'iPhone 15', 'specs': 'A16 Bionic, Dynamic Island, USB-C', 'price': '\$699'},
      ]
    },
    {
      'brand': 'Xiaomi & Poco',
      'icon': Icons.devices_other,
      'models': [
        {'name': 'Xiaomi 14 Ultra', 'specs': 'Snapdragon 8 Gen 3, Leica Quad Cam', 'price': '\$1099'},
        {'name': 'Poco X8 Pro', 'specs': 'High Performance Gaming, 120Hz OLED', 'price': '\$380'},
      ]
    },
    {
      'brand': 'Honor & Huawei',
      'icon': Icons.smartphone,
      'models': [
        {'name': 'Honor Magic 6 Pro', 'specs': 'Snapdragon 8 Gen 3, 5600mAh Battery', 'price': '\$999'},
        {'name': 'Honor X9d', 'specs': 'Ultra Durable Screen, Large Battery', 'price': '\$310'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(t.get('newPhonesTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 6),
        Text(t.get('brandCategories'), style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 16),
        ...brands.map((brandData) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(brandData['icon'], color: const Color(0xFF818CF8), size: 24),
                  const SizedBox(width: 10),
                  Text(brandData['brand'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const Divider(color: Colors.white10, height: 20),
              ...(brandData['models'] as List).map((model) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model['name'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                          const SizedBox(height: 3),
                          Text(model['specs'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(model['price'], style: const TextStyle(color: Color(0xFF34D399), fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
              )),
            ],
          ),
        )),
      ],
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
        Text(t.get('specsTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(16)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Advanced Specs Comparison', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
              SizedBox(height: 10),
              Text('Compare processors, batteries, cameras, and display technologies instantly across all global brands.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
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
                  Text('AI Phone Expert & Advisor', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Ask me anything about new releases, comparing specs, or finding the best phone for your budget.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),
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
