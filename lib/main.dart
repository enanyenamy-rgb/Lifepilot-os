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

  // دالة لاختيار الاسم حسب اللغة النشطة
  String getName(String lang) => lang == 'ar' ? nameAr : nameEn;
  // دالة لاختيار المواصفات حسب اللغة النشطة
  String getSpecs(String lang) => lang == 'ar' ? specsAr : specsEn;
  // دالة لاختيار تقييم الذكاء الاصطناعي حسب اللغة النشطة
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

  // قاعدة بيانات الهواتف مع دعم ثنائي اللغة (إنجليزي / عربي)
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
      nameEn: 'Samsung Galaxy S25 Ultra',
      nameAr: 'سامسونج جالاكسي اس 25 الترا',
      brand: 'Samsung',
      price: '\$1,299',
      specsEn: 'Snapdragon 8 Elite | 200MP Camera | 5000mAh | Dynamic AMOLED 2X',
      specsAr: 'معالج سناب دراجون 8 الجيل 1 | كاميرا 200 ميجابكسل | بطارية 5000 مللي أمبير',
      aiVerdictEn: 'Exceptional flagship performance and world-class zoom photography.',
      aiVerdictAr: 'أداء استثنائي للهواتف الرائدة وتصوير تقريب فائق الجودة.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s25-ultra.jpg',
    ),
    PhoneModel(
      nameEn: 'Apple iPhone 17 Pro Max',
      nameAr: 'آبل آيفون 17 برو ماكس',
      brand: 'Apple',
      price: '\$1,399',
      specsEn: 'A19 Pro Chip | 48MP Triple Periscope Lens | Grade 5 Titanium',
      specsAr: 'شريحة A19 Pro | عدسة بيريسكوب ثلاثية 48 ميجابكسل | هيكل تيتانيوم',
      aiVerdictEn: 'Apple masterpiece featuring unprecedented processing speed and cinematic video.',
      aiVerdictAr: 'تحفة آبل الفنية تتميز بسرعة معالجة غير مسبوقة وتصوير فيديو سينمائي.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro-max.jpg',
    ),
    PhoneModel(
      nameEn: 'Apple iPhone 17 Pro',
      nameAr: 'آبل آيفون 17 برو',
      brand: 'Apple',
      price: '\$1,099',
      specsEn: 'A19 Pro | ProMotion 120Hz | Advanced Neural Engine',
      specsAr: 'شريحة A19 Pro | شاشة 120 هرتز | محرك عصبي متطور',
      aiVerdictEn: 'Compact flagship powerhouse with elite gaming and camera capabilities.',
      aiVerdictAr: 'قوة هاتف رائد مدمجة بقدرات ألعاب وتصوير فائقة.',
      imageUrl: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-16-pro.jpg',
    ),
    PhoneModel(
      nameEn: 'Oppo Find X7 Ultra',
      nameAr: 'أوبو فايند اكس 7 الترا',
      brand: 'Oppo',
      price: '\$1,150',
      specsEn: 'Snapdragon 8 Gen 3 | Dual Periscope Zoom | Hasselblad Color Tuning',
      specsAr: 'معالج سناب دراجون 8 جين 3 | تقريب بيريسكوب مزدوج | ضبط ألوان هاسلبلاد',
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

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Global Verified', details: details));
    notifyListeners();
  }

  // قواميس الترجمة للواجهة
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
      'submit': 'Publish Listing',
      'aiOverview': 'AI Overview:',
      'gsmPrice': 'Global Price:',
      'fullSpecs': 'Full Specifications:',
      'close': 'Close',
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
      'submit': 'نشر الإعلان',
      'aiOverview': 'نظرة الذكاء الاصطناعي:',
      'gsmPrice': 'السعر العالمي:',
      'fullSpecs': 'المواصفات الكاملة:',
      'close': 'إغلاق',
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
  final languages = {'en': 'English (Default)', 'ar': 'العربية'};

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(appState.getText('selectLang'), style: const TextStyle(color: Colors.amber)),
        content: SizedBox(
          width: double.maxFinite,
          height: 150,
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
                    icon: const Icon(Icons.
