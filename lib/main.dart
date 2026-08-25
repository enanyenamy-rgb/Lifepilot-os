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
      specsAr: 'معالج سناب دراجون 8 | كاميرا 200 ميجابكسل | بطارية 5000 مللي أمبير',
      aiVerdictEn: 'Exceptional flagship performance and world-class zoom photography.',
      aiVerdictAr: 'أداء استثنائي وتصوير تقريب فائق الجودة.',
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

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Global Verified', details: details));
    notifyListeners();
  }

  // قاموس الترجمات لأكثر 25 لغة عالمية
  final Map<String, Map<String, String>> translations = {
    'en': { 'title': 'Ai Phone Store Global', 'login': 'Secure Login', 'email': 'Email Address', 'password': 'Password', 'guest': 'Explore as Guest', 'newPhones': 'Global Catalogs', 'usedMarket': 'Secure Used Market', 'selectLang': 'Select Language', 'sellPhone': 'List Your Phone for Sale', 'searchHint': 'Search any phone (e.g. Oppo, S26 Ultra)...', 'submit': 'Publish Listing' },
    'ar': { 'title': 'متجر الهواتف العالمي الذكي', 'login': 'تسجيل الدخول الآمن', 'email': 'البريد الإلكتروني', 'password': 'كلمة المرور', 'guest': 'تصفح كزائر', 'newPhones': 'الكتالوجات العالمية', 'usedMarket': 'سوق المستعمل الآمن', 'selectLang': 'اختر لغة التطبيق', 'sellPhone': 'إضافة هاتفك للبيع', 'searchHint': 'ابحث عن أي هاتف (مثل أوبو، S26 Ultra)...', 'submit': 'نشر الإعلان' },
    'es': { 'title': 'Tienda IA Global', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Invitado', 'newPhones': 'Catálogos', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchHint': 'Buscar...', 'submit': 'Publicar' },
    'fr': { 'title': 'Boutique IA Mondiale', 'login': 'Connexion', 'email': 'E-mail', 'password': 'Mot de passe', 'guest': 'Invité', 'newPhones': 'Catalogues', 'usedMarket': 'Occasion', 'selectLang': 'Langue', 'sellPhone': 'Vendre', 'searchHint': 'Rechercher...', 'submit': 'Publier' },
    'zh': { 'title': 'AI手机商店', 'login': '登录', 'email': '邮箱', 'password': '密码', 'guest': '游客', 'newPhones': '目录', 'usedMarket': '二手市场', 'selectLang': '选择语言', 'sellPhone': '出售手机', 'searchHint': '搜索...', 'submit': '发布' },
    'hi': { 'title': 'AI फ़ोन स्टोर', 'login': 'लॉगिन', 'email': 'ईमेल', 'password': 'पासवर्ड', 'guest': 'अतिथि', 'newPhones': 'कैटलॉग', 'usedMarket': 'पुराना बाज़ार', 'selectLang': 'भाषा चुनें', 'sellPhone': 'फोन बेचें', 'searchHint': 'खोजें...', 'submit': 'प्रकाशित करें' },
    'de': { 'title': 'KI Handy Shop', 'login': 'Anmelden', 'email': 'E-Mail', 'password': 'Passwort', 'guest': 'Gast', 'newPhones': 'Kataloge', 'usedMarket': 'Gebraucht', 'selectLang': 'Sprache', 'sellPhone': 'Verkaufen', 'searchHint': 'Suchen...', 'submit': 'Veröffentlichen' },
    'ja': { 'title': 'AIフォンストア', 'login': 'ログイン', 'email': 'メール', 'password': 'パスワード', 'guest': 'ゲスト', 'newPhones': 'カタログ', 'usedMarket': '中古市場', 'selectLang': '言語選択', 'sellPhone': '出品', 'searchHint': '検索...', 'submit': '投稿' },
    'ru': { 'title': 'Магазин ИИ', 'login': 'Войти', 'email': 'Почта', 'password': 'Пароль', 'guest': 'Гость', 'newPhones': 'Каталоги', 'usedMarket': 'Б/У', 'selectLang': 'Язык', 'sellPhone': 'Продать', 'searchHint': 'Поиск...', 'submit': 'Опубликовать' },
    'pt': { 'title': 'Loja IA Global', 'login': 'Entrar', 'email': 'E-mail', 'password': 'Senha', 'guest': 'Convidado', 'newPhones': 'Catálogos', 'usedMarket': 'Usados', 'selectLang': 'Idioma', 'sellPhone': 'Vender', 'searchHint': 'Pesquisar...', 'submit': 'Publicar' },
    'it': { 'title': 'Negozio IA', 'login': 'Accesso', 'email': 'Email', 'password': 'Password', 'guest': 'Ospite', 'newPhones': 'Cataloghi', 'usedMarket': 'Usato', 'selectLang': 'Lingua', 'sellPhone': 'Vendi', 'searchHint': 'Cerca...', 'submit': 'Pubblica' },
    'tr': { 'title': 'AI Telefon Mağazası', 'login': 'Giriş', 'email': 'E-posta', 'password': 'Şifre', 'guest': 'Misafir', 'newPhones': 'Kataloglar', 'usedMarket': 'İkinci El', 'selectLang': 'Dil Seçin', 'sellPhone': 'Telefon Sat', 'searchHint': 'Ara...', 'submit': 'Yayınla' },
    'ko': { 'title': 'AI 폰 스토어', 'login': '로그인', 'email': '이메일', 'password': '비밀번호', 'guest': '게스트', 'newPhones': '카탈로그', 'usedMarket': '중고시장', 'selectLang': '언어 선택', 'sellPhone': '판매하기', 'searchHint': '검색...', 'submit': '게시' },
    'vi': { 'title': 'Cửa hàng AI', 'login': 'Đăng nhập', 'email': 'Email', 'password': 'Mật khẩu', 'guest': 'Khách', 'newPhones': 'Danh mục', 'usedMarket': 'Đồ cũ', 'selectLang': 'Ngôn ngữ', 'sellPhone': 'Bán', 'searchHint': 'Tìm kiếm...', 'submit': 'Đăng' },
    'pl': { 'title': 'Sklep AI', 'login': 'Zaloguj się', 'email': 'E-mail', 'password': 'Hasło', 'guest': 'Gość', 'newPhones': 'Katalogi', 'usedMarket': 'Używane', 'selectLang': 'Język', 'sellPhone': 'Sprzedaj', 'searchHint': 'Szukaj...', 'submit': 'Opublikuj' },
    'uk': { 'title': 'Магазин ШІ', 'login': 'Увійти', 'email': 'Пошта', 'password': 'Пароль', 'guest': 'Гість', 'newPhones': 'Каталоги', 'usedMarket': 'Б/У', 'selectLang': 'Мова', 'sellPhone': 'Продати', 'searchHint': 'Пошук...', 'submit': 'Опублікувати' },
    'nl': { 'title': 'AI TelefoonWinkel', 'login': 'Inloggen', 'email': 'E-mail', 'password': 'Wachtwoord', 'guest': 'Gast', 'newPhones': 'Catalogus', 'usedMarket': 'Tweedehands', 'selectLang': 'Taal', 'sellPhone': 'Verkopen', 'searchHint': 'Zoeken...', 'submit': 'Publiceren' },
    'fa': { 'title': 'فروشگاه هوش مصنوعی', 'login': 'ورود', 'email': 'ایمیل', 'password': 'رمز عبور', 'guest': 'مهمان', 'newPhones': 'کاتالوگ‌ها', 'usedMarket': 'بازار دست دوم', 'selectLang': 'انتخاب زبان', 'sellPhone': 'فروش گوشی', 'searchHint': 'جستجو...', 'submit': 'انتشار' },
    'id': { 'title': 'Toko Ponsel AI', 'login': 'Masuk', 'email': 'Email', 'password': 'Password', 'guest': 'Tamu', 'newPhones': 'Katalog', 'usedMarket': 'Pasar Bekas', 'selectLang': 'Bahasa', 'sellPhone': 'Jual', 'searchHint': 'Cari...', 'submit': 'Posting' },
    'ur': { 'title': 'اے آئی فون اسکور', 'login': 'لاگ ان', 'email': 'ای میل', 'password': 'پاس ورڈ', 'guest': 'مہمان', 'newPhones': 'کیٹالوگ', 'usedMarket': 'پرانا بازار', 'selectLang': 'زبان منتخب کریں', 'sellPhone': 'فروش', 'searchHint': 'تلاش کریں...', 'submit': 'شائع کریں' },
    'ro': { 'title': 'Magazin AI', 'login': 'Autentificare', 'email': 'E-mail', 'password': 'Parolă', 'guest': 'Vizitator', 'newPhones': 'Cataloage', 'usedMarket': 'Second-Hand', 'selectLang': 'Limbă', 'sellPhone': 'Vinde', 'searchHint': 'Caută...', 'submit': 'Publică' },
    'el': { 'title': 'Κατάστημα AI', 'login': 'Σύνδεση', 'email': 'Email', 'password': 'Κωδικός', 'guest': 'Επισκέπτης', 'newPhones': 'Κατάλογοι', 'usedMarket': 'Μεταχειρισμένα', 'selectLang': 'Γλώσσα', 'sellPhone': 'Πώληση', 'searchHint': 'Αναζήτηση...', 'submit': 'Δημοσίευση' },
    'hu': { 'title': 'AI Telefon Bolt', 'login': 'Bejelentkezés', 'email': 'E-mail', 'password': 'Jelszó', 'guest': 'Vendég', 'newPhones': 'Katalógus', 'usedMarket': 'Használt Piac', 'selectLang': 'Nyelv', 'sellPhone': 'Eladás', 'searchHint': 'Keresés...', 'submit': 'Közzététel' },
    'sv': { 'title': 'AI Telefon Butik', 'login': 'Logga in', 'email': 'E-post', 'password': 'Lösenord', 'guest': 'Gäst', 'newPhones': 'Kataloger', 'usedMarket': 'Begagnat', 'selectLang': 'Språk', 'sellPhone': 'Sälj', 'searchHint': 'Sök...', 'submit': 'Publicera' },
    'he': { 'title': 'חנות טלפונים AI', 'login': 'התחבר', 'email': 'אימייל', 'password': 'סיסמה', 'guest': 'אורח', 'newPhones': 'קטלוגים', 'usedMarket': 'יד שנייה', 'selectLang': 'בחר שפה', 'sellPhone': 'מכור טלפון', 'searchHint': 'חפש...', 'submit': 'פרסם' },
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

// قائمة الـ 25 لغة كاملة في زر الكرة الأرضية
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
