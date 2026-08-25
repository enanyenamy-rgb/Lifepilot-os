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

// مدخل الـ 25 لغة عالمية الأكثر انتشاراً
class AppState extends ChangeNotifier {
  bool isLoggedIn;
  String currentLang;

  AppState(this.isLoggedIn, this.currentLang);

  final Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'Ai Phone Store',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'guest': 'Continue as Guest',
      'newPhones': 'New Phones',
      'usedMarket': 'Used Market',
      'brands': 'Global Brands',
      'selectLang': 'Select Language',
    },
    'ar': {
      'title': 'متجر هواتف الذكاء الاصطناعي',
      'login': 'تسجيل الدخول',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'guest': 'المتابعة كزائر',
      'newPhones': 'الهواتف الجديدة',
      'usedMarket': 'سوق المستعمل',
      'brands': 'الماركات العالمية',
      'selectLang': 'اختر اللغة',
    },
    'es': {
      'title': 'Tienda de Teléfonos IA',
      'login': 'Iniciar Sesión',
      'email': 'Correo electrónico',
      'password': 'Contraseña',
      'guest': 'Continuar como Invitado',
      'newPhones': 'Teléfonos Nuevos',
      'usedMarket': 'Mercado Usado',
      'brands': 'Marcas Globales',
      'selectLang': 'Seleccionar Idioma',
    },
    'fr': {
      'title': 'Boutique de Téléphones IA',
      'login': 'Connexion',
      'email': 'E-mail',
      'password': 'Mot de passe',
      'guest': 'Continuer en tant qu\'invité',
      'newPhones': 'Nouveaux Téléphones',
      'usedMarket': 'Marché de l\'occasion',
      'brands': 'Marques Mondiales',
      'selectLang': 'Choisir la langue',
    },
    'zh': {
      'title': 'AI手机商店',
      'login': '登录',
      'email': '电子邮件',
      'password': '密码',
      'guest': '以游客身份继续',
      'newPhones': '新手机',
      'usedMarket': '二手市场',
      'brands': '全球品牌',
      'selectLang': '选择语言',
    },
    'de': { 'title': 'KI Handy-Shop', 'login': 'Anmelden', 'email': 'E-Mail', 'password': 'Passwort', 'guest': 'Als Gast fortfahren', 'newPhones': 'Neue Handys', 'usedMarket': 'Gebrauchtmarkt', 'brands': 'Globale Marken', 'selectLang': 'Sprache wählen' },
    'hi': { 'title': 'AI फ़ोन स्टोर', 'login': 'लॉगिन', 'email': 'ईमेल', 'password': 'पासवर्ड', 'guest': 'अतिथि के रूप में जारी रखें', 'newPhones': 'नए फोन', 'usedMarket': 'पुराना बाज़ार', 'brands': 'वैश्विक ब्रांड', 'selectLang': 'भाषा चुनيएं' },
    'ja': { 'title': 'AIフォンストア', 'login': 'ログイン', 'email': 'メール', 'password': 'パスワード', 'guest': 'ゲストとして続行', 'newPhones': '新しい携帯電話', 'usedMarket': '中古市場', 'brands': 'グローバルブランド', 'selectLang': '言語を選択' },
    'ru': { 'title': 'Магазин телефонов ИИ', 'login': 'Войти', 'email': 'Эл. почта', 'password': 'Пароль', 'guest': 'Продолжить как гость', 'newPhones': 'Новые телефоны', 'usedMarket': 'Рынок б/у', 'brands': 'Мировые бренды', 'selectLang': 'Выберите язык' },
    'pt': { 'title': 'Loja de Telefones IA', 'login': 'Entrar', 'email': 'E-mail', 'password': 'Senha', 'guest': 'Continuar como Convidado', 'newPhones': 'Novos Telefones', 'usedMarket': 'Mercado de Usados', 'brands': 'Marcas Globais', 'selectLang': 'Selecionar Idioma' },
    'it': { 'title': 'Negozio Telefono IA', 'login': 'Accesso', 'email': 'Email', 'password': 'Password', 'guest': 'Continua come ospite', 'newPhones': 'Nuovi Telefoni', 'usedMarket': 'Mercato Usato', 'brands': 'Marchi Globali', 'selectLang': 'Seleziona Lingua' },
    'tr': { 'title': 'Yapay Zeka Telefon Mağazası', 'login': 'Giriş Yap', 'email': 'E-posta', 'password': 'Şifre', 'guest': 'Misafir olarak devam et', 'newPhones': 'Yeni Telefonlar', 'usedMarket': 'İkinci El Pazarı', 'brands': 'Küresel Markalar', 'selectLang': 'Dil Seçin' },
    'ko': { 'title': 'AI 폰 스토어', 'login': '로그인', 'email': '이메일', 'password': '비밀번호', 'guest': '게스트로 계속', 'newPhones': '새 휴대폰', 'usedMarket': '중고 시장', 'brands': '글로벌 브랜드', 'selectLang': '언어 선택' },
    'vi': { 'title': 'Cửa hàng Điện thoại AI', 'login': 'Đăng nhập', 'email': 'Email', 'password': 'Mật khẩu', 'guest': 'Tiếp tục với tư cách Khách', 'newPhones': 'Điện thoại Mới', 'usedMarket': 'Chợ Đồ cũ', 'brands': 'Thương hiệu Toàn cầu', 'selectLang': 'Chọn Ngôn ngữ' },
    'pl': { 'title': 'Sklep Telefonów AI', 'login': 'Zaloguj się', 'email': 'E-mail', 'password': 'Hasło', 'guest': 'Kontynuuj jako gość', 'newPhones': 'Nowe Telefony', 'usedMarket': 'Rynek Wtórny', 'brands': 'Globalne Marki', 'selectLang': 'Wybierz Język' },
    'uk': { 'title': 'Магазин телефонів ШІ', 'login': 'Увійти', 'email': 'Ел. пошта', 'password': 'Пароль', 'guest': 'Продовжити як гість', 'newPhones': 'Нові телефони', 'usedMarket': 'Ринок б/у', 'brands': 'Світові бренды', 'selectLang': 'Виберіть мову' },
    'nl': { 'title': 'AI TelefoonWinkel', 'login': 'Inloggen', 'email': 'E-mail', 'password': 'Wachtwoord', 'guest': 'Ga verder als gast', 'newPhones': 'Nieuwe Telefoons', 'usedMarket': 'Tweedehands Markt', 'brands': 'Wereldwijde Merken', 'selectLang': 'Selecteer Taal' },
    'fa': { 'title': 'فروشگاه تلفن هوش مصنوعی', 'login': 'ورود', 'email': 'ایمیل', 'password': 'رمز عبور', 'guest': 'ادامه به عنوان مهمان', 'newPhones': 'گوشی‌های جدید', 'usedMarket': 'بازار دست دوم', 'brands': 'برندهای جهانی', 'selectLang': 'انتخاب زبان' },
    'id': { 'title': 'Toko Ponsel AI', 'login': 'Masuk', 'email': 'Email', 'password': 'Kata Sandi', 'guest': 'Lanjutkan sebagai Tamu', 'newPhones': 'Ponsel Baru', 'usedMarket': 'Pasar Bekas', 'brands': 'Merek Global', 'selectLang': 'Pilih Bahasa' },
    'ur': { 'title': 'اے آئی فون اسکور', 'login': 'لاگ ان', 'email': 'ای میل', 'password': 'پاس ورڈ', 'guest': 'بطور مہمان جاری رکھیں', 'newPhones': 'نئے فونز', 'usedMarket': 'پرانا بازار', 'brands': 'عالمی برانڈز', 'selectLang': 'زبان منتخب کریں' },
    'ro': { 'title': 'Magazin Telefoane AI', 'login': 'Autentificare', 'email': 'E-mail', 'password': 'Parolă', 'guest': 'Continuă ca vizitator', 'newPhones': 'Telefoane Noi', 'usedMarket': 'Piața Second-Hand', 'brands': 'Mărci Globale', 'selectLang': 'Selectează limba' },
    'el': { 'title': 'Κατάστημα Τηλεφώνων AI', 'login': 'Σύνδεση', 'email': 'Email', 'password': 'Κωδικός', 'guest': 'Συνέχεια ως επισκέπτης', 'newPhones': 'Nέα Tηλέφωνα', 'usedMarket': 'Αγορά Μεταχειρισμένων', 'brands': 'Παγκόσμιες Μάρκες', 'selectLang': 'Επιλέξτε γλώσσα' },
    'hu': { 'title': 'AI Telefon Bolt', 'login': 'Bejelentkezés', 'email': 'E-mail', 'password': 'Jelszó', 'guest': 'Folytatás vendégként', 'newPhones': 'Új Telefonok', 'usedMarket': 'Használt Piac', 'brands': 'Globális Márkák', 'selectLang': 'Nyelv kiválasztása' },
    'sv': { 'title': 'AI Telefon Butik', 'login': 'Logga in', 'email': 'E-post', 'password': 'Lösenord', 'guest': 'Fortsätt som gäst', 'newPhones': 'Nya Telefoner', 'usedMarket': 'Begagnatmarknad', 'brands': 'Globala Märken', 'selectLang': 'Välj språk' },
    'he': { 'title': 'חנות טלפונים AI', 'login': 'התחבר', 'email': 'אימייל', 'password': 'סיסמה', 'guest': 'המשך אורח', 'newPhones': 'טלפונים חדשים', 'usedMarket': 'שוק יד שנייה', 'brands': 'מותגים גלובליים', 'selectLang': 'בחר שפה' },
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

// نافذة اختيار اللغة العالمية (25 لغة)
void showLanguageDialog(BuildContext context) {
  final appState = Provider.of<AppState>(context, listen: false);
  final languages = {
    'en': 'English (الإنجليزية)',
    'ar': 'العربية (Arabic)',
    'es': 'Español (الإسبانية)',
    'fr': 'Français (الفرنسية)',
    'zh': '中文 (الصينية)',
    'de': 'Deutsch (الألمانية)',
    'hi': 'हिन्दी (الهندية)',
    'ja': '日本語 (اليابانية)',
    'ru': 'Русский (الروسية)',
    'pt': 'Português (البرتغالية)',
    'it': 'Italiano (الإيطالية)',
    'tr': 'Türkçe (التركية)',
    'ko': '한국어 (الكورية)',
    'vi': 'Tiếng Việt (الفيتنامية)',
    'pl': 'Polski (البولندية)',
    'uk': 'Українська (الأوكرانية)',
    'nl': 'Nederlands (الهولندية)',
    'fa': 'فارسی (الفارسية)',
    'id': 'Bahasa Indonesia (الإندونيسية)',
    'ur': 'اردو (الأوردو)',
    'ro': 'Română (الرومانية)',
    'el': 'Ελληνικά (اليونانية)',
    'hu': 'Magyar (المجرية)',
    'sv': 'Svenska (السويدية)',
    'he': 'עברית (العبرية)',
  };

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(appState.getText('selectLang')),
        content: SizedBox(
          width: double.maxFinite,
          height: 350,
          child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              String key = languages.keys.elementAt(index);
              String name = languages[key]!;
              return ListTile(
                title: Text(name),
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
  bool isLoginView = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appState.getText('title')),
        actions: [
          // زر الكرة الأرضية لتغيير اللغات الـ 25
          IconButton(
            icon: const Icon(Icons.language, color: Colors.amber, size: 28),
            onPressed: () => showLanguageDialog(context),
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
                Text(
                  appState.getText('title'),
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: appState.getText('email'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: appState.getText('password'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
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
                    appState.setLoginStatus(true);
                  },
                  child: Text(appState.getText('login')),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    appState.setLoginStatus(true);
                  },
                  child: Text(appState.getText('guest')),
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
    final appState = Provider.of<AppState>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appState.getText('title')),
          actions: [
            // زر الكرة الأرضية في الشاشة الرئيسية أيضاً
            IconButton(
              icon: const Icon(Icons.language, color: Colors.amber, size: 28),
              onPressed: () => showLanguageDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                appState.setLoginStatus(false);
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: const Icon(Icons.new_releases), text: appState.getText('newPhones')),
              Tab(icon: const Icon(Icons.storefront), text: appState.getText('usedMarket')),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BrandsDirectoryTab(),
            UsedMarketTab(),
          ],
        ),
      ),
    );
  }
}

// قسم الماركات العالمية الشاملة وتحت كل ماركة أنواعها في السوق العالمي
class BrandsDirectoryTab extends StatelessWidget {
  const BrandsDirectoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> globalBrands = {
      'Samsung (سامسونج)': [
        {'model': 'Galaxy S25 Ultra', 'specs': 'Snapdragon 8 Elite, 200MP, 5000mAh', 'price': '\$1,299'},
        {'model': 'Galaxy S25+', 'specs': 'Exynos / Snapdragon, 50MP, 4900mAh', 'price': '\$999'},
        {'model': 'Galaxy Z Fold 6', 'specs': 'Foldable Dynamic AMOLED 2X, 7.6"', 'price': '\$1,799'},
        {'model': 'Galaxy A55 5G', 'specs': 'Exynos 1480, 50MP Camera, 5000mAh', 'price': '\$399'},
      ],
      'Apple (آبل)': [
        {'model': 'iPhone 17 Pro Max', 'specs': 'A19 Pro Chip, 48MP Triple Cam, Titanium', 'price': '\$1,399'},
        {'model': 'iPhone 17 Pro', 'specs': 'A19 Pro, Compact Form Factor', 'price': '\$1,099'},
        {'model': 'iPhone 16', 'specs': 'A18 Chip, Dual 48MP Camera', 'price': '\$799'},
        {'model': 'iPhone 15', 'specs': 'A16 Bionic, Dynamic Island', 'price': '\$699'},
      ],
      'Honor (هونر)': [
        {'model': 'Honor X9d', 'specs': 'Ultra Tough Display, Massive Battery, 108MP', 'price': '\$450'},
        {'model': 'Honor Magic 6 Pro', 'specs': 'Snapdragon 8 Gen 3, Falcon Camera', 'price': '\$950'},
        {'model': 'Honor 200 Pro', 'specs': 'Snapdragon 8s Gen 3, Studio Portrait', 'price': '\$550'},
      ],
      'Xiaomi (شاومي)': [
        {'model': 'Xiaomi 14 Ultra', 'specs': 'Leica Quad Camera, Snapdragon 8 Gen 3', 'price': '\$1,199'},
        {'model': 'Redmi Note 13 Pro+', 'specs': '200MP OIS Camera, MediaTek 7200-Ultra', 'price': '\$380'},
        {'model': 'Poco X6 Pro', 'specs': 'Dimensity 8300-Ultra, 120Hz AMOLED', 'price': '\$340'},
      ],
      'Huawei (هواوي)': [
        {'model': 'Huawei Pura 70 Ultra', 'specs': '1-inch Retractable Camera, Kirin 9010', 'price': '\$1,250'},
        {'model': 'Huawei Mate 60 Pro', 'specs': 'Satellite Calling, Kunlun Glass', 'price': '\$999'},
      ],
      'Google Pixel (جوجل بكسل)': [
        {'model': 'Pixel 9 Pro XL', 'specs': 'Google Tensor G4, Advanced AI, 16GB RAM', 'price': '\$1,099'},
        {'model': 'Pixel 8a', 'specs': 'Tensor G3, 7 Years OS Updates', 'price': '\$499'},
      ],
      'OnePlus (ون بلس)': [
        {'model': 'OnePlus 12', 'specs': 'Snapdragon 8 Gen 3, Hasselblad Camera', 'price': '\$799'},
        {'model': 'OnePlus Nord 4', 'specs': 'Metal Unibody, Snapdragon 7+ Gen 3', 'price': '\$420'},
      ],
      'Oppo & Vivo (أوبو وفيفو)': [
        {'model': 'Oppo Find X7 Ultra', 'specs': 'Dual Periscope Zoom, Snapdragon 8 Gen 3', 'price': '\$1,150'},
        {'model': 'Vivo X100 Pro', 'specs': 'Zeiss Apo Telephoto, Dimensity 9300', 'price': '\$980'},
      ],
    };

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: globalBrands.length,
      itemBuilder: (context, index) {
        String brandName = globalBrands.keys.elementAt(index);
        List<Map<String, String>> phones = globalBrands[brandName]!;

        return ExpansionTile(
          leading: const Icon(Icons.smartphone, color: Colors.amber),
          title: Text(
            brandName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          children: phones.map((phone) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: const Color(0xFF1E293B),
              child: ListTile(
                title: Text(phone['model']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                subtitle: Text(phone['specs']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                trailing: Text(phone['price']!, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            );
          }).toList(),
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
      {'phone': 'iPhone 15 Pro (مستعمل / Used)', 'price': '\$750', 'location': 'نفس الدولة / Local Country'},
      {'phone': 'Samsung S24 Ultra (مستعمل / Used)', 'price': '\$850', 'location': 'نفس الدولة / Local Country'},
      {'phone': 'Xiaomi 13 Pro (مستعمل / Used)', 'price': '\$450', 'location': 'نفس الدولة / Local Country'},
    ];

    return ListView.builder(
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
                  '🔒 Verified Seller (Official ID verified for buyer & seller safety)',
                  style: TextStyle(color: Colors.amber, fontSize: 11),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
