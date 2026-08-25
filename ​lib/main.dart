import 'package:flutter/material.dart';

void main() {
  runApp(const PhoneHubApp());
}

// Global state for language selection (Default is English)
ValueNotifier<String> currentLanguage = ValueNotifier<String>('English');

class PhoneHubApp extends StatelessWidget {
  const PhoneHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentLanguage,
      builder: (context, lang, child) {
        return MaterialApp(
          title: 'PhoneHub Pro',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1F1F1F),
              elevation: 0,
            ),
          ),
          home: const MainHomeScreen(),
        );
      },
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ExploreBrandsScreen(),
    const CompareScreen(),
    const UsedMarketScreen(), // القسم الجديد لبيع المستعمل حسب الدولة والشروط
    const NewsAndVideosScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1F1F1F),
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Brands',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Compare',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Used Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// 1. Explore Brands Screen (English Base)
class ExploreBrandsScreen extends StatelessWidget {
  const ExploreBrandsScreen({super.key});

  final List<Map<String, String>> brands = const [
    {'name': 'Apple', 'models': '120+ Devices'},
    {'name': 'Samsung', 'models': '350+ Devices'},
    {'name': 'Xiaomi', 'models': '280+ Devices'},
    {'name': 'Honor', 'models': '90+ Devices'},
    {'name': 'Oppo', 'models': '150+ Devices'},
    {'name': 'Vivo', 'models': '130+ Devices'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Mobile Brands'),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.orangeAccent),
            onPressed: () {},
            tooltip: 'Voice Search',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search any smartphone or specs...',
                prefixIcon: const Icon(Icons.search, color: Colors.orangeAccent),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            brands[index]['name']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            brands[index]['models']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
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

// 2. Compare Screen
class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Comparison')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.compare, size: 80, color: Colors.orangeAccent),
            const SizedBox(height: 20),
            const Text(
              'Select two devices to compare side by side',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Devices to Compare'),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Used Market Screen (قسم بيع المستعمل حسب الدولة وشروط الأمان والرسوم)
class UsedMarketScreen extends StatefulWidget {
  const UsedMarketScreen({super.key});

  @override
  State<UsedMarketScreen> createState() => _UsedMarketScreenState();
}

class _UsedMarketScreenState extends State<UsedMarketScreen> {
  String selectedCountry = 'Egypt'; // الدولة الافتراضية كمثال للمقيمين

  final List<String> countries = ['Egypt', 'Saudi Arabia', 'UAE', 'USA', 'UK', 'Germany', 'France'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Used Market ($selectedCountry)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.orangeAccent),
            tooltip: 'Sell Your Phone',
            onPressed: () {
              // فتح نافذة إضافة إعلان مع شروط الهوية والسعر الكامل
              _showSellPhoneModal(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // شريط اختيار الدولة للمقيمين فقط
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF1E1E1E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select Your Resident Country:', style: TextStyle(color: Colors.grey)),
                DropdownButton<String>(
                  value: selectedCountry,
                  dropdownColor: const Color(0xFF2C2C2C),
                  style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                  items: countries.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'iPhone 14 Pro Max - 256GB (Used #${index + 1})',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Chip(
                              label: Text('Verified Seller', style: TextStyle(fontSize: 10)),
                              backgroundColor: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Specs: Excellent condition, battery health 88%, with original box and accessories.',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price: [Hidden until \$1 fee is paid]',
                              style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                // دفع 1 دولار لإظهار السعر الحقيقي للمشتري
                                _showUnlockPriceDialog(context);
                              },
                              child: const Text('Pay \$1 to Reveal Price'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // نافذة دفع 1 دولار لإظهار السعر
  void _showUnlockPriceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Unlock Phone Price', style: TextStyle(color: Colors.orangeAccent)),
        content: const Text(
          'To view the exact price set by the seller and contact them securely, a small fee of \$1 applies to support the platform.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment successful! Price revealed: \$650')),
              );
            },
            child: const Text('Pay \$1.00 Now'),
          ),
        ],
      ),
    );
  }

  // نافذة إضافة إعلان مع رفع الهوية وسرية البيانات
  void _showSellPhoneModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Post Used Phone Ad', style: TextStyle(color: Colors.orangeAccent)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Phone Model & Full Specs'),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Asking Price (USD / Local Currency)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: const Text(
                  'Security Notice: Mandatory ID/Passport verification is required for sellers to prevent fraud. Your ID is strictly encrypted, hidden from buyers, and only accessible by official legal authorities if requested.',
                  style: TextStyle(fontSize: 11, color: Colors.redAccent),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                onPressed: () {
                  // محاكاة رفع اثبات الهوية للبائع
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('ID Document Uploaded Securely for Anti-Fraud Compliance.')),
                  );
                },
                icon: const Icon(Icons.upload_file, color: Colors.orange),
                label: const Text('Upload Secure ID Verification'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ad submitted successfully after security check!')),
              );
            },
            child: const Text('Publish Ad'),
          ),
        ],
      ),
    );
  }
}

// 4. News & Videos Screen
class NewsAndVideosScreen extends StatelessWidget {
  const NewsAndVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latest News & Video Reviews')),
      body: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: const Center(
                    child: Icon(Icons.play_circle_fill, size: 64, color: Colors.orangeAccent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comprehensive Review & Camera Test for Flagship Device #${index + 1}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Aggregated from top global tech coverage and video sources...',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 5. Settings & 25 Global Languages Selection Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  final List<String> globalLanguages = const [
    'English (Default)',
    'Arabic (العربية)',
    'Spanish (Español)',
    'French (Français)',
    'German (Deutsch)',
    'Chinese (中文)',
    'Hindi (हिन्दी)',
    'Russian (Русский)',
    'Portuguese (Português)',
    'Japanese (日本語)',
    'Korean (한국어)',
    'Italian (Italiano)',
    'Turkish (Türkçe)',
    'Urdu (اردو)',
    'Persian (فارسی)',
    'Indonesian (Bahasa Indonesia)',
    'Vietnamese (Tiếng Việt)',
    'Polish (Polski)',
    'Dutch (Nederlands)',
    'Greek (Ελληνικά)',
    'Swedish (Svenska)',
    'Czech (Čeština)',
    'Romanian (Română)',
    'Hungarian (Magyar)',
    'Thai (ไทย)',
  ];

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text('Select Language (Top 25)', style: TextStyle(color: Colors.orangeAccent)),
          content: SizedBox(
            width: double.maxFinite,
            height: 350,
            child: ListView.builder(
              itemCount: globalLanguages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(globalLanguages[index], style: const TextStyle(color: Colors.white)),
                  onTap: () {
                    currentLanguage.value = globalLanguages[index];
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Language changed to: ${globalLanguages[index]}')),
                    );
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close', style: TextStyle(color: Colors.orange)),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Settings')),
      body: ListView(
        children: [
          ValueListenableBuilder<String>(
            valueListenable: currentLanguage,
            builder: (context, lang, child) {
              return ListTile(
                leading: const Icon(Icons.language, color: Colors.orangeAccent),
                title: const Text('Language (25 Global Languages)'),
                subtitle: Text('Current: $lang'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showLanguageDialog(context),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.cloud_sync, color: Colors.orangeAccent),
            title: Text('Global Database Sync'),
            subtitle: Text('Auto-synced with international tech databases'),
          ),
          const ListTile(
            leading: Icon(Icons.info, color: Colors.orangeAccent),
            title: Text('About PhoneHub Pro'),
            subtitle: Text('Professional Edition v1.0.0'),
          ),
        ],
      ),
    );
  }
}
