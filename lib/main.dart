import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AiPhoneStoreApp());
}

class AiPhoneStoreApp extends StatelessWidget {
  const AiPhoneStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Phone Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      home: const WelcomeAuthScreen(),
    );
  }
}

// ==========================================
// شاشة الدخول الأولى (تسجيل أو زائر)
// ==========================================
class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F46E5), Color(0xFF7C3AED), Color(0xFF9333EA)],
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
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.smartphone_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'منصتك الذكية الأولى لعالم الهواتف الجديدة والمستعملة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4F46E5),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      _showAuthBottomSheet(context);
                    },
                    child: const Text(
                      'تسجيل الدخول / حساب جديد',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 2),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNavigationScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'الدخول كزائر (تصفح سريع)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 24,
          right: 24,
          top: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحباً بك مجدداً',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1F2937)),
            ),
            const SizedBox(height: 8),
            const Text('أدخل بياناتك للمتابعة إلى حسابك الشخصي', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationScreen(),
                    ),
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
// التطبيق الرئيسي بعد الدخول
// ==========================================
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String _currentLanguage = 'العربية';

  final List<String> _languages = [
    'العربية', 'English', 'Français', 'Español', 'Deutsch',
    'Italiano', 'Português', 'Русский', '中文', '日本語',
    '한국어', 'हिन्दी', 'Türkçe', 'فارسی', 'Urdu',
    'Bahasa', 'Tiếng Việt', 'ภาษาไทย', 'Polski', 'Nederlands',
    'Svenska', 'Ελληνικά', 'Magyar', 'Română', 'Dansk'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesScreen(
        currentLanguage: _currentLanguage,
        languages: _languages,
        onLangChanged: (val) => setState(() => _currentLanguage = val!),
      ),
      const UsedPhonesScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 10,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF4F46E5).withOpacity(0.15),
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.cloud_outlined),
            selectedIcon: Icon(Icons.cloud, color: Color(0xFF4F46E5)),
            label: 'الهواتف الجديدة',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront, color: Color(0xFF4F46E5)),
            label: 'سوق المستعمل',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الأول: الهواتف الجديدة (سحابي مجاني)
// ==========================================
class NewPhonesScreen extends StatelessWidget {
  final String currentLanguage;
  final List<String> languages;
  final ValueChanged<String?> onLangChanged;

  const NewPhonesScreen({
    super.key,
    required this.currentLanguage,
    required this.languages,
    required this.onLangChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'أحدث الهواتف (سحابي مجاني)',
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Color(0xFF4F46E5)),
            onSelected: onLangChanged,
            itemBuilder: (context) => languages.map((l) => PopupMenuItem(value: l, child: Text(l))).toList(),
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
              gradient: const LinearGradient(colors: [Color(0xFF4F46E5), Color(0xFF6366F1)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'تصفح أحدث الموبايلات العالمية مع تحديثات سحابية فورية ومجانية بالكامل.',
                    style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildPhoneCard('Poco X8 Pro', 'إصدار عالمي جديد', '\$350', 'Dimensity 8300 Ultra | شاشة AMOLED 144Hz', Icons.phone_iphone),
          _buildPhoneCard('Honor X9d', 'أداء استثنائي', '\$400', 'Snapdragon 6 Gen 1 | بطارية 5800mAh', Icons.bolt),
        ],
      ),
    );
  }

  Widget _buildPhoneCard(String name, String sub, String price, String specs, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF4F46E5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4F46E5), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Text(specs, style: const TextStyle(fontSize: 12, color: Color(0xFF475569))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// القسم الثاني: سوق الهواتف المستعملة (1 دولار)
// ==========================================
class UsedPhonesScreen extends StatelessWidget {
  const UsedPhonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'سوق الهواتف المستعملة',
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.lock_person_rounded, color: Colors.amber.shade800, size: 28),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'احصل على جميع وسائل تواصل البائع (رقم الهاتف، واتساب، الأماكن) مقابل \$1.00 فقط بكل أمان.',
                    style: TextStyle(fontSize: 13, color: Color(0xFF92400E), height: 1.4),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.security, size: 16, color: Colors.redAccent),
                SizedBox(width: 8),
                Text('وسائل التواصل (هاتف وواتساب) مشفرة ومخفية', style: TextStyle(fontSize: 12, color: Colors.redAccent)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => _showPaymentDialog(context),
              icon: const Icon(Icons.lock_open, size: 18),
              label: const Text('ادفع \$1.00 لكشف وسائل التواصل بالكامل'),
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
        title: const Text('تأكيد الدفع الآمن'),
        content: const Text('هل تريد دفع \$1.00 لفتح جميع بيانات التواصل (رقم الهاتف والواتساب ومواقع البائع) فوراً؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم الدفع بنجاح! ظهور بيانات البائع الآن...')),
              );
            },
            child: const Text('تأكيد (\$1.00)'),
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
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          onPressed: () => SystemNavigator.pop(),
          child: const Text('خروج نهائي'),
        ),
      ],
    ),
  );
}
