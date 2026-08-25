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
  List<UsedPhoneItem> userListings = [
    UsedPhoneItem(phoneName: 'iPhone 15 Pro', price: '\$750', location: 'Local Country', details: 'Mint condition, 256GB, battery health 90%'),
    UsedPhoneItem(phoneName: 'Samsung S24 Ultra', price: '\$850', location: 'Local Country', details: 'Like new with original box and accessories'),
  ];

  AppState(this.isLoggedIn, this.currentLang);

  void addListing(String name, String price, String details) {
    userListings.add(UsedPhoneItem(phoneName: name, price: price, location: 'Local Country', details: details));
    notifyListeners();
  }

  final Map<String, Map<String, String>> translations = {
    'en': {
      'title': 'Ai Phone Store',
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'guest': 'Continue as Guest',
      'newPhones': 'New Phones',
      'usedMarket': 'Used Market',
      'selectLang': 'Select Language',
      'sellPhone': 'List Your Phone for Sale',
      'phoneName': 'Phone Model Name',
      'price': 'Price (\$)',
      'details': 'Condition & Specs Details',
      'submit': 'Publish Listing',
    },
    'ar': {
      'title': 'متجر هواتف الذكاء الاصطناعي',
      'login': 'تسجيل الدخول',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'guest': 'المتابعة كزائر',
      'newPhones': 'الهواتف الجديدة',
      'usedMarket': 'سوق المستعمل',
      'selectLang': 'اختر اللغة',
      'sellPhone': 'أضف هاتفك للبيع',
      'phoneName': 'اسم موديل الهاتف',
      'price': 'السعر (\$)',
      'details': 'تفاصيل الحالة والمواصفات',
      'submit': 'نشر الإعلان',
    },
    'es': { 'title': 'Tienda IA de Teléfonos', 'login': 'Iniciar Sesión', 'email': 'Correo', 'password': 'Contraseña', 'guest': 'Continuar como Invitado', 'newPhones': 'Nuevos', 'usedMarket': 'Usados', 'selectLang': 'Seleccionar Idioma', 'sellPhone': 'Vender tu Teléfono', 'phoneName': 'Modelo', 'price': 'Precio', 'details': 'Detalles', 'submit': 'Publicar' },
    'fr': { 'title': 'Boutique Téléphone AI', 'login': 'Connexion', 'email': 'E-mail', 'password': 'Mot de passe', 'guest': 'Invité', 'newPhones': 'Nouveaux', 'usedMarket': 'Occasion', 'selectLang': 'Langue', 'sellPhone': 'Vendre un téléphone', 'phoneName': 'Modèle', 'price': 'Prix', 'details': 'Détails', 'submit': 'Publier' },
    'zh': { 'title': 'AI手机商店', 'login': '登录', 'email': '电子邮件', 'password': '密码', 'guest': '游客登录', 'newPhones': '新手机', 'usedMarket': '二手市场', 'selectLang': '选择语言', 'sellPhone': '出售手机', 'phoneName': '手机型号', 'price': '价格', 'details': '详情', 'submit': '发布' },
    'de': { 'title': 'KI Handy Shop', 'login': 'Anmelden', 'email': 'E-Mail', 'password': 'Passwort', 'guest': 'Gast', 'newPhones': 'Neu', 'usedMarket': 'Gebraucht', 'selectLang': 'Sprache', 'sellPhone': 'Handy verkaufen', 'phoneName': 'Modell', 'price': 'Preis', 'details': 'Details', 'submit': 'Veröffentlichen' },
    'hi': { 'title': 'AI फ़ोन स्टोर', 'login': 'लॉगिन', 'email': 'ईमेल', 'password': 'पासवर्ड', 'guest': 'अतिथि', 'newPhones': 'नया', 'usedMarket': 'पुराना', 'selectLang': 'भाषा', 'sellPhone': 'फोन बेचें', 'phoneName': 'मॉडल', 'price': 'मूल्य', 'details': 'विवरण', 'submit': 'प्रकाशित करें' },
    'ja': { 'title': 'AIフォンストア', 'login': 'ログイン', 'email': 'メール', 'password': 'パスワード', 'guest': 'ゲスト', 'newPhones': '新着', 'usedMarket': '中古', 'selectLang': '言語', 'sellPhone': 'スマホを出品', 'phoneName': 'モデル', 'price': '価格', 'details': '詳細', 'submit': '投稿' },
    'ru': { 'title': 'Магазин ИИ Телефон', 'login': 'Войти', 'email': 'Почта', 'password': 'Пароль', 'guest': 'Гость', 'newPhones': 'Новые', 'usedMarket': 'Б/У', 'selectLang': 'Язык', 'sellPhone': 'Продать телефон', 'phoneName': 'Модель', 'price': 'Цена', 'details': 'Детали', 'submit': 'Опубликовать' },
    'tr': { 'title': 'AI Telefon Mağazası', 'login': 'Giriş', 'email': 'E-posta', 'password': 'Şifre', 'guest': 'Misafir', 'newPhones': 'Yeni', 'usedMarket': 'İkinci El', 'selectLang': 'Dil', 'sellPhone': 'Telefon Sat', 'phoneName': 'Model', 'price': 'Fiyat', 'details': 'Detaylar', 'submit': 'Yayınla' },
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

void showLanguageDialog(BuildContext context) {
  final appState = Provider.of<AppState>(context, listen: false);
  final languages = {
    'en': 'English',
    'ar': 'العربية',
    'es': 'Español',
    'fr': 'Français',
    'zh': '中文',
    'de': 'Deutsch',
    'hi': 'हिन्दी',
    'ja': '日本語',
    'ru': 'Русский',
    'tr': 'Türkçe',
  };

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(appState.getText('selectLang')),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appState.getText('title')),
        actions: [
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
                Text(appState.getText('title'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: appState.getText('email'), border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.email)),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: appState.getText('password'), border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.lock)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, minimumSize: const Size.fromHeight(50)),
                  onPressed: () => appState.setLoginStatus(true),
                  child: Text(appState.getText('login')),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  onPressed: () => appState.setLoginStatus(true),
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
            IconButton(
              icon: const Icon(Icons.language, color: Colors.amber, size: 28),
              onPressed: () => showLanguageDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => appState.setLoginStatus(false),
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
            NewPhonesTab(),
            UsedMarketTab(),
          ],
        ),
      ),
    );
  }
}

// نافذة تفاصيل الهاتف (عرض الصور، الفيديو، والمواصفات الكاملة)
void showPhoneDetailsDialog(BuildContext context, String model, String specs, String price) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(model, style: const TextStyle(color: Colors.amber)),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.phone_android, size: 70, color: Colors.amber),
                  ),
                ),
                const SizedBox(height: 15),
                Text('Price: $price', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyanAccent)),
                const SizedBox(height: 10),
                const Text('Key Specifications:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(specs, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 15),
                const Text('AI Review & Video Demo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 5),
                const Text('• Official 4K video showcase & AI benchmark analysis available.\n• Global warranty & verified certified network support.', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.amber)),
          ),
        ],
      );
    },
  );
}

class NewPhonesTab extends StatelessWidget {
  const NewPhonesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> globalBrands = {
      'Samsung': [
        {'model': 'Galaxy S25 Ultra', 'specs': 'Snapdragon 8 Elite, 200MP Camera, 5000mAh Battery', 'price': '\$1,299'},
        {'model': 'Galaxy S25+', 'specs': 'Exynos / Snapdragon, 50MP Triple Camera, 4900mAh', 'price': '\$999'},
        {'model': 'Galaxy Z Fold 6', 'specs': 'Foldable Dynamic AMOLED 2X, Snapdragon 8 Gen 3', 'price': '\$1,799'},
        {'model': 'Galaxy A55 5G', 'specs': 'Exynos 1480, 50MP Camera, 5000mAh Battery', 'price': '\$399'},
      ],
      'Apple': [
        {'model': 'iPhone 17 Pro Max', 'specs': 'A19 Pro Chip, 48MP Triple Camera, Titanium Body', 'price': '\$1,399'},
        {'model': 'iPhone 17 Pro', 'specs': 'A19 Pro Chip, Compact Form Factor, ProMotion', 'price': '\$1,099'},
        {'model': 'iPhone 16', 'specs': 'A18 Chip, Dual 48MP Camera System', 'price': '\$799'},
        {'model': 'iPhone 15', 'specs': 'A16 Bionic, Dynamic Island, 48MP Camera', 'price': '\$699'},
      ],
      'Honor': [
        {'model': 'Honor X9d', 'specs': 'Ultra Tough Display, Massive Battery, 108MP Camera', 'price': '\$450'},
        {'model': 'Honor Magic 6 Pro', 'specs': 'Snapdragon 8 Gen 3, Falcon Camera System', 'price': '\$950'},
        {'model': 'Honor 200 Pro', 'specs': 'Snapdragon 8s Gen 3, Studio Portrait Engine', 'price': '\$550'},
      ],
      'Xiaomi': [
        {'model': 'Xiaomi 14 Ultra', 'specs': 'Leica Quad Camera, Snapdragon 8 Gen 3', 'price': '\$1,199'},
        {'model': 'Redmi Note 13 Pro+', 'specs': '200MP OIS Camera, MediaTek 7200-Ultra', 'price': '\$380'},
        {'model': 'Poco X6 Pro', 'specs': 'Dimensity 8300-Ultra, 120Hz AMOLED Screen', 'price': '\$340'},
      ],
      'Huawei': [
        {'model': 'Huawei Pura 70 Ultra', 'specs': '1-inch Retractable Camera, Kirin 9010', 'price': '\$1,250'},
        {'model': 'Huawei Mate 60 Pro', 'specs': 'Satellite Calling, Kunlun Glass Protection', 'price': '\$999'},
      ],
      'Google Pixel': [
        {'model': 'Pixel 9 Pro XL', 'specs': 'Google Tensor G4, Advanced AI, 16GB RAM', 'price': '\$1,099'},
        {'model': 'Pixel 8a', 'specs': 'Tensor G3, 7 Years OS Updates Support', 'price': '\$499'},
      ],
      'OnePlus': [
        {'model': 'OnePlus 12', 'specs': 'Snapdragon 8 Gen 3, Hasselblad Camera for Mobile', 'price': '\$799'},
        {'model': 'OnePlus Nord 4', 'specs': 'Metal Unibody, Snapdragon 7+ Gen 3', 'price': '\$420'},
      ],
    };

    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: globalBrands.length,
      itemBuilder: (context, index) {
        String brandName = globalBrands.keys.elementAt(index);
        List<Map<String, String>> phones = globalBrands[brandName]!;

        return ExpansionTile(
          leading: const Icon(Icons.phone_android, color: Colors.amber),
          title: Text(brandName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          children: phones.map((phone) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: const Color(0xFF1E293B),
              child: ListTile(
                leading: const Icon(Icons.image, color: Colors.cyanAccent),
                title: Text(phone['model']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                subtitle: Text(phone['specs']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                trailing: Text(phone['price']!, style: const TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 14)),
                onTap: () => showPhoneDetailsDialog(context, phone['model']!, phone['specs']!, phone['price']!),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

// سوق المستعمل مع زر إضافة هاتف جديد للبائع
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
          title: Text(appState.getText('sellPhone')),
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
              child: const Text('Cancel'),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: appState.userListings.length,
        itemBuilder: (context, index) {
          final item = appState.userListings[index];
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
                      Text(item.phoneName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(item.price, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(item.details, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.redAccent),
                      SizedBox(width: 5),
                      Text('Local Country', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '🔒 Verified Seller (Official ID verified for buyer & seller safety)',
                    style: TextStyle(color: Colors.amber, fontSize: 11),
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
        icon: const Icon(Icons.add_photo_alternate),
        label: Text(appState.getText('sellPhone')),
        onPressed: () => showAddListingDialog(context),
      ),
    );
  }
}
