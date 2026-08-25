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
        useMaterial3: true,
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          primary: const Color(0xFF6366F1),
          secondary: const Color(0xFF8B5CF6),
        ),
      ),
      home: const WelcomeAuthScreen(),
    );
  }
}

// ==========================================
// شاشة الدخول والتسجيل الفاخرة
// ==========================================
class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

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
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                  ),
                  child: const Icon(Icons.phone_android_rounded, size: 75, color: Colors.white),
                ),
                const SizedBox(height: 24),
                const Text(
                  'AI Phone Store',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
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
                  height: 54,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4338CA),
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => _showAuthBottomSheet(context),
                    child: const Text('تسجيل الدخول / إنشاء حساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainNavigationScreen(isGuest: true)),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 24, right: 24, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('تسجيل الدخول', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
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
                    MaterialPageRoute(builder: (context) => const MainNavigationScreen(isGuest: false)),
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
  final bool isGuest;
  const MainNavigationScreen({super.key, required this.isGuest});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String _currentLang = 'ar'; // افتراضياً العربية

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      NewPhonesScreen(currentLang: _currentLang, onLangChanged: (lang) => setState(() => _currentLang = lang)),
      UsedPhonesScreen(currentLang: _currentLang),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        elevation: 8,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF6366F1).withOpacity(0.2),
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.cloud_outlined),
            selectedIcon: const Icon(Icons.cloud, color: Color(0xFF6366F1)),
            label: _currentLang == 'ar' ? 'الهواتف الجديدة' : 'New Phones',
          ),
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined),
            selectedIcon: const Icon(Icons.storefront, color: Color(0xFF6366F1)),
            label: _currentLang == 'ar' ? 'سوق المستعمل' : 'Used Market',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// قسم الهواتف الجديدة (سحابي متفاعل ومترجم بالكامل)
// ==========================================
class NewPhonesScreen extends StatelessWidget {
  final String currentLang;
  final ValueChanged<String> onLangChanged;

  const NewPhonesScreen({super.key, required this.currentLang, required this.onLangChanged});

  // قاموس الترجمة الفوري للغات
  String _t(String key) {
    Map<String, Map<String, String>> translations = {
      'ar': {
        'title': 'أحدث الهواتف (سحابي مجاني)',
        'banner': 'تصفح أحدث الموبايلات العالمية مع تحديثات سحابية فورية ومجانية بالكامل.',
        'details': 'عرض المواصفات الكاملة',
        'price': 'السعر:',
      },
      'en': {
        'title': 'Latest Phones (Cloud Free)',
        'banner': 'Browse the latest global smartphones with instant cloud updates for free.',
        'details': 'View Full Specs',
        'price': 'Price:',
      },
      'fr': {
        'title': 'Derniers téléphones (Cloud Gratuit)',
        'banner': 'Parcourez les derniers smartphones avec des mises à jour cloud instantanées.',
        'details': 'Voir les spécifications',
        'price': 'Prix:',
      }
    };
    return translations[currentLang]?[key] ?? translations['ar']![key]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(_t('title'), style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 17)),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Color(0xFF4338CA)),
            onSelected: (lang) => onLangChanged(lang),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'ar', child: Text('العربية (Arabic)')),
              PopupMenuItem(value: 'en', child: Text('English (الإنجليزية)')),
              PopupMenuItem(value: 'fr', child: Text('Français (الفرنسية)')),
            ],
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
          // المربع العلوي التفاعلي بالكامل (فعال عند الضغط)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم تحديث البيانات السحابية بنجاح!')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF4338CA), Color(0xFF6366F1)]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.indigo.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.cloud_sync_rounded, color: Colors.white, size: 32),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        _t('banner'),
                        style: const TextStyle(color: Colors.white, fontSize: 13.5, height: 1.4, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildPhoneCard('Poco X8 Pro', 'Dimensity 8300 Ultra | 144Hz AMOLED', '\$350', Icons.phone_android),
          _buildPhoneCard('Honor X9d', 'Snapdragon 6 Gen 1 | 5800mAh', '\$400', Icons.star_rounded),
        ],
      ),
    );
  }

  Widget _buildPhoneCard(String name, String specs, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF6366F1), size: 28),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                      child: Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(specs, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// قسم سوق المستعمل (مع نظام الـ 1 دولار)
// ==========================================
class UsedPhonesScreen extends StatelessWidget {
  final String currentLang;
  const UsedPhonesScreen({super.key, required this.currentLang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          currentLang == 'ar' ? 'سوق الهواتف المستعملة' : 'Used Phones Market',
          style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 17),
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
                Expanded(
                  child: Text(
                    currentLang == 'ar'
                        ? 'ادفع \$1.00 فقط لكشف كافة وسائل التواصل (رقم الهاتف، واتساب، الأماكن) الخاصة بالبائع بكل أمان.'
                        : 'Pay only \$1.00 to safely reveal all seller contact methods (Phone, WhatsApp, Locations).',
                    style: const TextStyle(fontSize: 13, color: Color(0xFF92400E), height: 1.4),
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
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
            decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Icon(Icons.security, size: 16, color: Colors.redAccent),
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
            height: 46,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4338CA),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => _showPaymentDialog(context),
              icon: const Icon(Icons.lock_open, size: 18),
              label: Text(currentLang == 'ar' ? 'ادفع \$1.00 لكشف وسائل التواصل بالكامل' : 'Pay \$1.00 to Unlock Contacts'),
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
        title: Text(currentLang == 'ar' ? 'تأكيد الدفع الآمن' : 'Secure Payment Confirmation'),
        content: Text(
          currentLang == 'ar'
              ? 'هل تريد دفع \$1.00 لفتح جميع بيانات التواصل (رقم الهاتف والواتساب ومواقع البائع) فوراً؟'
              : 'Do you want to pay \$1.00 to immediately unlock all contact details?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(currentLang == 'ar' ? 'إلغاء' : 'Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(currentLang == 'ar' ? 'تم الدفع بنجاح! ظهور بيانات البائع الآن...' : 'Payment successful! Showing seller contacts...')),
              );
            },
            child: Text(currentLang == 'ar' ? 'تأكيد (\$1.00)' : 'Confirm (\$1.00)'),
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
