import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AiPhoneStoreApp());
}

class AiPhoneStoreApp extends StatefulWidget {
  const AiPhoneStoreApp({super.key});

  @override
  State<AiPhoneStoreApp> createState() => _AiPhoneStoreAppState();
}

class _AiPhoneStoreAppState extends State<AiPhoneStoreApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _currentLang = 'ar';

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeLang(String langCode) {
    setState(() {
      _currentLang = langCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Phone Store Global',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6), brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1), brightness: Brightness.dark),
      ),
      home: WelcomeAuthScreen(
        onToggleTheme: _toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
        currentLang: _currentLang,
        onLangChanged: _changeLang,
      ),
    );
  }
}

// قائمة اللغات
final List<Map<String, String>> globalLanguagesList = [
  {'code': 'ar', 'name': 'العربية (Arabic)'},
  {'code': 'en', 'name': 'English (الإنجليزية)'},
  {'code': 'fr', 'name': 'Français (الفرنسية)'},
  {'code': 'it', 'name': 'Italiano (الإيطالية)'},
  {'code': 'es', 'name': 'Español (الإسبانية)'},
  {'code': 'de', 'name': 'Deutsch (الألمانية)'},
];

String getAppText(String langCode, String key) {
  Map<String, Map<String, String>> dictionary = {
    'ar': {
      'subtitle': 'موسوعة الهواتف العالمية الشاملة',
      'signin': 'تسجيل الدخول',
      'guest': 'الدخول كزائر',
      'dbTitle': 'موسوعة الهواتف',
      'marketTitle': 'سوق المستعمل (1\$)',
      'searchHint': 'ابحث عن هاتف أو ماركة...',
      'priceLabel': 'السعر:',
      'closeSpecs': 'إغلاق المواصفات',
      'marketBanner': 'ادفع \$1.00 لكشف وسائل التواصل الخاصة بالبائع.',
      'unlockBtn': 'ادفع \$1.00 لكشف الرقم',
      'exitTitle': 'خروج',
      'exitMsg': 'هل أنت متأكد من الخروج؟',
      'cancel': 'إلغاء',
      'confirmExit': 'خروج نهائي',
      'processor': 'المعالج:',
      'screen': 'الشاشة:',
      'camera': 'الكاميرات:',
      'battery': 'البطارية:',
    },
    'en': {
      'subtitle': 'Global Phone Database & Specs',
      'signin': 'Sign In',
      'guest': 'Continue as Guest',
      'dbTitle': 'Phones Database',
      'marketTitle': 'Used Market (1\$)',
      'searchHint': 'Search phone or brand...',
      'priceLabel': 'Price:',
      'closeSpecs': 'Close Specs',
      'marketBanner': 'Pay \$1.00 to reveal seller contact.',
      'unlockBtn': 'Pay \$1.00 to Unlock',
      'exitTitle': 'Exit App',
      'exitMsg': 'Are you sure you want to exit?',
      'cancel': 'Cancel',
      'confirmExit': 'Exit',
      'processor': 'Processor:',
      'screen': 'Screen:',
      'camera': 'Camera:',
      'battery': 'Battery:',
    },
    'fr': {
      'subtitle': 'Base de données mondiale des téléphones',
      'signin': 'Se connecter',
      'guest': 'Invité',
      'dbTitle': 'Base de données',
      'marketTitle': 'Marché occasion (1\$)',
      'searchHint': 'Rechercher...',
      'priceLabel': 'Prix:',
      'closeSpecs': 'Fermer',
      'marketBanner': 'Payez \$1.00 pour révéler le contact.',
      'unlockBtn': 'Payer \$1.00',
      'exitTitle': 'Quitter',
      'exitMsg': 'Voulez-vous quitter ?',
      'cancel': 'Annuler',
      'confirmExit': 'Quitter',
      'processor': 'Processeur:',
      'screen': 'Écran:',
      'camera': 'Caméra:',
      'battery': 'Batterie:',
    }
  };
  return dictionary[langCode]?[key] ?? dictionary['en']?[key] ?? key;
}

class WelcomeAuthScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final String currentLang;
  final ValueChanged<String> onLangChanged;

  const WelcomeAuthScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
    required this.currentLang,
    required this.onLangChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF1E3A8A), Color(0xFF6366F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round, color: Colors.white),
                      onPressed: onToggleTheme,
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.language_rounded, color: Colors.white),
                      onSelected: onLangChanged,
                      itemBuilder: (context) {
                        return globalLanguagesList.map((lang) {
                          bool isSelected = currentLang == lang['code'];
                          return PopupMenuItem<String>(
                            value: lang['code'],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(lang['name']!, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                                if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF1E3A8A), size: 18),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.phone_android_rounded, size: 80, color: Colors.white),
                const SizedBox(height: 28),
                const Text('AI Phone Store', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 10),
                Text(getAppText(currentLang, 'subtitle'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.white70)),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF1E3A8A)),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, currentLang: currentLang, onLangChanged: onLangChanged)),
                      );
                    },
                    child: Text(getAppText(currentLang, 'signin'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white, width: 2), foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, currentLang: currentLang, onLangChanged: onLangChanged)),
                      );
                    },
                    child: Text(getAppText(currentLang, 'guest'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final String currentLang;
  final ValueChanged<String> onLangChanged;

  const MainNavigationScreen({super.key, required this.onToggleTheme, required this.isDarkMode, required this.currentLang, required this.onLangChanged});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesDatabaseScreen(isDarkMode: widget.isDarkMode, currentLang: widget.currentLang, onLangChanged: widget.onLangChanged, onToggleTheme: widget.onToggleTheme),
      UsedPhonesMarketScreen(currentLang: widget.currentLang, onLangChanged: widget.onLangChanged, onToggleTheme: widget.onToggleTheme),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        height: 70,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.menu_book), label: getAppText(widget.currentLang, 'dbTitle')),
          NavigationDestination(icon: const Icon(Icons.storefront), label: getAppText(widget.currentLang, 'marketTitle')),
        ],
      ),
    );
  }
}

class NewPhonesDatabaseScreen extends StatefulWidget {
  final bool isDarkMode;
  final String currentLang;
  final ValueChanged<String> onLangChanged;
  final VoidCallback onToggleTheme;

  const NewPhonesDatabaseScreen({super.key, required this.isDarkMode, required this.currentLang, required this.onLangChanged, required this.onToggleTheme});

  @override
  State<NewPhonesDatabaseScreen> createState() => _NewPhonesDatabaseScreenState();
}

class _NewPhonesDatabaseScreenState extends State<NewPhonesDatabaseScreen> {
  String searchQuery = "";
  final List<Map<String, dynamic>> phonesDatabase = [
    {'name': 'iPhone 15 Pro Max', 'brand': 'Apple', 'price': '\$1199', 'screen': '6.7 بوصة', 'processor': 'A17 Pro', 'camera': '48 MP', 'battery': '4422 mAh', 'color': Colors.blueGrey},
    {'name': 'Samsung Galaxy S24 Ultra', 'brand': 'Samsung', 'price': '\$1299', 'screen': '6.8 بوصة', 'processor': 'Snapdragon 8 Gen 3', 'camera': '200 MP', 'battery': '5000 mAh', 'color': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPhones = phonesDatabase.where((p) => p['name'].toLowerCase().contains(searchQuery.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(getAppText(widget.currentLang, 'dbTitle'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round), onPressed: widget.onToggleTheme),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language_rounded),
            onSelected: widget.onLangChanged,
            itemBuilder: (context) => globalLanguagesList.map((lang) {
              bool isSelected = widget.currentLang == lang['code'];
              return PopupMenuItem<String>(value: lang['code'], child: Text(lang['name']!, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)));
            }).toList(),
          ),
          IconButton(icon: const Icon(Icons.exit_to_app, color: Colors.redAccent), onPressed: () => SystemNavigator.pop()),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (v) => setState(() => searchQuery = v),
              decoration: InputDecoration(hintText: getAppText(widget.currentLang, 'searchHint'), prefixIcon: const Icon(Icons.search), filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredPhones.length,
              itemBuilder: (context, index) {
                final phone = filteredPhones[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Container(width: 50, height: 60, decoration: BoxDecoration(color: phone['color'], borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.phone_android, color: Colors.white)),
                    title: Text(phone['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${getAppText(widget.currentLang, 'priceLabel')} ${phone['price']}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(phone['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const Divider(),
                              Text('${getAppText(widget.currentLang, 'processor')} ${phone['processor']}'),
                              Text('${getAppText(widget.currentLang, 'screen')} ${phone['screen']}'),
                              Text('${getAppText(widget.currentLang, 'camera')} ${phone['camera']}'),
                              Text('${getAppText(widget.currentLang, 'battery')} ${phone['battery']}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UsedPhonesMarketScreen extends StatelessWidget {
  final String currentLang;
  final ValueChanged<String> onLangChanged;
  final VoidCallback onToggleTheme;

  const UsedPhonesMarketScreen({super.key, required this.currentLang, required this.onLangChanged, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppText(currentLang, 'marketTitle')),
        actions: [
          IconButton(icon: const Icon(Icons.exit_to_app, color: Colors.redAccent), onPressed: () => SystemNavigator.pop()),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.amber.withOpacity(0.15), borderRadius: BorderRadius.circular(16)),
            child: Text(getAppText(currentLang, 'marketBanner')),
          ),
        ],
      ),
    );
  }
}
