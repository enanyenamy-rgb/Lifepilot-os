import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String savedLang = prefs.getString('savedLang') ?? 'en';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState(isLoggedIn, savedLang)),
      ],
      child: const AiPhoneStoreApp(),
    ),
  );
}

class AppState extends ChangeNotifier {
  bool isLoggedIn;
  String currentLang;

  AppState(this.isLoggedIn, this.currentLang);

  void setLoginStatus(bool status) async {
    isLoggedIn = status;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
    notifyListeners();
  }

  void changeLanguage(String langCode) async {
    currentLang = langCode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedLang', langCode);
    notifyListeners();
  }
}

class AiPhoneStoreApp extends StatelessWidget {
  const AiPhoneStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return MaterialApp(
          title: 'Ai Phone Store',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.amber,
            scaffoldBackgroundColor: const Color(0xFF0F172A),
            colorScheme: const ColorScheme.dark(
              primary: Colors.amber,
              secondary: Colors.cyanAccent,
              surface: Color(0xFF1E293B),
            ),
            useMaterial3: true,
          ),
          home: appState.isLoggedIn ? const MainDashboardScreen() : const AuthWrapper(),
        );
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLoginView = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai Phone Store'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String lang) {
              Provider.of<AppState>(context, listen: false).changeLanguage(lang);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'en', child: Text('English (Default)')),
              const PopupMenuItem(value: 'ar', child: Text('العربية')),
              const PopupMenuItem(value: 'fr', child: Text('Français')),
              const PopupMenuItem(value: 'es', child: Text('Español')),
              const PopupMenuItem(value: 'de', child: Text('Deutsch')),
              const PopupMenuItem(value: 'zh', child: Text('中文')),
              const PopupMenuItem(value: 'ja', child: Text('日本語')),
              const PopupMenuItem(value: 'ru', child: Text('Русский')),
              const PopupMenuItem(value: 'hi', child: Text('हिन्दी')),
              const PopupMenuItem(value: 'it', child: Text('Italiano')),
              const PopupMenuItem(value: 'pt', child: Text('Português')),
              const PopupMenuItem(value: 'tr', child: Text('Türkçe')),
              const PopupMenuItem(value: 'ko', child: Text('한국어')),
              const PopupMenuItem(value: 'nl', child: Text('Nederlands')),
              const PopupMenuItem(value: 'pl', child: Text('Polski')),
              const PopupMenuItem(value: 'vi', child: Text('Tiếng Việt')),
              const PopupMenuItem(value: 'th', child: Text('ไทย')),
              const PopupMenuItem(value: 'id', child: Text('Bahasa Indonesia')),
              const PopupMenuItem(value: 'ms', child: Text('Bahasa Melayu')),
              const PopupMenuItem(value: 'fa', child: Text('فارسی')),
              const PopupMenuItem(value: 'ur', child: Text('اردو')),
              const PopupMenuItem(value: 'bn', child: Text('বাংলা')),
              const PopupMenuItem(value: 'uk', child: Text('Українська')),
              const PopupMenuItem(value: 'el', child: Text('Ελληνικά')),
              const PopupMenuItem(value: 'he', child: Text('עברית')),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_android, size: 80, color: Colors.amber),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Ai Phone Store',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Provider.of<AppState>(context, listen: false).setLoginStatus(true);
                  },
                  child: Text(isLoginView ? 'Login' : 'Register'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLoginView = !isLoginView;
                    });
                  },
                  child: Text(isLoginView
                      ? "Don't have an account? Register"
                      : "Already have an account? Login"),
                ),
                const Divider(height: 40),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Provider.of<AppState>(context, listen: false).setLoginStatus(true);
                  },
                  child: const Text('Continue as Guest (زائر)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ai Phone Store'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Provider.of<AppState>(context, listen: false).setLoginStatus(false);
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.new_releases), text: 'New Phones (جديد)'),
              Tab(icon: Icon(Icons.storefront), text: 'Used Market (مستعمل محلي)'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NewPhonesTab(),
            UsedMarketTab(),
          ],
        ),
      ),
    );
  }
}

class NewPhonesTab extends StatelessWidget {
  const NewPhonesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newPhones = [
      {
        'name': 'Samsung Galaxy S25 Ultra',
        'specs': 'Snapdragon 8 Elite, 200MP Camera, 5000mAh',
        'price': '\$1,299',
      },
      {
        'name': 'iPhone 17 Pro Max',
        'specs': 'A19 Pro Chip, 48MP Triple Camera, Titanium',
        'price': '\$1,399',
      },
      {
        'name': 'Honor X9d',
        'specs': 'Ultra Tough Display, Massive Battery, 108MP',
        'price': '\$450',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: newPhones.length,
      itemBuilder: (context, index) {
        final phone = newPhones[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.phone_android, size: 35, color: Colors.amber),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(phone['name']!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(phone['specs']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 6),
                      Text(phone['price']!, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle_fill, color: Colors.amber, size: 30),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('جارٍ فتح صور وفيديوهات ومراجعات الهاتف العالمية...')),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UsedMarketTab extends StatelessWidget {
  const UsedMarketTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> usedListings = [
      {
        'phone': 'iPhone 15 Pro (مستعمل)',
        'price': '\$750',
        'location': 'نفس الدولة (محلي)',
        'seller': 'أحمد م.',
      },
      {
        'phone': 'Samsung S24 Ultra (مستعمل)',
        'price': '\$850',
        'location': 'نفس الدولة (محلي)',
        'seller': 'محمود س.',
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: usedListings.length,
        itemBuilder: (context, index) {
          final item = usedListings[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: const Color(0xFF1E293B),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['phone'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(item['price'], style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.redAccent),
                      const SizedBox(width: 5),
                      Text(item['location'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '🔒 البائع موثق (تم إرسال صورة الهوية للحكومة لحفظ حقوق الطرفين)',
                    style: TextStyle(color: Colors.amber, fontSize: 11),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent, foregroundColor: Colors.black),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('إظهار بيانات التواصل (اشتراك 1 دولار)'),
                            content: const Text(
                              'لفتح بيانات التواصل المباشر مع البائع وحماية حقوقك، يرجى دفع رسوم اشتراك رمزية بقيمة 1 دولار لصالح التطبيق.\n\nملاحظة: تم فحص الهوية الرسمية للبائع وحفظها للطوارئ.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('إلغاء'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('تم الدفع بنجاح! ظهرت بيانات التواصل الخاصة بالبائع.')),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('دفع 1 دولار لإظهار أدوات التواصل مع البائع'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add_a_photo),
        label: const Text('اعرض هاتفك للبيع (مع توثيق الهوية)'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('إضافة إعلان هاتف مستعمل'),
              content: const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(decoration: InputDecoration(labelText: 'اسم الهاتف ومواصفاته')),
                    SizedBox(height: 10),
                    TextField(decoration: InputDecoration(labelText: 'السعر')),
                    SizedBox(height: 10),
                    TextField(decoration: InputDecoration(labelText: 'الدولة والمدينة (نفس الدولة حصراً)')),
                    SizedBox(height: 15),
                    Text(
                      'إجباري: يرجى رفع صورة مسحوبة (Scan) من أصل الهوية الرسمية لحفظها سرياً لتسليمها للحكومة في حال حدوث أي احتيال.',
                      style: TextStyle(color: Colors.redAccent, fontSize: 12),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('إلغاء')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم إرسال الإعلان والهوية وتوثيق البائع بنجاح!')),
                    );
                  },
                  child: const Text('نشر الإعلان'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
