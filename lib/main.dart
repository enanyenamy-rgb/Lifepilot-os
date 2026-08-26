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

// ==========================================
// قائمة الـ 25 لغة العالمية بالكامل
// ==========================================
final List<Map<String, String>> globalLanguagesList = [
  {'code': 'ar', 'name': 'العربية (Arabic)'},
  {'code': 'en', 'name': 'English (الإنجليزية)'},
  {'code': 'fr', 'name': 'Français (الفرنسية)'},
  {'code': 'es', 'name': 'Español (الإسبانية)'},
  {'code': 'de', 'name': 'Deutsch (الألمانية)'},
  {'code': 'it', 'name': 'Italiano (الإيطالية)'},
  {'code': 'pt', 'name': 'Português (البرتغالية)'},
  {'code': 'ru', 'name': 'Русский (الروسية)'},
  {'code': 'zh', 'name': '中文 (الصينية)'},
  {'code': 'ja', 'name': '日本語 (اليابانية)'},
  {'code': 'ko', 'name': '한국어 (الكورية)'},
  {'code': 'hi', 'name': 'हिन्दी (الهندية)'},
  {'code': 'tr', 'name': 'Türkçe (التركية)'},
  {'code': 'fa', 'name': 'فارسی (الفارسية)'},
  {'code': 'ur', 'name': 'اردو (الأردية)'},
  {'code': 'id', 'name': 'Bahasa Indonesia (الإندونيسية)'},
  {'code': 'vi', 'name': 'Tiếng Việt (الفيتنامية)'},
  {'code': 'th', 'name': 'ภาษาไทย (التيلاندية)'},
  {'code': 'pl', 'name': 'Polski (البولندية)'},
  {'code': 'nl', 'name': 'Nederlands (الهولندية)'},
  {'code': 'sv', 'name': 'Svenska (السويدية)'},
  {'code': 'el', 'name': 'Ελληνικά (اليونانية)'},
  {'code': 'hu', 'name': 'Magyar (المجرية)'},
  {'code': 'ro', 'name': 'Română (الرومانية)'},
  {'code': 'da', 'name': 'Dansk (الدنماركية)'},
];

// قاموس الترجمة الشامل لجميع الـ 25 لغة
String getAppText(String langCode, String key) {
  Map<String, Map<String, String>> dictionary = {
    'ar': {
      'subtitle': 'موسوعة الهواتف العالمية الشاملة ومقارنات الأداء الفورية',
      'signin': 'تسجيل الدخول',
      'guest': 'الدخول كزائر',
      'dbTitle': 'موسوعة الهواتف',
      'marketTitle': 'سوق المستعمل (1\$)',
      'searchHint': 'ابحث عن هاتف أو ماركة...',
      'priceLabel': 'السعر:',
      'closeSpecs': 'إغلاق المواصفات',
      'marketBanner': 'ادفع \$1.00 فقط لكشف كافة وسائل التواصل الخاصة بالبائع.',
      'unlockBtn': 'ادفع \$1.00 لكشف رقم البائع والواتساب',
      'exitTitle': 'خروج من التطبيق',
      'exitMsg': 'هل أنت متأكد أنك تريد الخروج؟',
      'cancel': 'إلغاء',
      'confirmExit': 'خروج نهائي',
      'processor': 'المعالج:',
      'screen': 'الشاشة:',
      'camera': 'الكاميرات:',
      'battery': 'البطارية:',
    },
    'en': {
      'subtitle': 'Global Phone Database & Performance Specs',
      'signin': 'Sign In',
      'guest': 'Continue as Guest',
      'dbTitle': 'Global Phones Database',
      'marketTitle': 'Used Phones Market (1\$)',
      'searchHint': 'Search any phone or brand...',
      'priceLabel': 'Price:',
      'closeSpecs': 'Close Specs',
      'marketBanner': 'Pay only \$1.00 to safely reveal all seller contact methods.',
      'unlockBtn': 'Pay \$1.00 to Unlock Contact',
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
      'guest': 'Continuer en invité',
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
    },
    'es': {
      'subtitle': 'Base de datos mundial de teléfonos',
      'signin': 'Iniciar sesión',
      'guest': 'Invitado',
      'dbTitle': 'Base de datos',
      'marketTitle': 'Mercado usado (1\$)',
      'searchHint': 'Buscar...',
      'priceLabel': 'Precio:',
      'closeSpecs': 'Cerrar',
      'marketBanner': 'Pague \$1.00 para revelar el contacto.',
      'unlockBtn': 'Pagar \$1.00',
      'exitTitle': 'Salir',
      'exitMsg': '¿Desea salir?',
      'cancel': 'Cancelar',
      'confirmExit': 'Salir',
      'processor': 'Procesador:',
      'screen': 'Pantalla:',
      'camera': 'Cámara:',
      'battery': 'Batería:',
    },
    'de': {
      'subtitle': 'Globale Telefondatenbank',
      'signin': 'Anmelden',
      'guest': 'Als Gast',
      'dbTitle': 'Telefondatenbank',
      'marketTitle': 'Gebrauchtmarkt (1\$)',
      'searchHint': 'Suche...',
      'priceLabel': 'Preis:',
      'closeSpecs': 'Schließen',
      'marketBanner': 'Zahlen Sie \$1.00 für Kontakt.',
      'unlockBtn': 'Zahlen Sie \$1.00',
      'exitTitle': 'Beenden',
      'exitMsg': 'Möchten Sie beenden?',
      'cancel': 'Abbrechen',
      'confirmExit': 'Beenden',
      'processor': 'Prozessor:',
      'screen': 'Bildschirm:',
      'camera': 'Kamera:',
      'battery': 'Akku:',
    },
    'it': {
      'subtitle': 'Database globale di telefoni',
      'signin': 'Accedi',
      'guest': 'Ospite',
      'dbTitle': 'Database',
      'marketTitle': 'Mercato usato (1\$)',
      'searchHint': 'Cerca...',
      'priceLabel': 'Prezzo:',
      'closeSpecs': 'Chiudi',
      'marketBanner': 'Paga \$1.00 per il contatto.',
      'unlockBtn': 'Paga \$1.00',
      'exitTitle': 'Esci',
      'exitMsg': 'Vuoi uscire?',
      'cancel': 'Annulla',
      'confirmExit': 'Esci',
      'processor': 'Processore:',
      'screen': 'Schermo:',
      'camera': 'Fotocamera:',
      'battery': 'Batteria:',
    },
    'pt': {
      'subtitle': 'Base de dados global de telefones',
      'signin': 'Entrar',
      'guest': 'Convidado',
      'dbTitle': 'Base de Dados',
      'marketTitle': 'Mercado Usados (1\$)',
      'searchHint': 'Pesquisar...',
      'priceLabel': 'Preço:',
      'closeSpecs': 'Fechar',
      'marketBanner': 'Pague \$1.00 pelo contato.',
      'unlockBtn': 'Pagar \$1.00',
      'exitTitle': 'Sair',
      'exitMsg': 'Deseja sair?',
      'cancel': 'Cancelar',
      'confirmExit': 'Sair',
      'processor': 'Processador:',
      'screen': 'Tela:',
      'camera': 'Câmera:',
      'battery': 'Bateria:',
    },
    'hi': {
      'subtitle': 'वैश्विक फोन डेटाबेस',
      'signin': 'साइन इन करें',
      'guest': 'अतिथि',
      'dbTitle': 'फ़ोन डेटाबेस',
      'marketTitle': 'पुराना बाज़ार (1\$)',
      'searchHint': 'खोज करें...',
      'priceLabel': 'मूल्य:',
      'closeSpecs': 'बंद करें',
      'marketBanner': 'संपर्क के लिए \$1.00 भुगतान करें।',
      'unlockBtn': '\$1.00 भुगतान करें',
      'exitTitle': 'बाहर निकलें',
      'exitMsg': 'क्या आप बाहर निकलना चाहते हैं?',
      'cancel': 'رद्द करें',
      'confirmExit': 'बाहर निकलें',
      'processor': 'प्रोसेसर:',
      'screen': 'स्क्रीन:',
      'camera': 'कैमरा:',
      'battery': 'बैटरी:',
    },
    'tr': {
      'subtitle': 'Küresel Telefon Veritabanı',
      'signin': 'Giriş Yap',
      'guest': 'Misafir',
      'dbTitle': 'Telefon Veritabanı',
      'marketTitle': 'İkinci El (1\$)',
      'searchHint': 'Ara...',
      'priceLabel': 'Fiyat:',
      'closeSpecs': 'Kapat',
      'marketBanner': 'İletişim için \$1.00 ödeyin.',
      'unlockBtn': '\$1.00 Öde',
      'exitTitle': 'Çıkış',
      'exitMsg': 'Çıkmak istediğinize emin misiniz?',
      'cancel': 'İptal',
      'confirmExit': 'Çıkış',
      'processor': 'İşlemci:',
      'screen': 'Ekran:',
      'camera': 'Kamera:',
      'battery': 'Batarya:',
    },
    'zh': {
      'subtitle': '全球手机数据库',
      'signin': '登录',
      'guest': '游客',
      'dbTitle': '手机数据库',
      'marketTitle': '二手市场 (1\$)',
      'searchHint': '搜索...',
      'priceLabel': '价格:',
      'closeSpecs': '关闭',
      'marketBanner': '支付 \$1.00 获取联系方式。',
      'unlockBtn': '支付 \$1.00',
      'exitTitle': '退出',
      'exitMsg': '确定要退出吗？',
      'cancel': '取消',
      'confirmExit': '退出',
      'processor': '处理器:',
      'screen': '屏幕:',
      'camera': '相机:',
      'battery': '电池:',
    }
  };

  return dictionary[langCode]?[key] ?? dictionary['en']?[key] ?? key;
}

// ==========================================
// شاشة الترحيب الخارجية
// ==========================================
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
            colors: [Color(0xFF0F172A), Color(0xFF1E3A8A), Color(0xFF6366F1), Color(0xFF8B5CF6)],
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
                    Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle),
                      child: IconButton(
                        icon: Icon(isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round, color: Colors.white, size: 20),
                        onPressed: onToggleTheme,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle),
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.language_rounded, color: Colors.white, size: 20),
                        onSelected: onLangChanged,
                        itemBuilder: (context) {
                          return globalLanguagesList.map((lang) {
                            bool isSelected = currentLang == lang['code'];
                            return PopupMenuItem<String>(
                              value: lang['code'],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lang['name']!,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected ? const Color(0xFF1E3A8A) : Colors.black87,
                                    ),
                                  ),
                                  if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF1E3A8A), size: 18),
                                ],
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.05)]),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.4), width: 2),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 30, spreadRadius: 5)],
                  ),
                  child: const Icon(Icons.phone_android_rounded, size: 80, color: Colors.white),
                ),
                const SizedBox(height: 28),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
                ),
                const SizedBox(height: 10),
                Text(
                  getAppText(currentLang, 'subtitle'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white70, height: 1.4),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1E3A8A),
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, initialLang: currentLang)),
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
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, initialLang: currentLang)),
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

// ==========================================
// التطبيق الرئيسي (يدير الحالة داخلياً لتحديث اللغات لحظياً)
// ==========================================
class MainNavigationScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final String initialLang;

  const MainNavigationScreen({super.key, required this.onToggleTheme, required this.isDarkMode, required this.initialLang});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  late String _internalLang;

  @override
  void initState() {
    super.initState();
    _internalLang = widget.initialLang;
  }

  void _updateLanguage(String newLang) {
    setState(() {
      _internalLang = newLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesDatabaseScreen(isDarkMode: widget.isDarkMode, currentLang: _internalLang, onLangChanged: _updateLanguage, onToggleTheme: widget.onToggleTheme),
      UsedPhonesMarketScreen(currentLang: _internalLang, onLangChanged: _updateLanguage, onToggleTheme: widget.onToggleTheme),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 10,
        height: 70,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.menu_book_rounded),
            selectedIcon: const Icon(Icons.menu_book, color: Color(0xFF1E3A8A)),
            label: getAppText(_internalLang, 'dbTitle'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined),
            selectedIcon: const Icon(Icons.storefront, color: Color(0xFF1E3A8A)),
            label: getAppText(_internalLang, 'marketTitle'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// موسوعة الهواتف
// ==========================================
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
    {
      'name': 'iPhone 15 Pro Max',
      'brand': 'Apple',
      'price': '\$1199',
      'screen': '6.7 OLED',
      'processor': 'Apple A17 Pro',
      'camera': '48 MP',
      'battery': '4422 mAh',
      'color': Colors.blueGrey,
    },
    {
      'name': 'Samsung Galaxy S24 Ultra',
      'brand': 'Samsung',
      'price': '\$1299',
      'screen': '6.8 AMOLED',
      'processor': 'Snapdragon 8 Gen 3',
      'camera': '200 MP',
      'battery': '5000 mAh',
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPhones = phonesDatabase.where((phone) {
      final name = phone['name'].toLowerCase();
      final brand = phone['brand'].toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query) || brand.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(getAppText(widget.currentLang, 'dbTitle'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round), onPressed: widget.onToggleTheme),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language_rounded),
            onSelected: widget.onLangChanged,
            itemBuilder: (context) {
              return globalLanguagesList.map((lang) {
                bool isSelected = widget.currentLang == lang['code'];
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
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: getAppText(widget.currentLang, 'searchHint'),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF1E3A8A)),
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredPhones.length,
              itemBuilder: (context, index) {
                final phone = filteredPhones[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(color: phone['color'], borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.phone_android, color: Colors.white, size: 30),
                    ),
                    title: Text(phone['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('${getAppText(widget.currentLang, 'priceLabel')} ${phone['price']}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showPhoneDetailsDialog(context, phone),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showPhoneDetailsDialog(BuildContext context, Map<String, dynamic> phone) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(phone['name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(phone['price'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const Divider(height: 24),
            _buildSpecRow(Icons.memory, getAppText(widget.currentLang, 'processor'), phone['processor']),
            _buildSpecRow(Icons.smartphone, getAppText(widget.currentLang, 'screen'), phone['screen']),
            _buildSpecRow(Icons.camera_alt, getAppText(widget.currentLang, 'camera'), phone['camera']),
            _buildSpecRow(Icons.battery_charging_full, getAppText(widget.currentLang, 'battery'), phone['battery']),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A), foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: Text(getAppText(widget.currentLang, 'closeSpecs')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF1E3A8A)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(getAppText(widget.currentLang, 'exitTitle')),
        content: Text(getAppText(widget.currentLang, 'exitMsg')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(getAppText(widget.currentLang, 'cancel'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () => SystemNavigator.pop(),
            child: Text(getAppText(widget.currentLang, 'confirmExit')),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// سوق المستعمل
// ==========================================
class UsedPhonesMarketScreen extends StatelessWidget {
  final String currentLang;
  final ValueChanged<String> onLangChanged;
  final VoidCallback onToggleTheme;

  const UsedPhonesMarketScreen({super.key, required this.currentLang, required this.onLangChanged, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getAppText(currentLang, 'marketTitle'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.wb_sunny : Icons.nightlight_round), onPressed: onToggleTheme),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language_rounded),
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
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade300),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock, color: Colors.amber),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(getAppText(currentLang, 'marketBanner'), style: const TextStyle(fontSize: 13, height: 1.4)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildUsedCard(context, 'iPhone 14 Pro Max', 'القاهرة، مصر', '\$750'),
        ],
      ),
    );
  }

  Widget _buildUsedCard(BuildContext context, String title, String location, String price) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A), foregroundColor: Colors.white),
                onPressed: () => _showPaymentDialog(context),
                icon: const Icon(Icons.lock_open, size: 18),
                label: Text(getAppText(currentLang, 'unlockBtn')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الدفع الآمن'),
        content: const Text('هل تريد دفع \$1.00 لكشف جميع بيانات تواصل البائع فوراً؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(getAppText(currentLang, 'cancel'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الدفع بنجاح!')));
            },
            child: Text(getAppText(currentLang, 'unlockBtn')),
          ),
        ],
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(getAppText(currentLang, 'exitTitle')),
        content: Text(getAppText(currentLang, 'exitMsg')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(getAppText(currentLang, 'cancel'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () => SystemNavigator.pop(),
            child: Text(getAppText(currentLang, 'confirmExit')),
          ),
        ],
      ),
    );
  }
}
