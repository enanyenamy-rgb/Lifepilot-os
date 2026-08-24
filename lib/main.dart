import 'package:flutter/material.dart';

void main() {
  runApp(const LifePilotApp());
}

class LifePilotApp extends StatefulWidget {
  const LifePilotApp({super.key});

  @override
  State<LifePilotApp> createState() => _LifePilotAppState();
}

class _LifePilotAppState extends State<LifePilotApp> {
  String _currentLanguage = 'العربية';
  bool _isDarkMode = false;

  void changeLanguage(String lang) {
    setState(() {
      _currentLanguage = lang;
    });
  }

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        currentLanguage: _currentLanguage,
        onLanguageChanged: changeLanguage,
        isDarkMode: _isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String currentLanguage;
  final ValueChanged<String> onLanguageChanged;
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const HomeScreen({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isArabic = widget.currentLanguage == 'العربية';

    final List<Widget> screens = [
      DashboardTab(currentLanguage: widget.currentLanguage),
      ToolsTab(currentLanguage: widget.currentLanguage),
      SettingsTab(
        currentLanguage: widget.currentLanguage,
        onLanguageChanged: widget.onLanguageChanged,
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'LifePilot OS - نظام التشغيل الذكي' : 'LifePilot OS - Global Smart OS',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard_outlined),
            selectedIcon: const Icon(Icons.dashboard),
            label: isArabic ? 'الرئيسية' : 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.auto_awesome_outlined),
            selectedIcon: const Icon(Icons.auto_awesome),
            label: isArabic ? 'الأدوات الذكية' : 'AI Tools',
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: isArabic ? 'الإعدادات' : 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  final String currentLanguage;
  const DashboardTab({super.key, required this.currentLanguage});

  @override
  Widget build(BuildContext context) {
    bool isArabic = currentLanguage == 'العربية';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            isArabic ? 'مرحباً بك في عالمك الذكي 🚀' : 'Welcome to Your Smart World 🚀',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            isArabic ? 'مساعدك الشخصي العالمي جاهز لإدارة أعمالك بكفاءة.' : 'Your global personal assistant is ready.',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isArabic ? 'حالة النظام والأداء' : 'System Status', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'إصدار التطبيق:' : 'Version:'),
                      const Text('v1.0.0 Global', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'اللغة الحالية:' : 'Current Lang:'),
                      Text(currentLanguage, style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToolsTab extends StatelessWidget {
  final String currentLanguage;
  const ToolsTab({super.key, required this.currentLanguage});

  @override
  Widget build(BuildContext context) {
    bool isArabic = currentLanguage == 'العربية';
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          isArabic ? 'أدوات الذكاء الاصطناعي والإنتاجية' : 'AI & Productivity Tools',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildToolCard(
          context,
          title: isArabic ? 'المساعد الذكي (AI Chat)' : 'AI Smart Assistant',
          description: isArabic ? 'تحدث مع مساعدك الرقمي لتنفيذ المهام.' : 'Chat with your digital assistant.',
          icon: Icons.chat_bubble_outline,
          color: Colors.deepPurple,
          destinationScreen: const AiChatScreen(),
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'إدارة المهام والمشاريع' : 'Task Management',
          description: isArabic ? 'تنظيم مهامك اليومية بكفاءة عالية.' : 'Organize your daily tasks.',
          icon: Icons.task_alt,
          color: Colors.blue,
          destinationScreen: const TasksScreen(),
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'المحلل المالي والأسواق' : 'Market Analyzer',
          description: isArabic ? 'متابعة المؤشرات وأدوات التحليل.' : 'Track market indicators.',
          icon: Icons.insights,
          color: Colors.orange,
          destinationScreen: const MarketScreen(),
        ),
      ],
    );
  }

  Widget _buildToolCard(BuildContext context, {required String title, required String description, required IconData icon, required Color color, required Widget destinationScreen}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(description, style: const TextStyle(color: Colors.grey)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
      ),
    );
  }
}

class AiChatScreen extends StatelessWidget {
  const AiChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Smart Assistant')),
      body: const Center(child: Text('🤖 AI Chat Screen Active', style: TextStyle(fontSize: 18))),
    );
  }
}

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Management')),
      body: const Center(child: Text('📋 Tasks Management Screen Active', style: TextStyle(fontSize: 18))),
    );
  }
}

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Analyzer')),
      body: const Center(child: Text('📈 Market Analyzer Screen Active', style: TextStyle(fontSize: 18))),
    );
  }
}

class SettingsTab extends StatelessWidget {
  final String currentLanguage;
  final ValueChanged<String> onLanguageChanged;
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const SettingsTab({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = currentLanguage == 'العربية';
    
    // قائمة أهم 25 لغة عالمية
    final List<String> worldLanguages = [
      'العربية', 'English', 'Français', 'Español', 'Deutsch',
      '中文 (Chinese)', 'हिन्दी (Hindi)', '日本語 (Japanese)', 'Русский (Russian)', 'Português',
      'Italiano', 'Türkçe', '한국어 (Korean)', 'Tiếng Việt', 'Polski',
      'فارسی (Persian)', 'Nederlands', 'Ελληνικά (Greek)', 'Română', 'Magyar',
      'ไทย (Thai)', 'Bahasa Indonesia', 'svenska', 'Čeština', 'Українська'
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(isArabic ? 'إعدادات النظام' : 'System Settings', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        SwitchListTile(
          title: Text(isArabic ? 'الوضع الليلي' : 'Dark Mode'),
          subtitle: Text(isArabic ? 'تغيير مظهر التطبيق إلى الوضع الداكن' : 'Switch theme to dark mode'),
          secondary: const Icon(Icons.dark_mode_outlined),
          value: isDarkMode,
          onChanged: (bool value) => onThemeChanged(),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(isArabic ? 'لغة التطبيق (25 لغة عالمية)' : 'App Language (25 Languages)'),
          subtitle: Text(currentLanguage),
          trailing: DropdownButton<String>(
            value: worldLanguages.contains(currentLanguage) ? currentLanguage : 'English',
            isDense: true,
            items: worldLanguages.map((String lang) {
              return DropdownMenuItem<String>(
                value: lang,
                child: Text(lang, style: const TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) onLanguageChanged(newValue);
            },
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(isArabic ? 'حول النظام' : 'About System'),
          subtitle: const Text('LifePilot OS - Global Edition v1.0'),
        ),
      ],
    );
  }
}
