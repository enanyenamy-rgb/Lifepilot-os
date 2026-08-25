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

  void _changeLang(String lang) {
    setState(() {
      _currentLang = lang;
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
// شاشة الترحيب والواجهة الخارجية المطورة
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
        // تدرجات لونية خارجية جديدة أكثر جاذبية وفخامة
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
                // الشريط العرضي العلوي للتحكم في الإضاءة واللغات من الخارج
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // زر تغيير الإضاءة (ليلي / نهاري)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_round, color: Colors.white, size: 20),
                        onPressed: onToggleTheme,
                        tooltip: 'تغيير الإضاءة',
                      ),
                    ),
                    const SizedBox(width: 10),
                    // زر تغيير اللغات
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.language_rounded, color: Colors.white, size: 20),
                        tooltip: 'تغيير اللغة',
                        onSelected: onLangChanged,
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 'ar', child: Text('العربية')),
                          PopupMenuItem(value: 'en', child: Text('English')),
                          PopupMenuItem(value: 'fr', child: Text('Français')),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // الأيقونة المركزية الفاخرة
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
                  currentLang == 'ar' ? 'موسوعة الهواتف العالمية الشاملة ومقارنات الأداء' : 'Global Phone Database & Performance Specs',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, color: Colors.white70, height: 1.4),
                ),
                const Spacer(),
                // زر تسجيل الدخول الأساسي
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
                    onPressed: () => _showAuthBottomSheet(context),
                    child: Text(
                      currentLang == 'ar' ? 'تسجيل الدخول' : 'Sign In',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                // زر الدخول كزائر تحته مباشرة
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
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, currentLang: currentLang)),
                      );
                    },
                    child: Text(
                      currentLang == 'ar' ? 'الدخول كزائر' : 'Continue as Guest',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
            const Text('أدخل بيانات حسابك للمتابعة إلى الموسوعة', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF1E3A8A)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1E3A8A)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode, currentLang: currentLang)),
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
  final String currentLang;

  const MainNavigationScreen({super.key, required this.onToggleTheme, required this.isDarkMode, required this.currentLang});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesDatabaseScreen(isDarkMode: widget.isDarkMode, currentLang: widget.currentLang),
      UsedPhonesMarketScreen(currentLang: widget.currentLang),
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
            label: widget.currentLang == 'ar' ? 'موسوعة الهواتف' : 'Database',
          ),
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined),
            selectedIcon: const Icon(Icons.storefront, color: Color(0xFF1E3A8A)),
            label: widget.currentLang == 'ar' ? 'سوق المستعمل (1\$)' : 'Used Market',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// موسوعة الهواتف
// ==========================================
class NewPhonesDatabaseScreen extends StatelessWidget {
  final bool isDarkMode;
  final String currentLang;

  NewPhonesDatabaseScreen({super.key, required this.isDarkMode, required this.currentLang});

  final List<Map<String, dynamic>> phonesDatabase = [
    {
      'name': 'iPhone 15 Pro Max',
      'brand': 'Apple',
      'release': 'سبتمبر 2023',
      'price': '\$1199',
      'screen': '6.7 بوصة OLED (120Hz)',
      'processor': 'Apple A17 Pro',
      'camera': '48 م.ب + 12 م.ب',
      'battery': '4422 ميللي أمبير',
      'color': Colors.blueGrey,
    },
    {
      'name': 'Samsung Galaxy S24 Ultra',
      'brand': 'Samsung',
      'release': 'يناير 2024',
      'price': '\$1299',
      'screen': '6.8 بوصة AMOLED (120Hz)',
      'processor': 'Snapdragon 8 Gen 3',
      'camera': '200 م.ب + 50 م.ب',
      'battery': '5000 ميللي أمبير',
      'color': Colors.indigo,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLang == 'ar' ? 'موسوعة الهواتف العالمية' : 'Global Phones Database', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: phonesDatabase.length,
        itemBuilder: (context, index) {
          final phone = phonesDatabase[index];
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
                  Text('السعر: ${phone['price']}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(phone['specs'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _showPhoneDetailsDialog(context, phone),
            ),
          );
        },
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
            _buildSpecRow(Icons.memory, 'المعالج:', phone['processor']),
            _buildSpecRow(Icons.smartphone, 'الشاشة:', phone['screen']),
            _buildSpecRow(Icons.camera_alt, 'الكاميرات:', phone['camera']),
            _buildSpecRow(Icons.battery_charging_full, 'البطارية:', phone['battery']),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E3A8A), foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: const Text('إغلاق المواصفات'),
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
}

// ==========================================
// سوق المستعمل
// ==========================================
class UsedPhonesMarketScreen extends StatelessWidget {
  final String currentLang;
  const UsedPhonesMarketScreen({super.key, required this.currentLang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLang == 'ar' ? 'سوق الهواتف المستعملة (1\$)' : 'Used Market (1\$)'),
        centerTitle: true,
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
            child: const Row(
              children: [
                Icon(Icons.lock, color: Colors.amber),
                SizedBox(width: 12),
                Expanded(
                  child: Text('ادفع \$1.00 فقط لكشف كافة وسائل التواصل الخاصة بالبائع (رقم الموبايل والواتساب).', style: TextStyle(fontSize: 13, height: 1.4)),
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
                label: const Text('ادفع \$1.00 لكشف رقم البائع والواتساب'),
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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الدفع بنجاح! ظهور رقم البائع والواتساب...')));
            },
            child: const Text('تأكيد (\$1.00)'),
          ),
        ],
      ),
    );
  }
}
