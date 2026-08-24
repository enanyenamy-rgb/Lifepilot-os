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
            isArabic ? 'مساعدك الرقمي المتفاعل (صوت، صورة، فيديو) جاهز لخدمتك.' : 'Your interactive digital assistant is ready.',
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
                  Text(isArabic ? 'حالة التفاعل والذكاء الاصطناعي' : 'AI & Media Status', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'محركات الوسائط:' : 'Media Engines:'),
                      const Text('Active (Voice/Vision)', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
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
          isArabic ? 'أدوات الذكاء الاصطناعي المتفاعلة' : 'Interactive AI Tools',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _buildToolCard(
          context,
          title: isArabic ? 'المساعد الذكي (AI Chat & Voice/Vision)' : 'AI Assistant (Chat, Voice, Media)',
          description: isArabic ? 'تفاعل بالصوت، النصوص، الصور، والفيديو مع المساعد.' : 'Interact via text, voice, images, and video.',
          icon: Icons.mic_external_on,
          color: Colors.deepPurple,
          destinationScreen: const AiInteractiveScreen(),
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'إدارة المهام والمشاريع المرئية' : 'Visual Task Management',
          description: isArabic ? 'تنظيم المهام مع دعم المرفقات البصرية والصوتية.' : 'Organize tasks with media support.',
          icon: Icons.task_alt,
          color: Colors.blue,
          destinationScreen: const TasksInteractiveScreen(),
        ),
        _buildToolCard(
          context,
          title: isArabic ? 'المحلل المالي والرسوم البيانية' : 'Market & Chart Analyzer',
          description: isArabic ? 'تحليل الأسواق عبر البيانات المرئية والصوتية.' : 'Analyze markets with visual insights.',
          icon: Icons.insights,
          color: Colors.orange,
          destinationScreen: const MarketInteractiveScreen(),
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

// 1. شاشة المساعد الذكي التفاعلي (صوت، صورة، فيديو، نص)
class AiInteractiveScreen extends StatefulWidget {
  const AiInteractiveScreen({super.key});

  @override
  State<AiInteractiveScreen> createState() => _AiInteractiveScreenState();
}

class _AiInteractiveScreenState extends State<AiInteractiveScreen> {
  final List<String> _messages = ['مرحباً بك! أنا مساعدك الذكي. كيف يمكنني مساعدتك اليوم بالصوت أو الصورة؟'];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add('أنت: $text');
        _messages.add('المساعد الذكي: لقد تلقيت طلبك وسأقوم بمعالجته فوراً 🚀');
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعد الذكي التفاعلي (AI Hub)')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isUser = _messages[index].startsWith('أنت:');
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.deepPurple.shade100 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(_messages[index], style: const TextStyle(fontSize: 16, color: Colors.black87)),
                  ),
                );
              },
            ),
          ),
          // أزرار التفاعل (صوت، صورة، فيديو)
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.deepPurple, size: 28),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('🎙️ جاري تسجيل الصوت والاستماع...')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.blue, size: 28),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('🖼️ تم فتح معرض الصور لتحليل الصورة...')));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.videocam, color: Colors.orange, size: 28),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('📹 تم تشغيل الكاميرا لتفاعل الفيديو...')));
                  },
                ),
              ],
            ),
          ),
          // حقل الإدخال النصي
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك هنا...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 2. شاشة إدارة المهام والمشاريع
class TasksInteractiveScreen extends StatelessWidget {
  const TasksInteractiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة المهام والمشاريع')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CheckboxListTile(
            title: const Text('تطوير واجهة مستخدم LifePilot OS'),
            subtitle: const Text('مرفق مرئي: فيديو توضيحي مرفق ✅'),
            value: true,
            onChanged: (val) {},
          ),
          CheckboxListTile(
            title: const Text('تفعيل محرك الأوامر الصوتية والصورية'),
            subtitle: const Text('مرفق صوتي مسجل 🎙️'),
            value: false,
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}

// 3. شاشة التحليل المالي والأسواق
class MarketInteractiveScreen extends StatelessWidget {
  const MarketInteractiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المحلل المالي والأسواق')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.show_chart, size: 80, color: Colors.orange),
              SizedBox(height: 20),
              Text('مؤشرات السوق والعملات جاهزة للتحليل الفوري', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('تدعم هذه الشاشة تحليل الرسوم البيانية بالذكاء الاصطناعي والصوت.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
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
          subtitle: const Text('LifePilot OS - Interactive AI Edition v1.0'),
        ),
      ],
    );
  }
}
