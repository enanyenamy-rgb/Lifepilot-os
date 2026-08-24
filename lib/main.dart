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
                  isArabic ? 'مرحباً بك في عصر التصميم الذكي ✨' : 'Welcome to AI Visual Design ✨',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  isArabic ? 'نظام متكامل يولد لك الأفكار، الردود، والصور والتصميمات الحقيقية فوراً.' : 'An OS generating ideas, answers, and real visual designs instantly.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(isArabic ? 'الأقسام النشطة' : 'Active Hubs', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildFeatureBadge(context, Icons.local_hospital, Colors.red, isArabic ? 'القسم الطبي والتخصصي الفوري' : 'Medical & Health Hub', const DynamicChatScreen(hubTitle: 'القسم الطبي والتخصصي', hintText: 'اسأل عن أي عرض أو استشارة طبية...')),
          _buildFeatureBadge(context, Icons.chair, Colors.brown, isArabic ? 'هندسة الديكور وتصميم المنازل' : 'Interior Architecture Hub', const DynamicChatScreen(hubTitle: 'هندسة الديكور وتصميم المنازل', hintText: 'اكتب المساحة، النمط، أو اطلب تصميم منزل...')),
          _buildFeatureBadge(context, Icons.checkroom, Colors.purple, isArabic ? 'مستشار الموضة وتنسيق الأزياء' : 'Fashion & Style Hub', const DynamicChatScreen(hubTitle: 'مستشار الموضة والأزياء', hintText: 'اطلب تنسيق ألوان أو تصميم ملابس...')),
          _buildFeatureBadge(context, Icons.auto_awesome, Colors.amber, isArabic ? 'المساعد المعرفي الشامل' : 'General Knowledge Hub', const DynamicChatScreen(hubTitle: 'المساعد المعرفي العام', hintText: 'اطرح أي سؤال وسأجيبك وأصمم لك...')),
        ],
      ),
    );
  }

  Widget _buildFeatureBadge(BuildContext context, IconData icon, Color color, String title, Widget screen) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        ),
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
      appBar: AppBar(title: Text(isArabic ? 'مراكز الخدمات الذكية والمرئية' : 'Smart & Visual Hubs', style: const TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHubCard(context, isArabic ? '🩺 القسم الطبي والتخصصي' : 'Medical Hub', isArabic ? 'استشارات وإرشادات صحية موثوقة.' : 'Medical guidance & health advice.', Colors.red, const DynamicChatScreen(hubTitle: 'القسم الطبي والتخصصي', hintText: 'اكتب سؤالك الطبي أو الأعراض...')),
          _buildHubCard(context, isArabic ? '🏠 مختبر الديكور وتصميم المنازل' : 'Interior Design Hub', isArabic ? 'تخيل وتصميم المساحات والأثاث بالصور.' : 'Design homes and generate visual concepts.', Colors.brown, const DynamicChatScreen(hubTitle: 'هندسة الديكور وتصميم المنازل', hintText: 'اكتب المساحة، الغرفة النمط (مودرن/كلاسيك)...')),
          _buildHubCard(context, isArabic ? '👗 مستشار الموضة وتنسيق الأزياء' : 'Fashion & Style Hub', isArabic ? 'موضة حديثة وتصميم أزياء مرئي.' : 'Fashion trends and visual outfit design.', Colors.purple, const DynamicChatScreen(hubTitle: 'مستشار الموضة والأزياء', hintText: 'اختر الفئة والمناسبة (رجال، نساء، أطفال)...')),
          _buildHubCard(context, isArabic ? '💡 المساعد المعرفي العام' : 'Knowledge Hub', isArabic ? 'إجابات ذكية وتصميم صور حسب الطلب.' : 'Smart answers & custom image generation.', Colors.indigo, const DynamicChatScreen(hubTitle: 'المساعد المعرفي العام', hintText: 'اطرح أي سؤال أو اطلب تصميم صورة...')),
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
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    String userQuery = _controller.text;
    setState(() {
      _messages.add({'sender': 'user', 'text': userQuery, 'imageUrl': ''});
      _controller.clear();
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

    // توليد رد مع رابط صورة حقيقية وعالية الجودة حسب القسم
    Future.delayed(const Duration(milliseconds: 800), () {
      String aiResponse = '';
      String imageUrl = '';

      if (widget.hubTitle.contains('الديكور')) {
        aiResponse = '🌟 **التصميم الهندسي والمرئي المقترح لطلبك:**\n\n'
            '• **التخطيط المساحي:** تم هندسة الفراغ بدقة ليتناسب مع طلبك وتوفير حركة سلسة.\n'
            '• **تنسيق الألوان والأثاث:** دمج مودرن راقي مع إضاءة محيطية متطورة.\n'
            '📸 *إليك التصميم الهندسي الحقيقي المقترح لمنزلك:*';
        imageUrl = 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&auto=format&fit=crop&q=80';
      } else if (widget.hubTitle.contains('الطب')) {
        aiResponse = '🩺 **التقرير الطبي الإرشادي والتوضيحي:**\n\n'
            'بخصوص استفسارك ("$userQuery"):\n'
            '• **التحليل:** إرشادات صحية أولية للتعامل مع الحالة بسلامة.\n'
            '• **التوجيه:** الراحة وشرب السوائل ومراجعة الطبيب المختص.\n'
            '📊 *إليك الرسم التوضيحي الطبي للحالة:*';
        imageUrl = 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800&auto=format&fit=crop&q=80';
      } else if (widget.hubTitle.contains('الموضة')) {
        aiResponse = '👗 **استشارات الموضة وتصميم الأزياء:**\n\n'
            'رداً على طلبك ("$userQuery"):\n'
            '• **الإطلالة:** تنسيق ألوان راقي ومتسق يواكب أحدث صيحات الموضة العالمية.\n'
            '🎨 *إليك العرض المرئي الحقيقي للإطلالة المقترحة:*';
        imageUrl = 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800&auto=format&fit=crop&q=80';
      } else {
        aiResponse = '💡 **الإجابة المعرفية والتصميم المرئي:**\n\n'
            'تم تحليل طلبك ("$userQuery") وتوليد الإجابة مع التصميم المرئي المعبر عنه بدقة.';
        imageUrl = 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800&auto=format&fit=crop&q=80';
      }

      setState(() {
        _messages.add({
          'sender': 'ai',
          'text': aiResponse,
          'imageUrl': imageUrl,
        });
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
                            const Icon(Icons.auto_awesome, size: 60, color: Color(0xFF6366F1)),
                            const SizedBox(height: 16),
                            Text('اطرح طلبك في ${widget.hubTitle}\nوسأقوم بالرد وتوليد التصميم الحقيقي فوراً ✨', textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Colors.grey, height: 1.4, fontWeight: FontWeight.w500)),
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
                        String imageUrl = _messages[index]['imageUrl'] ?? '';
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
                            decoration: BoxDecoration(
                              color: isUser ? const Color(0xFF6366F1) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: isUser ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2))],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _messages[index]['text']!,
                                  style: TextStyle(fontSize: 15, color: isUser ? Colors.white : Colors.black87, height: 1.45),
                                ),
                                if (imageUrl.isNotEmpty) ...[
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      imageUrl,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Container(
                                          height: 200,
                                          alignment: Alignment.center,
                                          child: const CircularProgressIndicator(),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          height: 150,
                                          alignment: Alignment.center,
                                          color: Colors.grey.shade300,
                                          child: const Text('تعذر تحميل الصورة المرئية'),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
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
            subtitle: Text('LifePilot OS - Real Visual AI v6.0'),
          ),
        ],
      ),
    );
  }
}
