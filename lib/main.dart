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
  final String phoneContact;
  final String whatsappContact;
  final String sellerIdDoc;
  bool isContactUnlocked;

  UsedPhoneItem({
    required this.phoneName,
    required this.price,
    required this.location,
    required this.details,
    required this.phoneContact,
    required this.whatsappContact,
    required this.sellerIdDoc,
    this.isContactUnlocked = false,
  });
}

class AppState extends ChangeNotifier {
  bool isLoggedIn;
  String currentLang;
  String searchQuery = '';

  List<UsedPhoneItem> userListings = [
    UsedPhoneItem(
      phoneName: 'iPhone 15 Pro',
      price: '\$750',
      location: 'Global Verified',
      details: 'Mint condition, 256GB, battery health 90%',
      phoneContact: '+201000000000',
      whatsappContact: '+201000000000',
      sellerIdDoc: 'Verified ID #9842',
      isContactUnlocked: false,
    ),
    UsedPhoneItem(
      phoneName: 'Samsung S24 Ultra',
      price: '\$850',
      location: 'Global Verified',
      details: 'Like new with original box and international warranty',
      phoneContact: '+201111111111',
      whatsappContact: '+201111111111',
      sellerIdDoc: 'Verified ID #5510',
      isContactUnlocked: false,
    ),
  ];

  final List<PhoneModel> globalPhonesDatabase = [
    PhoneModel(
      nameEn: 'Samsung Galaxy S26 Ultra',
      nameAr: 'سامسونج جالاكسي اس 26 الترا',
      brand: 'Samsung',
      price: '\$1,399',
      specsEn: 'Snapdragon 8 Elite Gen 2 | 250MP Quad Camera | 5500mAh | 16GB RAM',
      specsAr: 'معالج سناب دراجون 8 الجيل 2 | كاميرا رباعية 250 ميجابكسل | بطارية 5500 مللي أمبير',
      aiVerdictEn: 'The absolute pinnacle of mobile technology with revolutionary AI capabilities.',
      aiVerdictAr: 'القمة المطلقة لتكنولوجيا الهواتف الذكية مع قدرات ذكاء اصطناعي ثورية.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Apple iPhone 17 Pro Max',
      nameAr: 'آبل آيفون 17 برو ماكس',
      brand: 'Apple',
      price: '\$1,399',
      specsEn: 'A19 Pro Chip | 48MP Triple Periscope Lens | Grade 5 Titanium',
      specsAr: 'شريحة A19 Pro | عدسة بيريسكوب 48 ميجابكسل | هيكل تيتانيوم',
      aiVerdictEn: 'Apple masterpiece featuring unprecedented processing speed and cinematic video.',
      aiVerdictAr: 'تحفة آبل الفنية بسرعة معالجة غير مسبوقة وتصوير سينمائي.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro-max.jpg',
    ),
    PhoneModel(
      nameEn: 'Oppo Find X7 Ultra',
      nameAr: 'أوبو فايند اكس 7 الترا',
      brand: 'Oppo',
      price: '\$1,150',
      specsEn: 'Snapdragon 8 Gen 3 | Dual Periscope Zoom | Hasselblad Color Tuning',
      specsAr: 'معالج سناب دراجون 8 جين 3 | تقريب بيريسكوب مزدوج | عدسات هاسلبلاد',
      aiVerdictEn: 'Stunning portrait photography and supreme display brightness.',
      aiVerdictAr: 'تصوير بورتريه مذهل وسطوع شاشة فائق.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/oppo-find-x7-ultra.jpg',
    ),
  ];

  AppState(this.isLoggedIn, this.currentLang);

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void addListing(String name, String price, String details, String phone, String whatsapp, String idDoc) {
    userListings.add(UsedPhoneItem(
      phoneName: name,
      price: price,
      location: 'Global Verified',
      details: details,
      phoneContact: phone.isNotEmpty ? phone : 'Hidden / Secure',
      whatsappContact: whatsapp.isNotEmpty ? whatsapp : 'Hidden / Secure',
      sellerIdDoc: idDoc.isNotEmpty ? idDoc : 'ID Pending Verification',
      isContactUnlocked: false,
    ));
    notifyListeners();
  }

  void unlockContact(int index) {
    userListings[index].isContactUnlocked = true;
    notifyListeners();
  }

  // قاموس اللغات الـ 25 الكامل
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
      'searchHint': 'Search any phone (e.g. Oppo, S26 Ultra)...',
      'phoneName': 'Phone Model Name',
      'price': 'Price (\$)',
      'details': 'Condition & Specifications',
      'phoneNum': 'Phone Number (Hidden for Privacy)',
      'whatsappNum': 'WhatsApp Number',
      'idProof': 'ID Document / National ID Number',
      'submit': 'Publish Listing',
      'unlockBtn': 'Unlock Seller Contact (\$1 Fee)',
      'unlockedLabel': 'Seller Contact Unlocked:',
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
      'searchHint': 'ابحث عن أي هاتف (مثل أوبو، S26 Ultra)...',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة والمواصفات',
      'phoneNum': 'رقم الهاتف (يُخفى لحماية الخصوصية)',
      'whatsappNum': 'رقم الواتساب للتواصل',
      'idProof': 'رقم الهوية أو مستند التحقق (اختياري)',
      'submit': 'نشر الإعلان في السوق',
      'unlockBtn': 'إظهار رقم وبطاقة البائع (رسوم 1 دولار)',
      'unlockedLabel': 'تم فتح وسيلة الاتصال للبائع:',
    },
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
  final Map<String, String> languages = {
    'en': 'English',
    'ar': 'العربية (Arabic)',
    'es': 'Español (Spanish)',
    'fr': 'Français (French)',
    'zh': '中文 (Chinese)',
    'hi': 'हिन्दी (Hindi)',
    'de': 'Deutsch (German)',
    'ja': '日本語 (Japanese)',
    'ru': 'Русский (Russian)',
    'pt': 'Português (Portuguese)',
    'it': 'Italiano (Italian)',
    'tr': 'Türkçe (Turkish)',
    'ko': '한국어 (Korean)',
    'vi': 'Tiếng Việt (Vietnamese)',
    'pl': 'Polski (Polish)',
    'uk': 'Українська (Ukrainian)',
    'nl': 'Nederlands (Dutch)',
    'fa': 'فارسی (Persian)',
    'id': 'Bahasa Indonesia (Indonesian)',
    'ur': 'اردو (Urdu)',
    'ro': 'Română (Romanian)',
    'el': 'Ελληνικά (Greek)',
    'hu': 'Magyar (Hungarian)',
    'sv': 'Svenska (Swedish)',
    'he': 'עברית (Hebrew)',
  };

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(appState.getText('selectLang'), style: const TextStyle(color: Colors.amber)),
        content: SizedBox(
          width: double.maxFinite,
          height: 350,
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
                  const Text('Price:', style: TextStyle(color: Colors.grey)),
                  Text(phone.price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                ],
              ),
              const Divider(height: 20, color: Colors.grey),
              const Text('Specifications:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
          specsEn: 'Dynamic Global Specifications | High-Resolution Display',
          specsAr: 'مواصفات عالمية متطورة | شاشة عالية الدقة',
          aiVerdictEn: 'Smart AI Auto-Synced Result: Verified international model.',
          aiVerdictAr: 'نتيجة ذكية متزامنة تلقائياً: موديل دولي موثق.',
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
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController whatsappController = TextEditingController();
    final TextEditingController idController = TextEditingController();

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
                const SizedBox(height: 10),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: appState.getText('phoneNum'))),
                const SizedBox(height: 10),
                TextField(controller: whatsappController, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: appState.getText('whatsappNum'))),
                const SizedBox(height: 10),
                TextField(controller: idController, decoration: InputDecoration(labelText: appState.getText('idProof'))),
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
                  appState.addListing(
                    nameController.text,
                    '\$${priceController.text}',
                    detailsController.text,
                    phoneController.text,
                    whatsappController.text,
                    idController.text,
                  );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.verified_user, size: 16, color: Colors.amber),
                        SizedBox(width: 6),
                        Text('Verified Global Seller', style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(item.sellerIdDoc, style: const TextStyle(color: Colors.cyanAccent, fontSize: 11)),
                  ],
                ),
                const Divider(height: 20, color: Colors.grey),
                item.isContactUnlocked
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${appState.getText('unlockedLabel')}', style: const TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('Phone: ${item.phoneContact}', style: const TextStyle(color: Colors.white, fontSize: 13)),
                          Text('WhatsApp: ${item.whatsappContact}', style: const TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.withOpacity(0.2),
                          foregroundColor: Colors.amber,
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          // محاكاة عملية الدفع بقيمة 1 دولار لفتح جهة الاتصال
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: const Color(0xFF1E293B),
                              title: const Text('Unlock Contact Details', style: TextStyle(color: Colors.amber)),
                              content: const Text('Pay $1.00 fee to reveal seller phone and WhatsApp securely?', style: TextStyle(color: Colors.white70)),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                                  onPressed: () {
                                    appState.unlockContact(index);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Pay $1 & Unlock'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.lock, size: 16),
                        label: Text(appState.getText('unlockBtn'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
