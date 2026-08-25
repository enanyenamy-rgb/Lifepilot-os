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

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5), brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF030712),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1), brightness: Brightness.dark),
      ),
      home: WelcomeAuthScreen(onToggleTheme: _toggleTheme, isDarkMode: _themeMode == ThemeMode.dark),
    );
  }
}

// ==========================================
// شاشة الترحيب العالمية الفاخرة
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
            colors: [Color(0xFF090D16), Color(0xFF1E1B4B), Color(0xFF4F46E5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
                    icon: Icon(isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round, color: Colors.white),
                    onPressed: onToggleTheme,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.white.withOpacity(0.25), Colors.white.withOpacity(0.05)]),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.35), width: 2),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 35, spreadRadius: 8)],
                  ),
                  child: const Icon(Icons.auto_awesome_rounded, size: 85, color: Colors.white),
                ),
                const SizedBox(height: 32),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
                ),
                const SizedBox(height: 12),
                const Text(
                  'التحفة الفنية الرقمية لعالم الهواتف والذكاء الاصطناعي',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4F46E5),
                      elevation: 15,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () => _showAuthBottomSheet(context),
                    child: const Text('تسجيل الدخول / حساب جديد', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode)),
                      );
                    },
                    child: const Text('الدخول كزائر (تصفح فوري)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF4F46E5)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF4F46E5)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
      UsedPhonesScreen(currentLang: _currentLang, isDarkMode: widget.isDarkMode),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 15,
        height: 70,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.public_outlined, size: 24),
            selectedIcon: const Icon(Icons.public_rounded, color: Color(0xFF4F46E5), size: 28),
            label: _currentLang == 'ar' ? 'الموسوعة العالمية' : 'Global Phones',
          ),
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined, size: 24),
            selectedIcon: const Icon(Icons.storefront_rounded, color: Color(0xFF4F46E5), size: 28),
            label: _currentLang == 'ar' ? 'سوق المستعمل' : 'Used Market',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الأول: موسوعة الهواتف العالمية الفاخرة
// ==========================================
class NewPhonesScreen extends StatelessWidget {
  final String currentLang;
  final ValueChanged<String> onLangChanged;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  NewPhonesScreen({super.key, required this.currentLang, required this.onLangChanged, required this.onToggleTheme, required this.isDarkMode});

  final List<Map<String, String>> globalPhones = [
    {
      'name': 'iPhone 15 Pro Max',
      'brand': 'Apple',
      'price': '\$1199',
      'specs': 'A17 Pro | 8GB RAM | 4422 mAh | كاميرا 48MP',
      'image': 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500',
    },
    {
      'name': 'Samsung Galaxy S24 Ultra',
      'brand': 'Samsung',
      'price': '\$1299',
      'specs': 'Snapdragon 8 Gen 3 | 12GB RAM | 5000 mAh',
      'image': 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500',
    },
    {
      'name': 'Xiaomi 14 Ultra',
      'brand': 'Xiaomi',
      'price': '\$999',
      'specs': 'Snapdragon 8 Gen 3 | Leica Quad Camera | 5300 mAh',
      'image': 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=500',
    },
    {
      'name': 'Poco X8 Pro',
      'brand': 'Poco',
      'price': '\$350',
      'specs': 'Dimensity 8300 Ultra | 144Hz AMOLED | 5000 mAh',
      'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(currentLang == 'ar' ? 'موسوعة الهواتف العالمية' : 'Global Phone Database', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round, size: 22),
            onPressed: onToggleTheme,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.language_rounded, size: 22),
            onSelected: (lang) => onLangChanged(lang),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'ar', child: Text('العربية (Arabic)')),
              PopupMenuItem(value: 'en', child: Text('English')),
              PopupMenuItem(value: 'fr', child: Text('Français')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Colors.redAccent, size: 22),
            onPressed: () => _showExitDialog(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // بانر زجاجي سحابي فاخر
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF312E81), Color(0xFF4F46E5), Color(0xFF8B5CF6)]),
              borderRadius: BorderRadius.circular(26),
              boxShadow: [BoxShadow(color: const Color(0xFF4F46E5).withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))],
            ),
            child: Row(
              children: [
                const Icon(Icons.cloud_done_rounded, color: Colors.white, size: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    currentLang == 'ar'
                        ? '✨ اتصال سحابي عالمي نشط: عرض صور حقيقية ومواصفات فورية لجميع هواتف العالم.'
                        : '✨ Active Global Cloud: Real photos and specs for world phones.',
                    style: const TextStyle(color: Colors.white, fontSize: 13.5, height: 1.4, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...globalPhones.map((phone) => _buildGlobalPhoneCard(phone['name']!, phone['brand']!, phone['price']!, phone['specs']!, phone['image']!)),
        ],
      ),
    );
  }

  Widget _buildGlobalPhoneCard(String name, String brand, String price, String specs, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDarkMode ? 0.35 : 0.06), blurRadius: 18, offset: const Offset(0, 8))],
        border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.04)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 90,
                color: Colors.grey.shade300,
                child: const Icon(Icons.phone_android, color: Colors.grey),
              ),
            ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.green.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
                      child: Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('ماركة عالمية: $brand', style: const TextStyle(fontSize: 12, color: Color(0xFF4F46E5), fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(specs, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الثاني: سوق المستعمل (1 دولار لكشف بيانات التواصل)
// ==========================================
class UsedPhonesScreen extends StatelessWidget {
  final String currentLang;
  final bool isDarkMode;
  const UsedPhonesScreen({super.key, required this.currentLang, required this.isDarkMode});

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
              color: Colors.amber.withOpacity(0.12),
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.amber.withOpacity(0.35)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.amber.withOpacity(0.25), shape: BoxShape.circle),
                  child: Icon(Icons.security_rounded, color: Colors.amber.shade700, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    currentLang == 'ar'
                        ? 'ادفع \$1.00 فقط لكشف كافة وسائل التواصل (رقم الهاتف، واتساب، الأماكن) الخاصة بالبائع بكل أمان.'
                        : 'Pay only \$1.00 to safely reveal all seller contact methods.',
                    style: const TextStyle(fontSize: 13, height: 1.4, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildUsedCard(context, 'iPhone 14 Pro Max', 'القاهرة، مصر', '\$750', 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500'),
          _buildUsedCard(context, 'Samsung Galaxy S23 Ultra', 'الجيزة، مصر', '\$650', 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500'),
        ],
      ),
    );
  }

  Widget _buildUsedCard(BuildContext context, String title, String location, String price, String imageUrl) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDarkMode ? 0.35 : 0.06), blurRadius: 18, offset: const Offset(0, 8))],
        border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(imageUrl, width: 70, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12.5)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.red.withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Icon(Icons.lock_rounded, size: 15, color: Colors.redAccent),
                const SizedBox(width: 8),
                Text(
                  currentLang == 'ar' ? 'وسائل التواصل (هاتف وواتساب) مخفية' : 'Contact methods are hidden',
                  style: const TextStyle(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.w600),
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
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () => _showPaymentDialog(context),
              icon: const Icon(Icons.lock_open_rounded, size: 16),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Text(currentLang == 'ar' ? 'تأكيد الدفع الآمن' : 'Secure Payment'),
        content: Text(currentLang == 'ar' ? 'هل تريد دفع \$1.00 لفتح جميع بيانات التواصل فوراً؟' : 'Pay \$1.00 to unlock contacts?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(currentLang == 'ar' ? 'إلغاء' : 'Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(currentLang == 'ar' ? '✨ تم الدفع بنجاح! ظهور بيانات البائع...' : 'Payment successful!'),
                  backgroundColor: Colors.green,
                ),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
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
