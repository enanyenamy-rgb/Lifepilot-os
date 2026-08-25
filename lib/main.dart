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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A), brightness: Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6), brightness: Brightness.dark),
      ),
      home: WelcomeAuthScreen(onToggleTheme: _toggleTheme, isDarkMode: _themeMode == ThemeMode.dark),
    );
  }
}

// ==========================================
// شاشة الترحيب الخارجية
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
            colors: [Color(0xFF0F172A), Color(0xFF1E3A8A), Color(0xFF3B82F6)],
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
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                  ),
                  child: const Icon(Icons.phone_android_rounded, size: 80, color: Colors.white),
                ),
                const SizedBox(height: 30),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.2),
                ),
                const SizedBox(height: 12),
                const Text(
                  'موسوعة الهواتف العالمية الشاملة ومقارنات الأداء الفورية',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1E3A8A),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainNavigationScreen(onToggleTheme: onToggleTheme, isDarkMode: isDarkMode)),
                      );
                    },
                    child: const Text('دخول إلى الموسوعة العالمية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
// التطبيق الرئيسي وال التنقل السفلي
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesDatabaseScreen(isDarkMode: widget.isDarkMode),
      const UsedPhonesMarketScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 10,
        height: 70,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.menu_book_rounded),
            selectedIcon: Icon(Icons.menu_book, color: Color(0xFF1E3A8A)),
            label: 'موسوعة الهواتف',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront, color: Color(0xFF1E3A8A)),
            label: 'سوق المستعمل (1\$)',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// قسم موسوعة الهواتف (GSMArena Style)
// ==========================================
class NewPhonesDatabaseScreen extends StatelessWidget {
  final bool isDarkMode;
  NewPhonesDatabaseScreen({super.key, required this.isDarkMode});

  final List<Map<String, dynamic>> phonesDatabase = [
    {
      'name': 'iPhone 15 Pro Max',
      'brand': 'Apple',
      'release': 'سبتمبر 2023',
      'price': '\$1199',
      'screen': '6.7 بوصة LTPO Super Retina XDR OLED (120Hz)',
      'processor': 'Apple A17 Pro (3 نانومتر)',
      'camera': 'خلفية ثلاثية: 48 م.ب + 12 م.ب + 12 م.ب',
      'battery': '4422 ميللي أمبير مع شحن سريع',
      'color': Colors.blueGrey,
    },
    {
      'name': 'Samsung Galaxy S24 Ultra',
      'brand': 'Samsung',
      'release': 'يناير 2024',
      'price': '\$1299',
      'screen': '6.8 بوصة Dynamic AMOLED 2X (120Hz)',
      'processor': 'Snapdragon 8 Gen 3 (4 نانومتر)',
      'camera': 'خلفية رباعية: 200 م.ب + 50 م.ب + 10 م.ب + 50 م.ب',
      'battery': '5000 ميللي أمبير مع شحن 45 واط',
      'color': Colors.indigo,
    },
    {
      'name': 'Xiaomi 14 Ultra',
      'brand': 'Xiaomi',
      'release': 'فبراير 2024',
      'price': '\$999',
      'screen': '6.73 بوصة LTPO AMOLED (120Hz)',
      'processor': 'Snapdragon 8 Gen 3',
      'camera': 'شراكة مع Leica - كاميرات بدقة 50 م.ب',
      'battery': '5300 ميللي أمبير مع شحن سلكي 90 واط',
      'color': Colors.deepOrange,
    },
    {
      'name': 'Poco X8 Pro',
      'brand': 'Poco',
      'release': 'إصدار حديث',
      'price': '\$350',
      'screen': '6.67 بوصة AMOLED 144Hz',
      'processor': 'MediaTek Dimensity 8300 Ultra',
      'camera': 'مزدوجة بدقة 64 م.ب بالذكاء الاصطناعي',
      'battery': '5000 ميللي أمبير',
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('موسوعة الهواتف العالمية', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                decoration: BoxDecoration(
                  color: phone['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
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
              onTap: () {
                _showPhoneDetailsDialog(context, phone);
              },
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
// قسم سوق المستعمل
// ==========================================
class UsedPhonesMarketScreen extends StatelessWidget {
  const UsedPhonesMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سوق الهواتف المستعملة (1\$)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  child: Text(
                    'ادفع \$1.00 فقط لكشف كافة وسائل التواصل الخاصة بالبائع (رقم الموبايل، والواتساب).',
                    style: TextStyle(fontSize: 13, height: 1.4),
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
                onPressed: () {
                  _showPaymentDialog(context);
                },
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم الدفع بنجاح! ظهور رقم البائع والواتساب...')),
              );
            },
            child: const Text('تأكيد (\$1.00)'),
          ),
        ],
      ),
    );
  }
}
