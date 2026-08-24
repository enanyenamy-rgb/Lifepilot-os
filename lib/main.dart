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
    bool isArabic = _currentLanguage == 'العربية';

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
      DashboardTab(isArabic: isArabic),
      ToolsTab(isArabic: isArabic),
      SettingsTab(
        currentLanguage: widget.currentLanguage,
        onLanguageChanged: widget.onLanguageChanged,
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
        isArabic: isArabic,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'LifePilot OS - نظام التشغيل الذكي' : 'LifePilot OS - Smart System',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            label: isArabic ? 'الرئيسية' : 'Dashboard',
          ),
          NavigationDestination(
            icon: const Icon(Icons.auto_awesome_outlined),
            selectedIcon: const Icon(Icons.auto_awesome),
            label: isArabic ? 'الأدوات الذكية' : 'Smart Tools',
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
  final bool isArabic;
  const DashboardTab({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
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
            isArabic
                ? 'مساعدك الشخصي المتعدد المهام جاهز لإدارة أعمالك ويومك بكفاءة عالية.'
                : 'Your multi-tasking personal assistant is ready to manage your workflow.',
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
                  Text(
                    isArabic ? 'حالة النظام والأداء' : 'System & Performance Status',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'إصدار التطبيق:' : 'App Version:'),
                      const Text('v1.0.0 Pro Enterprise', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'حالة الاتصال:' : 'Connection Status:'),
                      Text(
                        isArabic ? 'متصل وجاهز ✅' : 'Connected & Ready ✅',
                        style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
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
  final bool isArabic;
  const ToolsTab({super.key, required this.isArabic});

  @override
  Widget build(BuildContext context) {
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
          description: isArabic ? 'تحدث مع مساعدك الرقمي لتنفيذ المهام وتحليل البيانات.' : 'Chat with your digital assistant for tasks and analysis.',
          icon: Icons.chat_bubble_outline,
          color: Colors.deepPurple,
          isArabic: isArabic,
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'إدارة المهام والمشاريع' : 'Task & Project Management',
          description: isArabic ? 'تنظيم مهامك اليومية وأعمالك الإدارية بكفاءة عالية.' : 'Organize your daily tasks and administrative work efficiently.',
          icon: Icons.task_alt,
          color: Colors.blue,
          isArabic: isArabic,
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'المحلل المالي والأسواق' : 'Market & Financial Analyzer',
          description: isArabic ? 'متابعة المؤشرات والعملات وأدوات التحليل الذكية.' : 'Track indicators, currencies, and smart analytics tools.',
          icon: Icons.insights,
          color: Colors.orange,
          isArabic: isArabic,
        ),
      ],
    );
  }

  Widget _buildToolCard(BuildContext context, {required String title, required String description, required IconData icon, required Color color, required bool isArabic}) {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(isArabic ? 'جاري فتح أداة: $title' : 'Opening tool: $title')),
          );
        },
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  final String currentLanguage;
  final ValueChanged<String> onLanguageChanged;
  final bool isDarkMode;
  final VoidCallback onThemeChanged;
  final bool isArabic;

  const SettingsTab({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          isArabic ? 'إعدادات النظام' : 'System Settings',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        SwitchListTile(
          title: Text(isArabic ? 'الوضع الليلي (Dark Mode)' : 'Dark Mode'),
          subtitle: Text(isArabic ? 'تغيير مظهر التطبيق إلى الوضع الداكن' : 'Switch app theme to dark mode'),
          secondary: const Icon(Icons.dark_mode_outlined),
          value: isDarkMode,
          onChanged: (bool value) {
            onThemeChanged();
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(isArabic ? 'لغة التطبيق' : 'App Language'),
          subtitle: Text(currentLanguage),
          trailing: DropdownButton<String>(
            value: currentLanguage,
            items: const [
              DropdownMenuItem(value: 'العربية', child: Text('العربية')),
              DropdownMenuItem(value: 'English', child: Text('English')),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                onLanguageChanged(newValue);
              }
            },
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(isArabic ? 'حول النظام' : 'About System'),
          subtitle: const Text('LifePilot OS - Enterprise Solution v1.0'),
        ),
      ],
    );
  }
}
