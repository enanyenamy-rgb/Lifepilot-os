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
  final String specs;
  final String price;
  final String imageUrl;

  PhoneModel({required this.name, required this.specs, required this.price, required this.imageUrl});
}

class BrandCategory {
  final String brandName;
  final String brandLogoUrl;
  final List<PhoneModel> phones;

  BrandCategory({required this.brandName, required this.brandLogoUrl, required this.phones});
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
    UsedPhoneItem(phoneName: 'iPhone 15 Pro', price: '\$750', location: 'Local Country', details: 'Mint condition, 256GB, battery health 90%'),
    UsedPhoneItem(phoneName: 'Samsung S24 Ultra', price: '\$850', location: 'Local Country', details: 'Like new with original box and warranty'),
  ];

  // قاعدة بيانات الهواتف العالمية الشاملة مرتبة حسب الماركات والأنواع مع الصور والمواصفات
  final List<BrandCategory> globalBrandsData = [
    BrandCategory(
      brandName: 'Samsung (سامسونج)',
      brandLogoUrl: 'https://images.samsung.com/is/image/samsung/assets/global/about-us/brand/logo/mo/360_197_1.png',
      phones: [
        PhoneModel(name: 'Galaxy S25 Ultra', specs: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh | 120Hz AMOLED', price: '\$1,299', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg'),
        PhoneModel(name: 'Galaxy S25+', specs: 'Exynos / Snapdragon | 50MP Triple Cam | 4900mAh', price: '\$999', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-plus.jpg'),
        PhoneModel(name: 'Galaxy Z Fold 6', specs: 'Foldable 7.6" Screen | Snapdragon 8 Gen 3 | 4400mAh', price: '\$1,799', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-z-fold6.jpg'),
        PhoneModel(name: 'Galaxy A55 5G', specs: 'Exynos 1480 | Super AMOLED 6.6" | 50MP OIS Camera', price: '\$399', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-a55.jpg'),
      ],
    ),
    BrandCategory(
      brandName: 'Apple (آبل)',
      brandLogoUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg',
      phones: [
        PhoneModel(name: 'iPhone 17 Pro Max', specs: 'A19 Pro Chip | 48MP Triple Lens | Titanium Build', price: '\$1,399', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro-max.jpg'),
        PhoneModel(name: 'iPhone 17 Pro', specs: 'A19 Pro | ProMotion 120Hz | Advanced AI Neural Engine', price: '\$1,099', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro.jpg'),
        PhoneModel(name: 'iPhone 16', specs: 'A18 Chip | Action Button | Dual 48MP Fusion Camera', price: '\$799', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16.jpg'),
        PhoneModel(name: 'iPhone 15 Pro', specs: 'A17 Pro Titanium | USB-C Fast Data Transfer', price: '\$899', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-15-pro.jpg'),
      ],
    ),
    BrandCategory(
      brandName: 'Xiaomi (شاومي)',
      brandLogoUrl: 'https://upload.wikimedia.org/wikipedia/commons/a/ae/Xiaomi_logo_%282021-%29.svg',
      phones: [
        PhoneModel(name: 'Xiaomi 14 Ultra', specs: 'Leica Quad Camera | 1-inch Sensor | Snapdragon 8 Gen 3', price: '\$1,199', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-14-ultra.jpg'),
        PhoneModel(name: 'Redmi Note 13 Pro+', specs: '200MP OIS Camera | 120W HyperCharge | IP68 Rating', price: '\$380', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-13-pro-plus.jpg'),
        PhoneModel(name: 'Poco X6 Pro 5G', specs: 'MediaTek Dimensity 8300-Ultra | 120Hz AMOLED', price: '\$340', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-poco-x6-pro.jpg'),
      ],
    ),
    BrandCategory(
      brandName: 'Honor & Huawei (هونر وهواوي)',
      brandLogoUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/e9/Huawei_logo.svg',
      phones: [
        PhoneModel(name: 'Honor X9d', specs: 'Ultra Tough Display | Massive Battery | 108MP Camera', price: '\$450', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/honor-x9b.jpg'),
        PhoneModel(name: 'Honor Magic 6 Pro', specs: 'Falcon Capture Camera | Snapdragon 8 Gen 3 | Satellite', price: '\$950', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/honor-magic6-pro.jpg'),
        PhoneModel(name: 'Huawei Pura 70 Ultra', specs: '1-inch Retractable Camera | Kirin 9010 | Kunlun Glass', price: '\$1,250', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/huawei-pura-70-ultra.jpg'),
      ],
    ),
    BrandCategory(
      brandName: 'Google Pixel & OnePlus (جوجل وون بلس)',
      brandLogoUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg',
      phones: [
        PhoneModel(name: 'Pixel 9 Pro XL', specs: 'Google Tensor G4 | Gemini Advanced AI | 16GB RAM', price: '\$1,099', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/google-pixel-9-pro-xl.jpg'),
        PhoneModel(name: 'OnePlus 12', specs: 'Snapdragon 8 Gen 3 | Hasselblad Camera | 5400mAh', price: '\$799', imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/oneplus-12.jpg'),
      ],
    ),
  ];

  AppState(this.isLoggedIn, this.currentLang);

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Local Country', details: details));
    notifyListeners();
  }

  final Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'Ai Phone Store Global',
      'login': 'Secure Login',
      'email': 'Email Address',
      'password': 'Password',
      'guest': 'Explore as Guest',
      'newPhones': 'Global Phone Catalogs',
      'usedMarket': 'Secure Used Market',
      'selectLang': 'Select Language',
      'sellPhone': 'List Your Phone for Sale',
      'searchHint': 'Search any phone model globally...',
      'phoneName': 'Phone Model Name',
      'price': 'Price (\$)',
      'details': 'Condition & Specs',
      'submit': 'Publish Listing',
    },
    'ar': {
      'title': 'متجر الهواتف العالمي الذكي',
      'login': 'تسجيل الدخول الآمن',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'guest': 'تصفح كزائر',
      'newPhones': 'كتالوجات الهواتف العالمية',
      'usedMarket': 'سوق المستعمل الآمن',
      'selectLang': 'اختر لغة التطبيق',
      'sellPhone': 'إضافة هاتفك للبيع',
      'searchHint': 'ابحث عن أي موديل هاتف عالمياً...',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة',
      'submit': 'نشر الإعلان',
    },
    'es': { 'title': 'Tienda IA Global', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Invitado', 'newPhones': 'Catálogos Globales', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchHint': 'Buscar modelo...', 'phoneName': 'Modelo', 'price': 'Precio', 'details': 'Detalles', 'submit': 'Publicar' },
    'fr': { 'title': 'Boutique IA Mondiale', 'login': 'Connexion', 'email': 'E-mail', 'password': 'Mot de passe', 'guest': 'Invité', 'newPhones': 'Catalogues Mondiaux', 'usedMarket': 'Occasion', 'selectLang': 'Langue', 'sellPhone': 'Vendre', 'searchHint': 'Rechercher...', 'phoneName': 'Modèle', 'price': 'Prix', 'details': 'Détails', 'submit': 'Publier' },
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
          title: 'Ai Phone Store',
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
                    child: const Icon(Icons.phone_android, size: 75, color: Colors.amber),
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

// نافذة تفاصيل الهاتف والصور والمواصفات الكاملة
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
              const Text('• Officially verified by international mobile specs databases.\n• High durability & global carrier support.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
            onPressed: () => Navigator_pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

void Navigator_pop(BuildContext context) => Navigator.pop(context);

// تبويب كتالوجات الهواتف العالمية متسلسلة وتحت كل ماركة أنواعها بالصور والمواصفات
class GlobalCatalogsTab extends StatelessWidget {
  const GlobalCatalogsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    // تصفية الهواتف بناءً على البحث
    List<BrandCategory> filteredBrands = appState.globalBrandsData.map((brand) {
      var filteredPhones = brand.phones.where((p) => p.name.toLowerCase().contains(appState.searchQuery.toLowerCase()) || brand.brandName.toLowerCase().contains(appState.searchQuery.toLowerCase())).toList();
      return BrandCategory(brandName: brand.brandName, brandLogoUrl: brand.brandLogoUrl, phones: filteredPhones);
    }).where((brand) => brand.phones.isNotEmpty).toList();

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
              itemCount: filteredBrands.length,
              itemBuilder: (context, index) {
                final brand = filteredBrands[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.amber.withOpacity(0.2)),
                  ),
                  child: ExpansionTile(
                    collapsedIconColor: Colors.amber,
                    iconColor: Colors.amber,
                    leading: const Icon(Icons.phone_android, color: Colors.amber, size: 28),
                    title: Text(brand.brandName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    children: brand.phones.map((phone) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF070B14),
                          borderRadius: BorderRadius.circular(12),
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
                    }).toList(),
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
