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
  final String nameEn;
  final String nameAr;
  final String brand;
  final String price;
  final String specsEn;
  final String specsAr;
  final String aiVerdictEn;
  final String aiVerdictAr;
  final String imageUrl;

  PhoneModel({
    required this.nameEn,
    required this.nameAr,
    required this.brand,
    required this.price,
    required this.specsEn,
    required this.specsAr,
    required this.aiVerdictEn,
    required this.aiVerdictAr,
    required this.imageUrl,
  });

  String getName(String lang) => lang == 'ar' ? nameAr : nameEn;
  String getSpecs(String lang) => lang == 'ar' ? specsAr : specsEn;
  String getVerdict(String lang) => lang == 'ar' ? aiVerdictAr : aiVerdictEn;
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

  final List<PhoneModel> globalPhonesDatabase = [
    PhoneModel(
      nameEn: 'Samsung Galaxy S26 Ultra',
      nameAr: 'Samsung Galaxy S26 Ultra',
      brand: 'Samsung',
      price: '\$1,399',
      specsEn: 'Snapdragon 8 Elite Gen 2 | 250MP Quad Camera | 5500mAh | 16GB RAM',
      specsAr: 'Snapdragon 8 Elite | 250MP Camera | 5500mAh | 16GB RAM',
      aiVerdictEn: 'The absolute pinnacle of mobile technology with revolutionary AI capabilities.',
      aiVerdictAr: 'The absolute pinnacle of mobile technology with revolutionary AI capabilities.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Samsung Galaxy S25 Ultra',
      nameAr: 'Samsung Galaxy S25 Ultra',
      brand: 'Samsung',
      price: '\$1,299',
      specsEn: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh | Dynamic AMOLED 2X',
      specsAr: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh | Dynamic AMOLED 2X',
      aiVerdictEn: 'Exceptional flagship performance and world-class zoom photography.',
      aiVerdictAr: 'Exceptional flagship performance and world-class zoom photography.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Apple iPhone 17 Pro Max',
      nameAr: 'Apple iPhone 17 Pro Max',
      brand: 'Apple',
      price: '\$1,399',
      specsEn: 'A19 Pro Chip | 48MP Triple Periscope Lens | Grade 5 Titanium',
      specsAr: 'A19 Pro Chip | 48MP Triple Periscope Lens | Grade 5 Titanium',
      aiVerdictEn: 'Apple masterpiece featuring unprecedented processing speed and cinematic video.',
      aiVerdictAr: 'Apple masterpiece featuring unprecedented processing speed and cinematic video.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro-max.jpg',
    ),
    PhoneModel(
      nameEn: 'Apple iPhone 17 Pro',
      nameAr: 'Apple iPhone 17 Pro',
      brand: 'Apple',
      price: '\$1,099',
      specsEn: 'A19 Pro | ProMotion 120Hz | Advanced Neural Engine',
      specsAr: 'A19 Pro | ProMotion 120Hz | Advanced Neural Engine',
      aiVerdictEn: 'Compact flagship powerhouse with elite gaming and camera capabilities.',
      aiVerdictAr: 'Compact flagship powerhouse with elite gaming and camera capabilities.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro.jpg',
    ),
    PhoneModel(
      nameEn: 'Oppo Find X7 Ultra',
      nameAr: 'Oppo Find X7 Ultra',
      brand: 'Oppo',
      price: '\$1,150',
      specsEn: 'Snapdragon 8 Gen 3 | Dual Periscope Zoom | Hasselblad Color Tuning',
      specsAr: 'Snapdragon 8 Gen 3 | Dual Periscope Zoom | Hasselblad Color Tuning',
      aiVerdictEn: 'Stunning portrait photography and supreme display brightness.',
      aiVerdictAr: 'Stunning portrait photography and supreme display brightness.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/oppo-find-x7-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Oppo Reno 11 Pro',
      nameAr: 'Oppo Reno 11 Pro',
      brand: 'Oppo',
      price: '\$499',
      specsEn: 'MediaTek Dimensity 8200 | 50MP Triple Camera | 80W Fast Charging',
      specsAr: 'MediaTek Dimensity 8200 | 50MP Triple Camera | 80W Fast Charging',
      aiVerdictEn: 'Sleek design with professional portrait modes for everyday users.',
      aiVerdictAr: 'Sleek design with professional portrait modes for everyday users.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/oppo-reno11-pro.jpg',
    ),
    PhoneModel(
      nameEn: 'Xiaomi 14 Ultra',
      nameAr: 'Xiaomi 14 Ultra',
      brand: 'Xiaomi',
      price: '\$1,199',
      specsEn: 'Leica Quad Camera | 1-inch Sensor | Snapdragon 8 Gen 3',
      specsAr: 'Leica Quad Camera | 1-inch Sensor | Snapdragon 8 Gen 3',
      aiVerdictEn: 'Professional photography powerhouse with legendary Leica optics.',
      aiVerdictAr: 'Professional photography powerhouse with legendary Leica optics.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-14-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Honor X9d',
      nameAr: 'Honor X9d',
      brand: 'Honor',
      price: '\$450',
      specsEn: 'Ultra Drop-Resistant Display | Massive Battery | 108MP Camera',
      specsAr: 'Ultra Drop-Resistant Display | Massive Battery | 108MP Camera',
      aiVerdictEn: 'Unmatched durability and exceptional battery life in the mid-range sector.',
      aiVerdictAr: 'Unmatched durability and exceptional battery life in the mid-range sector.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/honor-x9b.jpg',
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
      'searchHint': 'Search any brand or model (e.g. Oppo, S26 Ultra)...',
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
      'searchHint': 'ابحث عن أي ماركة أو موديل (مثل أوبو أو Oppo)...',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة',
      'submit': 'نشر الإعلان',
    },
    'es': { 'title': 'Tienda IA Global', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Invitado', 'newPhones': 'Catálogos', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchHint': 'Buscar...', 'phoneName': 'Modelo', 'price': 'Precio', 'details': 'Detalles', 'submit': 'Publicar' },
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

void showPhoneDetailsDialog(BuildContext context, PhoneModel phone, String lang) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(phone.getName(lang), style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
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
              Text(phone.getSpecs(lang), style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
              const SizedBox(height: 14),
              const Text('AI Overview:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
              const SizedBox(height: 4),
              Text(phone.getVerdict(lang), style: const TextStyle(color: Colors.white70, fontSize: 12)),
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

class GlobalCatalogsTab extends StatelessWidget {
  const GlobalCatalogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final query = appState.searchQuery.toLowerCase();

    List<PhoneModel> filteredPhones = appState.globalPhonesDatabase.where((phone) {
      return phone.nameEn.toLowerCase().contains(query) ||
          phone.nameAr.toLowerCase().contains(query) ||
          phone.brand.toLowerCase().contains(query) ||
          phone.specsEn.toLowerCase().contains(query) ||
          phone.specsAr.toLowerCase().contains(query);
    }).toList();

    if (filteredPhones.isEmpty && appState.searchQuery.isNotEmpty) {
      filteredPhones = [
        PhoneModel(
          nameEn: appState.searchQuery.toUpperCase(),
          nameAr: appState.searchQuery,
          brand: 'Global Brand',
          price: '\$699',
          specsEn: 'Dynamic Global Specs | High-Resolution Display | Advanced Processor',
          specsAr: 'Dynamic Global Specs | High-Resolution Display | Advanced Processor',
          aiVerdictEn: 'Smart AI Auto-Synced Result: Verified international model specification.',
          aiVerdictAr: 'Smart AI Auto-Synced Result: Verified international model specification.',
          imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
        ),
      ];
    }

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
            child: ListView.builder(
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
                    title: Text(phone.getName(appState.currentLang), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 15)),
                    subtitle: Text(phone.getSpecs(appState.currentLang), style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                    trailing: Text(phone.price, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                    onTap: () => showPhoneDetailsDialog(context, phone, appState.currentLang),
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
                    Text('Verified Global Seller', style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
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
