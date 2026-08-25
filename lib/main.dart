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
          home: appState.isLoggedIn ? const HomeScreen() : const AuthWrapper(),
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
          // زر الكرة الأرضية للغات (أكثر من 25 لغة)
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
                    // تسجيل الدخول وحفظ الحالة
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
                    // الدخول كزائر
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ai Phone Store - Global Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // زر تسجيل الخروج
              Provider.of<AppState>(context, listen: false).setLoginStatus(false);
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store, size: 100, color: Colors.cyanAccent),
            SizedBox(height: 20),
            Text(
              'Welcome to Ai Phone Store Home!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'New Phones & Local Used Market (With AI Assistant)',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
