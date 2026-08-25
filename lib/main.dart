import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // مكتبة الأيقونات العالمية الفاخرة

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

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Phone Store',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1), brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF818CF8), brightness: Brightness.dark),
      ),
      home: WelcomeAuthScreen(onToggleTheme: _toggleTheme, isDarkMode: _themeMode == ThemeMode.dark),
    );
  }
}

// ==========================================
// شاشة الترحيب والدخول الفاخرة
// ==========================================
class WelcomeAuthScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const WelcomeAuthScreen({super.key, required this.onToggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF312E81), Color(0xFF4338CA), Color(0xFF6366F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: FaIcon(isDarkMode ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon, color: Colors.white),
                    onPressed: onToggleTheme,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.25), width: 2),
                  ),
                  child: const FaIcon(FontAwesomeIcons.mobileScreenButton, size: 70, color: Colors.white),
                ),
                const SizedBox(height: 28),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
                ),
                const SizedBox(height: 10),
                const Text(
                  'منصتك العالمية المتقدمة للهواتف الذكية',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4338CA),
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => _showAuthBottomSheet(context),
                    child: const Text('تسجيل الدخول / حساب جديد', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
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
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode)),
                      );
                    },
                    child: const Text('الدخول كزائر (تصفح سريع)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

  void _showAuthBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 24, right: 24, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('تسجيل الدخول', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('أدخل بيانات حسابك للمتابعة', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF4338CA)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF4338CA)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4338CA),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode)),
                  );
                },
                child: const Text('دخول', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// التطبيق الرئيسي
// ==========================================
class MainNavigationScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const MainNavigationScreen({super.key, required this.onToggleTheme, required this.isDarkMode});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String _currentLang = 'ar';

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesScreen(currentLang: _currentLang, onLangChanged: (lang) => setState(() => _currentLang = lang), onToggleTheme: widget.onToggleTheme, isDarkMode: widget.isDarkMode),
      UsedPhonesScreen(currentLang: _currentLang),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 10,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const FaIcon(FontAwesomeIcons.cloud, size: 20),
            selectedIcon: const FaIcon(FontAwesomeIcons.solidCloud, color: Color(0xFF6366F1), size: 22),
            label: _currentLang == 'ar' ? 'الهواتف الجديدة' : 'New Phones',
          ),
          NavigationDestination(
            icon: const FaIcon(FontAwesomeIcons.store, size: 20),
            selectedIcon: const FaIcon(FontAwesomeIcons.solidStore, color: Color(0xFF6366F1), size: 22),
            label: _currentLang == 'ar' ? 'سوق المستعمل' : 'Used Market',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الأول: الهواتف الجديدة
// ==========================================
class NewPhonesScreen extends StatelessWidget {
  final String currentLang;
  final ValueChanged<String> onLangChanged;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const NewPhonesScreen({super.key, required this.currentLang, required this.onLangChanged, required this.onToggleTheme, required this.isDarkMode});

  String _t(String key) {
    Map<String, Map<String, String>> translations = {
      'ar': {
        'title': 'أحدث الهواتف (سحابي مجاني)',
        'banner': 'تصفح أحدث الموبايلات العالمية مع تحديثات سحابية فورية ومجانية بالكامل.',
      },
      'en': {
        'title': 'Latest Phones (Cloud Free)',
        'banner': 'Browse latest global smartphones with instant free cloud updates.',
      },
      'fr': {
        'title': 'Derniers téléphones (Cloud Gratuit)',
        'banner': 'Parcourez les derniers smartphones avec mises à jour cloud.',
      }
    };
    return translations[currentLang]?[key] ?? translations['ar']![key]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(_t('title'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: FaIcon(isDarkMode ? FontAwesomeIcons.solidSun : FontAwesomeIcons.solidMoon, size: 18),
            onPressed: onToggleTheme,
          ),
          PopupMenuButton<String>(
            icon: const FaIcon(FontAwesomeIcons.globe, size: 18),
            onSelected: (lang) => onLangChanged(lang),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'ar', child: Text('العربية (Arabic)')),
              PopupMenuItem(value: 'en', child: Text('English')),
              PopupMenuItem(value: 'fr', child: Text('Français')),
            ],
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.redAccent, size: 18),
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم تحديث البيانات السحابية بنجاح!')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF4338CA), Color(0xFF6366F1)]),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.indigo.withOpacity(0.35), blurRadius: 12, offset: const Offset(0, 6))],
                ),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.cloudArrowDown, color: Colors.white, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _t('banner'),
                        style: const TextStyle(color: Colors.white, fontSize: 13.5, height: 1.4, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white70, size: 14),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildPhoneCard('Poco X8 Pro', 'Dimensity 8300 Ultra | 144Hz AMOLED', '\$350', FontAwesomeIcons.mobileScreen),
          _buildPhoneCard('Honor X9d', 'Snapdragon 6 Gen 1 | 5800mAh', '\$400', FontAwesomeIcons.fire),
        ],
      ),
    );
  }

  Widget _buildPhoneCard(String name, String specs, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FaIcon(icon, color: const Color(0xFF6366F1), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.green.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                      child: Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(specs, style: const TextStyle(fontSize: 12.5, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الثاني: سوق المستعمل
// ==========================================
class UsedPhonesScreen extends StatelessWidget {
  final String currentLang;
  const UsedPhonesScreen({super.key, required this.currentLang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(currentLang == 'ar' ? 'سوق الهواتف المستعملة' : 'Used Phones Market', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.shieldHalved, color: Colors.amber.shade700, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    currentLang == 'ar'
                        ? 'ادفع \$1.00 فقط لكشف كافة وسائل التواصل (رقم الهاتف، واتساب، الأماكن) الخاصة بالبائع بكل أمان.'
                        : 'Pay only \$1.00 to safely reveal all seller contact methods.',
                    style: const TextStyle(fontSize: 13, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildUsedCard(context, 'iPhone 14 Pro Max', 'القاهرة، مصر', '\$750'),
          _buildUsedCard(context, 'Samsung Galaxy S23 Ultra', 'الجيزة، مصر', '\$650'),
        ],
      ),
    );
  }

  Widget _buildUsedCard(BuildContext context, String title, String location, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.locationDot, size: 13, color: Colors.grey),
              const SizedBox(width: 6),
              Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.lock, size: 14, color: Colors.redAccent),
                const SizedBox(width: 8),
                Text(
                  currentLang == 'ar' ? 'وسائل التواصل (هاتف وواتساب) مخفية' : 'Contact methods are hidden',
                  style: const TextStyle(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4338CA),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => _showPaymentDialog(context),
              icon: const FaIcon(FontAwesomeIcons.unlock, size: 16),
              label: Text(currentLang == 'ar' ? 'ادفع \$1.00 لكشف وسائل التواصل' : 'Pay \$1.00 to Unlock'),
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(currentLang == 'ar' ? 'تأكيد الدفع الآمن' : 'Secure Payment'),
        content: Text(currentLang == 'ar' ? 'هل تريد دفع \$1.00 لفتح جميع بيانات التواصل فوراً؟' : 'Pay \$1.00 to unlock contacts?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(currentLang == 'ar' ? 'إلغاء' : 'Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(currentLang == 'ar' ? 'تم الدفع بنجاح! ظهور بيانات البائع...' : 'Payment successful!')),
              );
            },
            child: Text(currentLang == 'ar' ? 'تأكيد (\$1.00)' : 'Confirm'),
          ),
        ],
      ),
    );
  }
}

void _showExitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('خروج من التطبيق'),
      content: const Text('هل أنت متأكد أنك تريد الخروج؟'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          onPressed: () => SystemNavigator.pop(),
          child: const Text('خروج نهائي'),
        ),
      ],
    ),
  );
}
