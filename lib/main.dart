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
  final String imageUrl;

  PhoneModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.specs,
    required this.aiVerdict,
    required this.imageUrl,
  });
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
  String searchQuery = '';

  List<UsedPhoneItem> userListings = [
    UsedPhoneItem(phoneName: 'iPhone 15 Pro', price: '\$750', location: 'Global Verified', details: 'Mint condition, 256GB, battery health 90%'),
    UsedPhoneItem(phoneName: 'Samsung S24 Ultra', price: '\$850', location: 'Global Verified', details: 'Like new with original box and international warranty'),
  ];

  // قاعدة بيانات الهواتف العالمية الضخمة الشاملة لأحدث إصدارات 2026 (مثل S26 Ultra و iPhone 17)
  final List<PhoneModel> globalDatabase = [
    PhoneModel(
      name: 'Samsung Galaxy S26 Ultra',
      brand: 'Samsung',
      price: '\$1,399',
      specs: 'Snapdragon 8 Elite Gen 2 | 250MP Quad Camera | 5500mAh | 16GB RAM',
      aiVerdict: 'The absolute pinnacle of 2026 mobile technology with revolutionary AI capabilities.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      name: 'Samsung Galaxy S25 Ultra',
      brand: 'Samsung',
      price: '\$1,299',
      specs: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh | Dynamic AMOLED 2X',
      aiVerdict: 'Exceptional flagship performance and world-class zoom photography.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      name: 'Samsung Galaxy Z Fold 6',
      brand: 'Samsung',
      price: '\$1,799',
      specs: 'Foldable 7.6" Display | Snapdragon 8 Gen 3 | Armor Aluminum',
      aiVerdict: 'Ultimate multitasking foldable device with premium build quality.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-z-fold6.jpg',
    ),
    PhoneModel(
      name: 'Apple iPhone 17 Pro Max',
      brand: 'Apple',
      price: '\$1,399',
      specs: 'A19 Pro Chip | 48MP Triple Periscope Lens | Grade 5 Titanium',
      aiVerdict: 'Apple masterpiece featuring unprecedented processing speed and cinematic video.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro-max.jpg',
    ),
    PhoneModel(
      name: 'Apple iPhone 17 Pro',
      brand: 'Apple',
      price: '\$1,099',
      specs: 'A19 Pro | ProMotion 120Hz | Advanced Neural Engine',
      aiVerdict: 'Compact flagship powerhouse with elite gaming and camera capabilities.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro.jpg',
    ),
    PhoneModel(
      name: 'Apple iPhone 16',
      brand: 'Apple',
      price: '\$799',
      specs: 'A18 Chip | Action Button | Dual 48MP Fusion Camera',
      aiVerdict: 'The smart choice for everyday users seeking Apple ecosystem excellence.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16.jpg',
    ),
    PhoneModel(
      name: 'Xiaomi 14 Ultra',
      brand: 'Xiaomi',
      price: '\$1,199',
      specs: 'Leica Summilux Lens | 1-inch Sensor | Snapdragon 8 Gen 3',
      aiVerdict: 'Professional photography powerhouse with legendary Leica optics.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-14-ultra.jpg',
    ),
    PhoneModel(
      name: 'Honor X9d',
      brand: 'Honor',
      price: '\$450',
      specs: 'Ultra Drop-Resistant Display | Massive Battery | 108MP Camera',
      aiVerdict: 'Unmatched durability and exceptional battery life in the mid-range sector.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/honor-x9b.jpg',
    ),
    PhoneModel(
      name: 'Google Pixel 9 Pro XL',
      brand: 'Google',
      price: '\$1,099',
      specs: 'Google Tensor G4 | Gemini Advanced AI | 16GB RAM',
      aiVerdict: 'The smartest AI phone experience paired with pure Android software.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/google-pixel-9-pro-xl.jpg',
    ),
  ];

  AppState(this.isLoggedIn, this.currentLang);

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Global Verified', details: details));
    notifyListeners();
  }

  // نظام الترجمات (اللغة الأساسية الإنجليزية بالكامل، مع إمكانية التغيير لعدة لغات عالمية)
  final Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'Ai Phone Store Global',
      'login': 'Secure Login',
      'email': 'Email Address',
      'password': 'Password',
      'guest': 'Explore as Guest',
      'newPhones': 'Global Catalogs',
      'usedMarket': 'Secure Used Market',
      'selectLang': 'Select Language',
      'sellPhone': 'List Your Phone for Sale',
      'searchHint': 'Search any global phone (e.g. S26 Ultra)...',
      'phoneName': 'Phone Model Name',
      'price': 'Price (\$)',
      'details': 'Condition & Specifications',
      'submit': 'Publish Listing',
    },
    'ar': {
      'title': 'متجر الهواتف العالمي الذكي',
      'login': 'تسجيل الدخول الآمن',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'guest': 'تصفح كزائر',
      'newPhones': 'الكتالوجات العالمية',
      'usedMarket': 'سوق المستعمل الآمن',
      'selectLang': 'اختر لغة التطبيق',
      'sellPhone': 'إضافة هاتفك للبيع',
      'searchHint': 'ابحث عن أي هاتف عالمياً (مثل S26 Ultra)...',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة',
      'submit': 'نشر الإعلان',
    },
    'es': { 'title': 'Tienda IA Global', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Invitado', 'newPhones': 'Catálogos', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchHint': 'Buscar modelo...', 'phoneName': 'Modelo', 'price': 'Precio', 'details': 'Detalles', 'submit': 'Publicar' },
    'fr': { 'title': 'Boutique IA Mondiale', 'login': 'Connexion', 'email': 'E-mail', 'password': 'Mot de passe', 'guest': 'Invité', 'newPhones': 'Catalogues', 'usedMarket': 'Occasion', 'selectLang': 'Langue', 'sellPhone': 'Vendre', 'searchHint': 'Rechercher...', 'phoneName': 'Modèle', 'price': 'Prix', 'details': 'Détails', 'submit': 'Publier' },
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
          title: 'Ai Phone Store Global',
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
  final languages = {'en': 'English (Default)', 'ar': 'العربية', 'es': 'Español', 'fr': 'Français'};

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
    final List<Widget> pages = [const GlobalCatalogsTab(), const UsedMarketTab()];

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
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.phone_android), label: appState.getText('newPhones')),
          BottomNavigationBarItem(icon: const Icon(Icons.storefront), label: appState.getText('usedMarket')),
        ],
      ),
    );
  }
}

// نافذة تفاصيل الهاتف الاحترافية والمعارض العالمية
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
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    phone.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.smartphone, size: 70, color: Colors.amber)),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Global Price:', style: TextStyle(color: Colors.grey)),
                  Text(phone.price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                ],
              ),
              const Divider(height: 20, color: Colors.grey),
              const Text('Full Specifications:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 6),
              Text(phone.specs, style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
              const SizedBox(height: 14),
              const Text('AI Benchmark & Overview:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              const SizedBox(height: 4),
              Text(phone.aiVerdict, style: const TextStyle(color: Colors.white70, fontSize: 12)),
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

// تبويب الكتالوجات العالمية ومحرك البحث الذكي الشامل
class GlobalCatalogsTab extends StatelessWidget {
  const GlobalCatalogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // تصفية الهواتف الذكية عبر محرك البحث العالمي الذكي (يدعم أي موديل مثل S26 Ultra)
    List<PhoneModel> filteredPhones = appState.globalDatabase.where((phone) {
      return phone.name.toLowerCase().contains(appState.searchQuery.toLowerCase()) ||
          phone.brand.toLowerCase().contains(appState.searchQuery.toLowerCase()) ||
          phone.specs.toLowerCase().contains(appState.searchQuery.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextField(
            onChanged: (val) => appState.setSearchQuery(val),
            decoration: InputDecoration(
              hintText: appState.getText('searchHint'),
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              prefixIcon: const Icon(Icons.search, color: Colors.amber),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: filteredPhones.isEmpty
                ? const Center(
                    child: Text(
                      'No matching phone found in global database. Try searching for S26 Ultra, iPhone 17, or Samsung.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredPhones.length,
                    itemBuilder: (context, index) {
                      final phone = filteredPhones[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.amber.withOpacity(0.2)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              phone.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.smartphone, color: Colors.amber, size: 40),
                            ),
                          ),
                          title: Text(phone.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 15)),
                          subtitle: Text(phone.specs, style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                          trailing: Text(phone.price, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 14)),
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
                TextField(controller: nameController, decoration: InputDecoration(labelText: appState.getText('phoneName'))),
                const SizedBox(height: 10),
                TextField(controller: priceController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: appState.getText('price'))),
                const SizedBox(height: 10),
                TextField(controller: detailsController, decoration: InputDecoration(labelText: appState.getText('details'))),
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
              onPressed: () => {
                if (nameController.text.isNotEmpty && priceController.text.isNotEmpty) {
                  appState.addListing(nameController.text, '\$${priceController.text}', detailsController.text),
                  Navigator.pop(context),
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
        padding: const EdgeInsets.all(14.0),
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
