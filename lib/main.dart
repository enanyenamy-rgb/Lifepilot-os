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
          isArabic ? 'LifePilot OS - النظام الذكي الشامل' : 'LifePilot OS - Ultimate Smart OS',
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
            isArabic ? 'منصتك الشاملة: إجابات، طب، ديكور هندسي، وموضة عالمية جاهزة.' : 'Your ultimate platform: Answers, Medical, Interior Design, & Fashion.',
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
                  Text(isArabic ? 'حالة الأقسام الذكية' : 'Smart Hubs Status', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'قسم الديكور الهندسي:' : 'Interior Design Hub:'),
                      const Text('Active 🏠', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isArabic ? 'قسم الموضة والأزياء:' : 'Fashion & Style Hub:'),
                      const Text('Updated 👗', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
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
          isArabic ? 'أدوات الذكاء الاصطناعي الشاملة' : 'Comprehensive AI Tools',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        // 1. الديكور والتصميم الداخلي
        _buildToolCard(
          context,
          title: isArabic ? 'مختبر الديكور وتصميم المنازل 🏠' : 'Interior Design & Home Decor Hub',
          description: isArabic ? 'صمم منزلك حسب المساحة، الألوان، والأثاث (مودرن/كلاسيك).' : 'Design your home based on area, colors & furniture.',
          icon: Icons.chair,
          color: Colors.brown,
          destinationScreen: const InteriorDesignScreen(),
        ),
        // 2. الموضة والأزياء وتنسيق الألوان
        _buildToolCard(
          context,
          title: isArabic ? 'مستشار الموضة وتنسيق الملابس 👗' : 'Fashion & Style Advisor',
          description: isArabic ? 'أحدث صيحات الموضة وتنسيق الألوان لكل الفئات (رجال، نساء، أطفال).' : 'Latest fashion trends & color coordination for all.',
          icon: Icons.checkroom,
          color: Colors.purple,
          destinationScreen: const FashionHubScreen(),
        ),
        // 3. القسم الطبي والتخصصي
        _buildToolCard(
          context,
          title: isArabic ? 'القسم الطبي والصحي التخصصي 🩺' : 'Specialized Medical Hub',
          description: isArabic ? 'إجابات طبية دقيقة واستشارات صحية على مدار الساعة.' : 'Accurate medical answers & health guidance.',
          icon: Icons.local_hospital,
          color: Colors.red,
          destinationScreen: const MedicalHubScreen(),
        ),
        // 4. المساعد المعرفي للإجابات
        _buildToolCard(
          context,
          title: isArabic ? 'المساعد المعرفي للإجابات والمعلومات' : 'Knowledge Assistant',
          description: isArabic ? 'احصل على إجابات دقيقة لأي سؤال في أي مجال.' : 'Get answers to any question.',
          icon: Icons.question_answer,
          color: Colors.deepPurple,
          destinationScreen: const GeneralAnswersScreen(),
        ),
        // 5. توليد الصور والفيديوهات
        _buildToolCard(
          context,
          title: isArabic ? 'مختبر توليد الصور والفيديوهات' : 'AI Image & Video Generator',
          description: isArabic ? 'حول أفكارك إلى صور وفيديوهات إبداعية.' : 'Transform ideas into images & videos.',
          icon: Icons.movie_creation,
          color: Colors.pink,
          destinationScreen: const MediaGeneratorScreen(),
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

// 1. قسم الديكور وتصميم المنازل
class InteriorDesignScreen extends StatefulWidget {
  const InteriorDesignScreen({super.key});

  @override
  State<InteriorDesignScreen> createState() => _InteriorDesignScreenState();
}

class _InteriorDesignScreenState extends State<InteriorDesignScreen> {
  final TextEditingController _areaController = TextEditingController();
  String _selectedStyle = 'مودرن (Modern)';
  String _selectedRoom = 'غرفة المعيشة';
  String _designResult = 'أدخل مساحة الغرفة ونمط التصميم ليقوم البرنامج بتخطيط الديكور واختيار الأثاث وتناسق الألوان.';

  final List<String> _styles = ['مودرن (Modern)', 'كلاسيك (Classic)', 'حديث / مينيمال (Minimalist)', 'نيوكلاسيك (Neoclassic)'];
  final List<String> _rooms = ['غرفة المعيشة', 'غرفة النوم الرئيسية', 'المطبخ', 'الصالون والاستقبال'];

  void _generateDesign() {
    if (_areaController.text.isNotEmpty) {
      setState(() {
        _designResult = '🏠 تصميم مقترح لـ "${_roomSelectLabel()}" بمساحة ${_areaController.text} متر مربع:\n\n'
            '• النمط المختار: $_selectedStyle\n'
            '• تنسيق الألوان المقترح: درجات البيض والرمادي الفاتح مع لمسات من الألوان الخشبية الدافئة والذهبي.\n'
            '• توزيع الأثاث: تم تصميم توزيع ذكي للاستفادة القصوى من المساحة مع إضاءة ليد مخفية وأثاث عصري مريح.\n'
            '✨ (تم توليد التصميم الهندسي بنجاح عبر النظام الذكي).';
      });
    }
  }

  String _roomSelectLabel() => _selectedRoom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مختبر الديكور وتصميم المنازل'), backgroundColor: Colors.brown),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('اختر الفراغ أو الغرفة:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedRoom,
              isExpanded: true,
              items: _rooms.map((room) => DropdownMenuItem(value: room, child: Text(room))).toList(),
              onChanged: (val) => setState(() => _selectedRoom = val!),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _areaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'مساحة الغرفة أو المنزل (بالمتر المربع - مثال: 25)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten),
              ),
            ),
            const SizedBox(height: 10),
            const Text('اختر نمط الديكور:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedStyle,
              isExpanded: true,
              items: _styles.map((style) => DropdownMenuItem(value: style, child: Text(style))).toList(),
              onChanged: (val) => setState(() => _selectedStyle = val!),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _generateDesign,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown, foregroundColor: Colors.white),
              icon: const Icon(Icons.design_services),
              label: const Text('إنشاء وتصميم الديكور والأثاث'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.brown.shade200),
              ),
              child: Text(_designResult, style: const TextStyle(fontSize: 15, height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. قسم الموضة والأزياء
class FashionHubScreen extends StatefulWidget {
  const FashionHubScreen({super.key});

  @override
  State<FashionHubScreen> createState() => _FashionHubScreenState();
}

class _FashionHubScreenState extends State<FashionHubScreen> {
  String _selectedCategory = 'رجال (Men)';
  final TextEditingController _fashionQuery = TextEditingController();
  String _fashionAdvice = 'اختر الفئة واكتب المناسبة أو طلب تنسيق الألوان لعرض أحدث صيحات الموضة.';

  final List<String> _categories = ['رجال (Men)', 'نساء (Women)', 'أطفال (Kids)'];

  void _getFashionAdvice() {
    setState(() {
      _fashionAdvice = '👗 أحدث صيحات الموضة وتنسيق الألوان لفئة [$_selectedCategory]:\n\n'
          '• الألوان الرائجة هذا الموسم: درجات الترابي الهادئ، الكحلي الملكي، والأخضر الميثالي.\n'
          '• تنسيق الملابس: يُنصح بدمج القطع الكلاسيكية مع لمسات عصرية كاجوال لإطلالة أنيقة ومتوازنة.\n'
          '• بناءً على طلبك: "${_fashionQuery.text.isEmpty ? "إطلالة عامة أنيقة" : _fashionQuery.text}"، نقترح الألوان المتناسقة والإكسسوارات المناسبة لهذه الإطلالة.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مستشار الموضة وتنسيق الملابس'), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('اختر الفئة المستهدفة:', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _fashionQuery,
              decoration: const InputDecoration(
                labelText: 'اكتب المناسبة أو الألوان التي تفضلها (مثال: حفل زفاف، كاجوال، خروجة صيفية)...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.checkroom),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _getFashionAdvice,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
              icon: const Icon(Icons.star),
              label: const Text('اعرض موضة وتنسيق الألوان'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Text(_fashionAdvice, style: const TextStyle(fontSize: 15, height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. القسم الطبي التخصصي
class MedicalHubScreen extends StatefulWidget {
  const MedicalHubScreen({super.key});

  @override
  State<MedicalHubScreen> createState() => _MedicalHubScreenState();
}

class _MedicalHubScreenState extends State<MedicalHubScreen> {
  final TextEditingController _medicalController = TextEditingController();
  String _medicalResponse = 'مرحباً بك في القسم الطبي التخصصي. اطرح أي سؤال طبي وسيقوم النظام بالإجابة الموثوقة.';

  void _consultMedicalAI() {
    if (_medicalController.text.isNotEmpty) {
      setState(() {
        _medicalResponse = '🩺 الاستشارة الطبية حول: "${_medicalController.text}"\n\nالتحليل الأولي: الإرشادات الطبية العامة تنصح بالراحة والمتابعة مع الطبيب المختص.\n\n*(تنبيه: هذا المساعد يوفر معلومات توجيهية فقط).*';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القسم الطبي والتخصصي'), backgroundColor: Colors.red),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _medicalController,
              decoration: const InputDecoration(
                labelText: 'اكتب سؤالك الطبي أو الأعراض...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.medical_services, color: Colors.red),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _consultMedicalAI,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              icon: const Icon(Icons.local_hospital),
              label: const Text('احصل على الإجابة الطبية'),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(child: Text(_medicalResponse, style: const TextStyle(fontSize: 16, height: 1.4))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. المساعد المعرفي للإجابات
class GeneralAnswersScreen extends StatefulWidget {
  const GeneralAnswersScreen({super.key});

  @override
  State<GeneralAnswersScreen> createState() => _GeneralAnswersScreenState();
}

class _GeneralAnswersScreenState extends State<GeneralAnswersScreen> {
  final TextEditingController _queryController = TextEditingController();
  String _answer = 'اطرح أي سؤال وسيقوم المساعد الذكي بالإجابة عليك...';

  void _getAnswer() {
    if (_queryController.text.isNotEmpty) {
      setState(() {
        _answer = 'إجابة ذكية حول: "${_queryController.text}"\n\nتحليل شامل وتفاصيل دقيقة لتلبية احتياجك المعرفي.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعد المعرفي للإجابات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _queryController,
              decoration: const InputDecoration(labelText: 'ما الذي تريد معرفته؟', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _getAnswer, child: const Text('احصل على الإجابة')),
            const SizedBox(height: 15),
            Expanded(child: Container(padding: const EdgeInsets.all(16), child: Text(_answer, style: const TextStyle(fontSize: 16)))),
          ],
        ),
      ),
    );
  }
}

// 5. توليد الصور والفيديوهات
class MediaGeneratorScreen extends StatefulWidget {
  const MediaGeneratorScreen({super.key});

  @override
  State<MediaGeneratorScreen> createState() => _MediaGeneratorScreenState();
}

class _MediaGeneratorScreenState extends State<MediaGeneratorScreen> {
  final TextEditingController _promptController = TextEditingController();
  String _status = 'صف فكرتك لتوليد الصورة أو الفيديو.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('توليد الصور والفيديوهات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _promptController, decoration: const InputDecoration(labelText: 'اكتب وصف الفكرة...', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () => setState(() => _status = 'تم توليد المحتوى بنجاح!'), child: const Text('توليد المحتوى المرئي')),
            const SizedBox(height: 20),
            Text(_status, style: const TextStyle(fontWeight: FontWeight.bold)),
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

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(isArabic ? 'إعدادات النظام' : 'System Settings', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        SwitchListTile(
          title: Text(isArabic ? 'الوضع الليلي' : 'Dark Mode'),
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
            items: worldLanguages.map((lang) => DropdownMenuItem(value: lang, child: Text(lang, style: const TextStyle(fontSize: 14)))).toList(),
            onChanged: (val) {
              if (val != null) onLanguageChanged(val);
            },
          ),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('حول النظام'),
          subtitle: Text('LifePilot OS - Ultimate Edition v2.0'),
        ),
      ],
    );
  }
}
