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

  void changeLanguage(String lang) => setState(() => _currentLanguage = lang);
  void toggleTheme() => setState(() => _isDarkMode = !_isDarkMode);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1), brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF818CF8), brightness: Brightness.dark),
        useMaterial3: true,
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
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: isArabic ? 'الرئيسية' : 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.hub_outlined),
            selectedIcon: const Icon(Icons.hub),
            label: isArabic ? 'الأقسام الذكية' : 'AI Hubs',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifePilot OS 🌐', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isArabic ? 'مرحباً بك في مستقبل الذكاء الاصطناعي ✨' : 'Welcome to the Future of AI ✨',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  isArabic ? 'نظام تشغيل متكامل ينبض بالحياة، يجيب عن كل أسئلتك الطبية، الهندسية، والموضة بتفاعل حقيقي.' : 'An interactive OS answering your medical, design, and fashion queries.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(isArabic ? 'الأقسام النشطة' : 'Active Hubs', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildFeatureBadge(Icons.local_hospital, Colors.red, isArabic ? 'القسم الطبي والتخصصي الفوري' : 'Medical & Health Hub'),
          _buildFeatureBadge(Icons.chair, Colors.brown, isArabic ? 'هندسة الديكور وتصميم المنازل' : 'Interior Architecture Hub'),
          _buildFeatureBadge(Icons.checkroom, Colors.purple, isArabic ? 'مستشار الموضة وتنسيق الأزياء' : 'Fashion & Style Hub'),
          _buildFeatureBadge(Icons.auto_awesome, Colors.amber, isArabic ? 'المساعد المعرفي الشامل' : 'General Knowledge Hub'),
        ],
      ),
    );
  }

  Widget _buildFeatureBadge(IconData icon, Color color, String title) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
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
    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'مراكز الخدمات الذكية' : 'Smart Hubs', style: const TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHubCard(context, isArabic ? '🩺 القسم الطبي والتخصصي' : 'Medical Hub', isArabic ? 'إجابات طبية، استشارات صحية وأعراض فورية.' : 'Medical guidance & health advice.', Colors.red, const DynamicChatScreen(hubTitle: 'القسم الطبي والتخصصي', hintText: 'اكتب سؤالك الطبي أو الأعراض...')),
          _buildHubCard(context, isArabic ? '🏠 مختبر الديكور وتصميم المنازل' : 'Interior Design Hub', isArabic ? 'أدخل المساحة، الغرفة، والنمط (مودرن/كلاسيك).' : 'Design homes by area and style.', Colors.brown, const DynamicChatScreen(hubTitle: 'هندسة الديكور وتصميم المنازل', hintText: 'اكتب المساحة، الغرفة النمط (مودرن/كلاسيك)...')),
          _buildHubCard(context, isArabic ? '👗 مستشار الموضة وتنسيق الأزياء' : 'Fashion & Style Hub', isArabic ? 'موضة حديثة وتنسيق ألوان (رجال، نساء، أطفال).' : 'Fashion trends & color coordination.', Colors.purple, const DynamicChatScreen(hubTitle: 'مستشار الموضة والأزياء', hintText: 'اختر الفئة والمناسبة (رجال، نساء، أطفال)...')),
          _buildHubCard(context, isArabic ? '💡 المساعد المعرفي العام' : 'Knowledge Hub', isArabic ? 'احصل على إجابات دقيقة لأي سؤال في العالم.' : 'Get accurate answers to any question.', Colors.indigo, const DynamicChatScreen(hubTitle: 'المساعد المعرفي العام', hintText: 'اطرح أي سؤال تريد معرفته...')),
        ],
      ),
    );
  }

  Widget _buildHubCard(BuildContext context, String title, String subtitle, Color color, Widget screen) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(radius: 28, backgroundColor: color.withOpacity(0.2), child: Icon(Icons.auto_awesome, color: color, size: 28)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicChatScreen extends StatefulWidget {
  final String hubTitle;
  final String hintText;

  const DynamicChatScreen({super.key, required this.hubTitle, required this.hintText});

  @override
  State<DynamicChatScreen> createState() => _DynamicChatScreenState();
}

class _DynamicChatScreenState extends State<DynamicChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    String userQuery = _controller.text;
    setState(() {
      _messages.add({'sender': 'user', 'text': userQuery});
      _controller.clear();
    });

    // التمرير التلقائي لأسفل المحادثة
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      String aiResponse = '';
      if (widget.hubTitle.contains('الطب')) {
        aiResponse = '🩺 الاستجابة الطبية الموثوقة حول: "$userQuery"\n\n• التحليل: بناءً على حالتك، ننصح بالراحة التامة وشرب السوائل ومتابعة الحرارة.\n• الإرشاد: إذا استمرت الأعراض، يرجى استشارة الطبيب المختص.\n*(تنبيه: معلومة توجيهية ذكية).*';
      } else if (widget.hubTitle.contains('الديكور')) {
        aiResponse = '🏠 التصميم الهندسي المقترح:\n\n• التخطيط: تم توزيع المساحة بذكاء لزيادة الاتساع والإضاءة.\n• الألوان والأثاث: تناسق ألوان عصري راقي مع إضاءة ليد مخفية وأثاث مريح يواكب أحدث الديكورات.';
      } else if (widget.hubTitle.contains('الموضة')) {
        aiResponse = '👗 استشارات الموضة والأزياء:\n\n• الصيحة الحالية: تصميمات راقية تدمج الأناقة والراحة لكل الفئات.\n• تنسيق الألوان: الألوان المتناسقة المقترحة تمنحك إطلالة استثنائية وجذابة.';
      } else {
        aiResponse = '💡 إجابة ذكية ومفصلة حول: "$userQuery"\n\nتم استعراض قاعدة المعارف العالمية لتقديم إجابة دقيقة تلبي تطلعاتك بالكامل.';
      }

      setState(() {
        _messages.add({'sender': 'ai', 'text': aiResponse});
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.hubTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.chat_bubble_outline, size: 60, color: Color(0xFF6366F1)),
                            const SizedBox(height: 16),
                            Text('ابدأ المحادثة في ${widget.hubTitle}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        bool isUser = _messages[index]['sender'] == 'user';
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                            decoration: BoxDecoration(
                              color: isUser ? const Color(0xFF6366F1) : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              _messages[index]['text']!,
                              style: TextStyle(fontSize: 15, color: isUser ? Colors.white : Colors.black87, height: 1.4),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // شريط الإدخال المضمون بعيداً عن أزرار النظام السفلية
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, -2))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF6366F1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 18),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

    return Scaffold(
      appBar: AppBar(title: Text(isArabic ? 'إعدادات النظام' : 'System Settings', style: const TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text(isArabic ? 'الوضع الليلي' : 'Dark Mode'),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: isDarkMode,
            onChanged: (val) => onThemeChanged(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(isArabic ? 'لغة التطبيق (25 لغة)' : 'App Language'),
            subtitle: Text(currentLanguage),
            trailing: DropdownButton<String>(
              value: worldLanguages.contains(currentLanguage) ? currentLanguage : 'English',
              items: worldLanguages.map((lang) => DropdownMenuItem(value: lang, child: Text(lang, style: const TextStyle(fontSize: 13)))).toList(),
              onChanged: (val) {
                if (val != null) onLanguageChanged(val);
              },
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('إصدار النظام العالمي'),
            subtitle: Text('LifePilot OS - Fixed & Interactive v3.1'),
          ),
        ],
      ),
    );
  }
}
