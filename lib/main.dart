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
  bool _isDarkMode = false;

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
      home: HomeScreen(onThemeChanged: toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const HomeScreen({super.key, required this.onThemeChanged, required this.isDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens = [
    const DashboardTab(),
    const ToolsTab(),
    SettingsTab(onThemeChanged: widget.onThemeChanged, isDarkMode: widget.isDarkMode),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot OS', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'الأدوات الذكية',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'الإعدادات',
          ),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text(
            'مرحباً بك في عالمك الذكي 🚀',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'مساعدك الشخصي المتعدد المهام جاهز لإدارة أعمالك ويومك بكفاءة عالية.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('حالة النظام والأداء', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('إصدار التطبيق:'),
                      Text('v1.0.0 Pro', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('حالة السيرفر والاتصال:'),
                      Text('متصل وجاهز ✅', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
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
  const ToolsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'أدوات الذكاء الاصطناعي والإنتاجية',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildToolCard(
          context,
          title: 'المساعد الذكي (AI Chat)',
          description: 'تحدث مع مساعدك الرقمي لتنفيذ المهام وتحليل البيانات.',
          icon: Icons.chat_bubble_outline,
          color: Colors.deepPurple,
        ),
        _buildToolCard(
          context,
          title: 'إدارة المهام والمشاريع',
          description: 'تنظيم مهامك اليومية وأعمالك الإدارية بكفاءة عالية.',
          icon: Icons.task_alt,
          color: Colors.blue,
        ),
        _buildToolCard(
          context,
          title: 'المحلل المالي والأسواق',
          description: 'متابعة المؤشرات والعملات وأدوات التحليل الذكية.',
          icon: Icons.insights,
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildToolCard(BuildContext context, {required String title, required String description, required IconData icon, required Color color}) {
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
            SnackBar(content: Text('جاري فتح أداة: $title')),
          );
        },
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const SettingsTab({super.key, required this.onThemeChanged, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'إعدادات النظام',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        SwitchListTile(
          title: const Text('الوضع الليلي (Dark Mode)'),
          subtitle: constText('تغيير مظهر التطبيق إلى الوضع الداكن'),
          secondary: const Icon(Icons.dark_mode_outlined),
          value: isDarkMode,
          onChanged: (bool value) {
            onThemeChanged();
          },
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.language),
          title: Text('لغة التطبيق'),
          subtitle: Text('العربية (افتراضي)'),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('حول النظام'),
          subtitle: Text('LifePilot OS - All-in-One Enterprise Solution v1.0'),
        ),
      ],
    );
  }
}
