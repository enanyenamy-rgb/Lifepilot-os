import 'package:flutter/material.dart';
import 'app_translations.dart';

void main() {
  runApp(const AiPhoneApp());
}

class AiPhoneApp extends StatefulWidget {
  const AiPhoneApp({super.key});

  @override
  State<AiPhoneApp> createState() => _AiPhoneAppState();
}

class _AiPhoneAppState extends State<AiPhoneApp> {
  Locale _currentLocale = const Locale('en');

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _currentLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Phone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      locale: _currentLocale,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        AppTranslationsDelegate(),
      ],
      home: HomeScreen(onLanguageChanged: _changeLanguage),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;

  const HomeScreen({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));

    return Scaffold(
      appBar: AppBar(
        title: Text(t.appTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0F172A),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newCode = Localizations.localeOf(context).languageCode == 'en' ? 'ar' : 'en';
              onLanguageChanged(Locale(newCode));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.appTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    t.welcomeMessage,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: t.searchHint,
                prefixIcon: const Icon(Icons.search, color: Color(0xFF2563EB)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t.specsTab,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: const ListTile(
                leading: Icon(Icons.phone_android, size: 40, color: Color(0xFF2563EB)),
                title: Text('Samsung Galaxy S25 Ultra', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('AI Specs: Snapdragon 8 Gen 4, 12GB RAM'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t.usedMarketTab,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('iPhone 15 Pro Max (Used)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('\$850', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Condition: Excellent (Local Country Only)', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.lock_open),
                        label: Text(t.revealContact),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
