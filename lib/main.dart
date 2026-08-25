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

class PhoneModel {
  final String name;
  final String brand;
  final String price;
  final String specs;
  final String aiVerdict;

  PhoneModel({required this.name, required this.brand, required this.price, required this.specs, required this.aiVerdict});
}

class UsedPhoneItem {
  final String phoneName;
  final String price;
  final String location;
  final String details;

  UsedPhoneItem({required this.phoneName, required this.price, required this.location, required this.details});
}

class AppState extends ChangeNotifier {
  bool isLoggedIn;
  String currentLang;
  String aiSearchQuery = '';
  String aiResponse = '';
  bool isSearchingAi = false;

  List<UsedPhoneItem> userListings = [
    UsedPhoneItem(phoneName: 'iPhone 15 Pro', price: '\$750', location: 'Local Country', details: 'Mint condition, 256GB, battery 90%'),
    UsedPhoneItem(phoneName: 'Samsung S24 Ultra', price: '\$850', location: 'Local Country', details: 'Like new with box and warranty'),
  ];

  final List<PhoneModel> allPhones = [
    PhoneModel(name: 'Galaxy S25 Ultra', brand: 'Samsung', price: '\$1,299', specs: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh', aiVerdict: 'Top pick for photography and ultimate performance in 2026.'),
    PhoneModel(name: 'Galaxy S25+', brand: 'Samsung', price: '\$999', specs: 'Exynos/Snapdragon | 50MP Triple Cam | 4900mAh', aiVerdict: 'Great balanced flagship with premium battery life.'),
    PhoneModel(name: 'iPhone 17 Pro Max', brand: 'Apple', price: '\$1,399', specs: 'A19 Pro Chip | 48MP Triple Lens | Titanium', aiVerdict: 'Apple ultimate powerhouse with advanced AI neural engine.'),
    PhoneModel(name: 'iPhone 17 Pro', brand: 'Apple', price: '\$1,099', specs: 'A19 Pro | ProMotion 120Hz | Compact design', aiVerdict: 'Best ergonomic pro phone for daily intensive usage.'),
    PhoneModel(name: 'Xiaomi 14 Ultra', brand: 'Xiaomi', specs: 'Leica Quad Camera | 1-inch Sensor | Snapdragon 8 Gen 3', price: '\$1,199', aiVerdict: 'Unmatched professional photography and optics.'),
    PhoneModel(name: 'Honor X9d', brand: 'Honor', price: '\$450', specs: 'Ultra Tough Display | Massive Battery | 108MP', aiVerdict: 'Best durability and battery endurance under \$500.'),
    PhoneModel(name: 'Pixel 9 Pro XL', brand: 'Google', price: '\$1,099', specs: 'Tensor G4 | Gemini Advanced AI | 16GB RAM', aiVerdict: 'Smartest AI integration and cleanest Android experience.'),
  ];

  AppState(this.isLoggedIn, this.currentLang);

  void setAiQuery(String query) {
    aiSearchQuery = query;
    if (query.isNotEmpty) {
      isSearchingAi = true;
      notifyListeners();
      // محاكاة استجابة الذكاء الاصطناعي الفورية والبحث العميق
      Future.delayed(const Duration(milliseconds: 600), () {
        final match = allPhones.where((p) => p.name.toLowerCase().contains(query.toLowerCase()) || p.brand.toLowerCase().contains(query.toLowerCase())).toList();
        if (match.isNotEmpty) {
          aiResponse = "AI Found ${match.length} result(s) for '$query':\n• ${match.first.name} (${match.first.price}) -> ${match.first.aiVerdict}";
        } else {
          aiResponse = "AI Assistant: No exact match found for '$query', but our global database covers Samsung, Apple, Xiaomi, and Honor.";
        }
        isSearchingAi = false;
        notifyListeners();
      });
    } else {
      aiResponse = '';
      notifyListeners();
    }
  }

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Local Country', details: details));
    notifyListeners();
  }

  final Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'Ai Phone Store Pro',
      'login': 'Secure Login',
      'email': 'Email Address',
      'password': 'Password',
      'guest': 'Explore as Guest',
      'newPhones': 'Global Releases & AI',
      'usedMarket': 'Secure Used Market',
      'selectLang': 'Select Language',
      'sellPhone': 'List Your Phone for Sale',
      'searchAi': 'Ask AI Assistant or search phones...',
      'phoneName': 'Phone Model Name',
      'price': 'Price (\$)',
      'details': 'Condition & Specs',
      'submit': 'Publish Listing',
    },
    'ar': {
      'title': 'متجر الهواتف الذكي برو',
      'login': 'تسجيل الدخول الآمن',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'guest': 'تصفح كزائر',
      'newPhones': 'الإصدارات والذكاء الاصطناعي',
      'usedMarket': 'سوق المستعمل الآمن',
      'selectLang': 'اختر لغة التطبيق',
      'sellPhone': 'إضافة هاتفك للبيع',
      'searchAi': 'ابحث بالذكاء الاصطناعي عن أي هاتف...',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة',
      'submit': 'نشر الإعلان',
    },
    'es': { 'title': 'Tienda IA Pro', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Invitado', 'newPhones': 'Nuevos & IA', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchAi': 'Preguntar a la IA...', 'phoneName': 'Modelo', 'price': 'Precio', 'details': 'Detalles', 'submit': 'Publicar' },
    'fr': { 'title': 'Boutique IA Pro', 'login': 'Connexion', 'email': 'E-mail', 'password': 'Mot de passe', 'guest': 'Invité', 'newPhones': 'Nouveautés & IA', 'usedMarket': 'Occasion', 'selectLang': 'Langue', 'sellPhone': 'Vendre', 'searchAi': 'Recherche IA...', 'phoneName': 'Modèle', 'price': 'Prix', 'details': 'Détails', 'submit': 'Publier' },
  };

  String getText(String key) {
    return translations[currentLang]?[key] ?? translations['en']![key]!;
  }

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
          title: 'Ai Phone Store Pro',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFFF59E0B),
            scaffoldBackgroundColor: const Color(0xFF070B14),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFF59E0B),
              secondary: Color(0xFF38BDF8),
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

void showLanguageDialog(BuildContext context) {
  final appState = Provider.of<AppState>(context, listen: false);
  final languages = {'en': 'English', 'ar': 'العربية', 'es': 'Español', 'fr': 'Français'};

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(appState.getText('selectLang'), style: const TextStyle(color: Colors.amber)),
        content: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              String key = languages.keys.elementAt(index);
              return ListTile(
                title: Text(languages[key]!, style: const TextStyle(color: Colors.white)),
                onTap: () {
                  appState.changeLanguage(key);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      );
    },
  );
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF070B14), Color(0xFF1E1B4B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amber.withOpacity(0.12),
                      border: Border.all(color: Colors.amber, width: 2),
                    ),
                    child: const Icon(Icons.bolt, size: 75, color: Colors.amber),
                  ),
                  const SizedBox(height: 25),
                  Text(appState.getText('title'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                  const SizedBox(height: 35),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: appState.getText('email'),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                      prefixIcon: const Icon(Icons.email, color: Colors.amber),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: appState.getText('password'),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                      prefixIcon: const Icon(Icons.lock, color: Colors.amber),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () => appState.setLoginStatus(true),
                    child: Text(appState.getText('login'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      side: const BorderSide(color: Colors.amber),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () => appState.setLoginStatus(true),
                    child: Text(appState.getText('guest'), style: const TextStyle(fontSize: 16, color: Colors.amber)),
                  ),
                  const SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () => showLanguageDialog(context),
                    icon: const Icon(Icons.language, color: Colors.cyanAccent),
                    label: Text(appState.getText('selectLang'), style: const TextStyle(color: Colors.cyanAccent)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    final List<Widget> pages = [
      const GlobalPhonesAiTab(),
      const UsedMarketTab(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(appState.getText('title'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.amber),
            onPressed: () => showLanguageDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () => appState.setLoginStatus(false),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0F172A),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.auto_awesome),
            label: appState.getText('newPhones'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.storefront),
            label: appState.getText('usedMarket'),
          ),
        ],
      ),
    );
  }
}

// نافذة تفاصيل الهاتف الاحترافية
void showPhoneDetailsDialog(BuildContext context, PhoneModel phone) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(phone.name, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: const Center(
                  child: Icon(Icons.smartphone, size: 70, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 14),
              Text('Brand: ${phone.brand}', style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text('Price: ${phone.price}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent)),
              const Divider(height: 20, color: Colors.grey),
              const Text('Specifications:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 4),
              Text(phone.specs, style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 12),
              const Text('AI Verdict & Review:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              const SizedBox(height: 4),
              Text(phone.aiVerdict, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

// تبويب الهواتف العالمية مع محرك البحث الذكي للذكاء الاصطناعي
class GlobalPhonesAiTab extends StatelessWidget {
  const GlobalPhonesAiTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // شريط البحث الذكي للذكاء الاصطناعي
          TextField(
            onChanged: (val) => appState.setAiQuery(val),
            decoration: InputDecoration(
              hintText: appState.getText('searchAi'),
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.auto_awesome, color: Colors.amber),
            ),
          ),
          const SizedBox(height: 14),
          // نافذة رد الذكاء الاصطناعي عند البحث
          if (appState.aiSearchQuery.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1B4B),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.withOpacity(0.4)),
              ),
              child: appState.isSearchingAi
                  ? const Center(child: CircularProgressIndicator(color: Colors.amber))
                  : Text(appState.aiResponse, style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4)),
            ),
          if (appState.aiSearchQuery.isNotEmpty) const SizedBox(height: 14),
          // قائمة الهواتف العالمية العصرية
          Expanded(
            child: ListView.builder(
              itemCount: appState.allPhones.length,
              itemBuilder: (context, index) {
                final phone = appState.allPhones[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.amber.withOpacity(0.2)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Container(
                      padding: const PhoneModelPadding(),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.phone_android, color: Colors.amber, size: 28),
                    ),
                    title: Text(phone.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                    subtitle: Text('${phone.brand} • ${phone.price}', style: const TextStyle(color: Colors.cyanAccent, fontSize: 13)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () => showPhoneDetailsDialog(context, phone),
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

// مساعدة تصميمية بسيطة
class PhoneModelPadding extends EdgeInsets {
  const PhoneModelPadding() : super.all(8);
}

// سوق المستعمل الآمن
class UsedMarketTab extends StatelessWidget {
  const UsedMarketTab({super.key});

  void showAddListingDialog(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController detailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          title: Text(appState.getText('sellPhone'), style: const TextStyle(color: Colors.amber)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: appState.getText('phoneName')),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: appState.getText('price')),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: detailsController,
                  decoration: InputDecoration(labelText: appState.getText('details')),
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
              onPressed: () {
                if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
                  appState.addListing(nameController.text, '\$${priceController.text}', detailsController.text);
                  Navigator.pop(context);
                }
              },
              child: Text(appState.getText('submit')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF070B14),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: appState.userListings.length,
        itemBuilder: (context, index) {
          final item = appState.userListings[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.cyanAccent.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.phoneName, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(item.price, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(item.details, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.verified_user, size: 16, color: Colors.amber),
                    SizedBox(width: 6),
                    Text('Verified Global Seller & Secure Escrow', style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add_photo_alternate),
        label: Text(appState.getText('sellPhone')),
        onPressed: () => showAddListingDialog(context),
      ),
    );
  }
}
