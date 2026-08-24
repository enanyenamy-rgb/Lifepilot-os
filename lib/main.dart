import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'iOS & Android جاهز للعمل على',
    'bannerText': 'LifePilot OS يعمل بكفاءة على جميع الأجهزة (العربية)',
    'activeEngines': 'محركات الذكاء الاصطناعي النشطة',
    'taskAutomation': 'أتمتة المهام',
    'contentStudio': 'استوديو المحتوى',
    'documentCruncher': 'معالج المستندات',
    'codeAssistant': 'مساعد البرمجة',
    'languageTitle': 'اختر لغة التطبيق',
    'engineDetails': 'جاري فتح محرك الذكاء الاصطناعي...',
    'close': 'إغلاق',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'iOS & Android Ready',
    'bannerText': 'LifePilot OS works efficiently on all devices',
    'activeEngines': 'Active AI Engines',
    'taskAutomation': 'Task Automation',
    'contentStudio': 'Content Studio',
    'documentCruncher': 'Document Cruncher',
    'codeAssistant': 'Code Assistant',
    'languageTitle': 'Select App Language',
    'engineDetails': 'Opening AI Engine...',
    'close': 'Close',
  },
  'es': {
    'welcome': 'Bienvenido, Comandante',
    'deviceSupport': 'Listo para iOS y Android',
    'bannerText': 'LifePilot OS funciona eficientemente en todos los dispositivos',
    'activeEngines': 'Motores de IA Activos',
    'taskAutomation': 'Automatización de Tareas',
    'contentStudio': 'Estudio de Contenido',
    'documentCruncher': 'Procesador de Documentos',
    'codeAssistant': 'Asistente de Código',
    'languageTitle': 'Seleccionar Idioma',
    'engineDetails': 'Abriendo motor de IA...',
    'close': 'Cerrar',
  },
  'fr': {
    'welcome': 'Bienvenue, Commandant',
    'deviceSupport': 'Prêt pour iOS et Android',
    'bannerText': 'LifePilot OS fonctionne efficacement sur tous les appareils',
    'activeEngines': 'Moteurs IA Actifs',
    'taskAutomation': 'Automatisation des Tâches',
    'contentStudio': 'Studio de Contenu',
    'documentCruncher': 'Processeur de Documents',
    'codeAssistant': 'Assistant Code',
    'languageTitle': 'Choisir la Langue',
    'engineDetails': 'Ouverture du moteur IA...',
    'close': 'Fermer',
  },
  'de': {
    'welcome': 'Willkommen, Commander',
    'deviceSupport': 'Bereit für iOS & Android',
    'bannerText': 'LifePilot OS läuft effizient auf allen Geräten',
    'activeEngines': 'Aktive KI-Motoren',
    'taskAutomation': 'Aufgabenautomatisierung',
    'contentStudio': 'Inhaltsstudio',
    'documentCruncher': 'Dokumenten-Cruncher',
    'codeAssistant': 'Code-Assistent',
    'languageTitle': 'Sprache Auswählen',
    'engineDetails': 'KI-Motor wird geöffnet...',
    'close': 'Schließen',
  },
  'zh': {
    'welcome': '欢迎，指挥官',
    'deviceSupport': '支持 iOS 和 Android',
    'bannerText': 'LifePilot OS 在所有设备上高效运行',
    'activeEngines': '活跃的AI引擎',
    'taskAutomation': '任务自动化',
    'contentStudio': '内容工作室',
    'documentCruncher': '文档处理',
    'codeAssistant': '代码助手',
    'languageTitle': '选择语言',
    'engineDetails': '正在打开AI引擎...',
    'close': '关闭',
  },
  'ja': {
    'welcome': 'ようこそ、司令官',
    'deviceSupport': 'iOS & Android 対応',
    'bannerText': 'LifePilot OS はすべてのデバイスで効率的に動作します',
    'activeEngines': 'アクティブAIエンジン',
    'taskAutomation': 'タスク自動化',
    'contentStudio': 'コンテンツスタジオ',
    'documentCruncher': 'ドキュメント処理',
    'codeAssistant': 'コードアシスタント',
    'languageTitle': '言語を選択',
    'engineDetails': 'AIエンジンを開いています...',
    'close': '閉じる',
  },
  'ko': {
    'welcome': '환영합니다, 사령관님',
    'deviceSupport': 'iOS 및 Android 지원',
    'bannerText': 'LifePilot OS는 모든 기기에서 효율적으로 작동합니다',
    'activeEngines': '활성 AI 엔진',
    'taskAutomation': '작업 자동화',
    'contentStudio': '콘텐츠 스튜디오',
    'documentCruncher': '문서 처리기',
    'codeAssistant': '코드 어시스턴트',
    'languageTitle': '언어 선택',
    'engineDetails': 'AI 엔진 여는 중...',
    'close': '닫기',
  },
  'ru': {
    'welcome': 'Добро пожаловать, Командир',
    'deviceSupport': 'Готов для iOS и Android',
    'bannerText': 'LifePilot OS эффективно работает на всех устройствах',
    'activeEngines': 'Активные ИИ-модули',
    'taskAutomation': 'Автоматизация задач',
    'contentStudio': 'Студия контента',
    'documentCruncher': 'Обработка документов',
    'codeAssistant': 'Помощник по коду',
    'languageTitle': 'Выберите язык',
    'engineDetails': 'Открытие ИИ-модуля...',
    'close': 'Закрыть',
  },
  'pt': {
    'welcome': 'Bem-vindo, Comandante',
    'deviceSupport': 'Pronto para iOS e Android',
    'bannerText': 'LifePilot OS funciona eficientemente em todos os dispositivos',
    'activeEngines': 'Motores de IA Ativos',
    'taskAutomation': 'Automação de Tarefas',
    'contentStudio': 'Estúdio de Conteúdo',
    'documentCruncher': 'Processador de Documentos',
    'codeAssistant': 'Assistente de Código',
    'languageTitle': 'Selecionar Idioma',
    'engineDetails': 'Abrindo motor de IA...',
    'close': 'Fechar',
  },
  'it': {
    'welcome': 'Benvenuto, Comandante',
    'deviceSupport': 'Pronto per iOS e Android',
    'bannerText': 'LifePilot OS funziona in modo efficiente su tutti i dispositivi',
    'activeEngines': 'Motori IA Attivi',
    'taskAutomation': 'Automazione Attività',
    'contentStudio': 'Studio di Contenuti',
    'documentCruncher': 'Gestione Documenti',
    'codeAssistant': 'Assistente Codice',
    'languageTitle': 'Seleziona Lingua',
    'engineDetails': 'Apertura motore IA...',
    'close': 'Chiudi',
  },
  'tr': {
    'welcome': 'Hoş Geldiniz, Komutanım',
    'deviceSupport': 'iOS ve Android Hazır',
    'bannerText': 'LifePilot OS tüm cihazlarda verimli çalışır',
    'activeEngines': 'Aktif Yapay Zeka Motorları',
    'taskAutomation': 'Görev Otomasyonu',
    'contentStudio': 'İçerik Stüdyosu',
    'documentCruncher': 'Belge İşleyici',
    'codeAssistant': 'Kod Asistanı',
    'languageTitle': 'Dil Seçin',
    'engineDetails': 'Yapay Zeka Motoru açılıyor...',
    'close': 'Kapat',
  },
  'hi': {
    'welcome': 'स्वागत है, कमांडर',
    'deviceSupport': 'iOS और Android के लिए तैयार',
    'bannerText': 'LifePilot OS सभी उपकरणों पर कुशलता से काम करता है',
    'activeEngines': 'सक्रिय एआई इंजन',
    'taskAutomation': 'कार्य स्वचालन',
    'contentStudio': 'सामग्री स्टूडियो',
    'documentCruncher': 'दस्तावेज़ कंचर',
    'codeAssistant': 'कोड सहायक',
    'languageTitle': 'भाषा चुनें',
    'engineDetails': 'एआई इंजन खुल रहा है...',
    'close': 'बंद करें',
  },
  'id': {
    'welcome': 'Selamat Datang, Komandan',
    'deviceSupport': 'Siap untuk iOS & Android',
    'bannerText': 'LifePilot OS bekerja secara efisien di semua perangkat',
    'activeEngines': 'Mesin AI Aktif',
    'taskAutomation': 'Otomatisasi Tugas',
    'contentStudio': 'Studio Konten',
    'documentCruncher': 'Pengolah Dokumen',
    'codeAssistant': 'Asisten Kode',
    'languageTitle': 'Pilih Bahasa',
    'engineDetails': 'Membuka Mesin AI...',
    'close': 'Tutup',
  },
  'vi': {
    'welcome': 'Chào mừng, Chỉ huy',
    'deviceSupport': 'Sẵn sàng cho iOS & Android',
    'bannerText': 'LifePilot OS hoạt động hiệu quả trên mọi thiết bị',
    'activeEngines': 'Công cụ AI hoạt động',
    'taskAutomation': 'Tự động hóa tác vụ',
    'contentStudio': 'Studio nội dung',
    'documentCruncher': 'Xử lý tài liệu',
    'codeAssistant': 'Trợ lý mã',
    'languageTitle': 'Chọn ngôn ngữ',
    'engineDetails': 'Đang mở công cụ AI...',
    'close': 'Đóng',
  },
  'pl': {
    'welcome': 'Witaj, Dowódco',
    'deviceSupport': 'Gotowy na iOS i Android',
    'bannerText': 'LifePilot OS działa wydajnie na wszystkich urządzeniach',
    'activeEngines': 'Aktywne Silniki AI',
    'taskAutomation': 'Automatyzacja Zadań',
    'contentStudio': 'Studio Treści',
    'documentCruncher': 'Przetwarzanie Dokumentów',
    'codeAssistant': 'Asystent Kodu',
    'languageTitle': 'Wybierz Język',
    'engineDetails': 'Otwieranie silnika AI...',
    'close': 'Zamknij',
  },
  'nl': {
    'welcome': 'Welkom, Commandanten',
    'deviceSupport': 'Klaar voor iOS & Android',
    'bannerText': 'LifePilot OS werkt efficiënt op alle apparaten',
    'activeEngines': 'Actieve AI-engines',
    'taskAutomation': 'Taakautomatisering',
    'contentStudio': 'Inhoudsstudio',
    'documentCruncher': 'Documentverwerker',
    'codeAssistant': 'Code Assistent',
    'languageTitle': 'Selecteer Taal',
    'engineDetails': 'AI-engine wordt geopend...',
    'close': 'Sluiten',
  },
  'uk': {
    'welcome': 'Ласкаво просимо, Командире',
    'deviceSupport': 'Готово для iOS та Android',
    'bannerText': 'LifePilot OS ефективно працює на всіх пристроях',
    'activeEngines': 'Активні штучні інтелекти',
    'taskAutomation': 'Автоматизація завдань',
    'contentStudio': 'Студія контенту',
    'documentCruncher': 'Обробка документів',
    'codeAssistant': 'Помічник коду',
    'languageTitle': 'Виберіть мову',
    'engineDetails': 'Відкриття AI моделі...',
    'close': 'Закрити',
  },
  'sv': {
    'welcome': 'Välkommen, Befälhavare',
    'deviceSupport': 'Klar för iOS & Android',
    'bannerText': 'LifePilot OS fungerar effektivt på alla enheter',
    'activeEngines': 'Aktiva AI-motorer',
    'taskAutomation': 'Uppgiftsautomatisering',
    'contentStudio': 'Innehållsstudio',
    'documentCruncher': 'Dokumenthanterare',
    'codeAssistant': 'Kodassistent',
    'languageTitle': 'Välj Språk',
    'engineDetails': 'Öppnar AI-motor...',
    'close': 'Stäng',
  },
  'el': {
    'welcome': 'Καλώς ήρθατε, Διοικητή',
    'deviceSupport': 'Έτοιμο για iOS & Android',
    'bannerText': 'Το LifePilot OS λειτουργεί αποτελεσματικά σε όλες τις συσκευές',
    'activeEngines': 'Ενεργές Μηχανές ΤН',
    'taskAutomation': 'Αυτοματοποίηση Εργασιών',
    'contentStudio': 'Σтуδio Περιεχομένου',
    'documentCruncher': 'Επεξεργασία Εγγράφων',
    'codeAssistant': 'Βοηθός Κώδικα',
    'languageTitle': 'Επιλογή Γλώσσας',
    'engineDetails': 'Άνοιγμα μηχανής AI...',
    'close': 'Κλείσιμο',
  },
  'he': {
    'welcome': 'ברוך הבא, המפקד',
    'deviceSupport': 'מוכן ל-iOS ו-Android',
    'bannerText': 'LifePilot OS פועל ביעילות בכל המכשירים',
    'activeEngines': 'מנועי בינה מלאכותית פעילים',
    'taskAutomation': 'אוטומציה של משימות',
    'contentStudio': 'סטודיו תוכן',
    'documentCruncher': 'מעבד מסמכים',
    'codeAssistant': 'עוזר קוד',
    'languageTitle': 'בחר שפה',
    'engineDetails': 'פותח מנוע בינה מלאכותית...',
    'close': 'סגור',
  },
  'ro': {
    'welcome': 'Bun venit, Comandant',
    'deviceSupport': 'Pregătit pentru iOS și Android',
    'bannerText': 'LifePilot OS rulează eficient pe toate dispozitivele',
    'activeEngines': 'Motoare AI Active',
    'taskAutomation': 'Automatizare Sarcini',
    'contentStudio': 'Studio Conținut',
    'documentCruncher': 'Procesor Documente',
    'codeAssistant': 'Asistent Cod',
    'languageTitle': 'Selectați Limba',
    'engineDetails': 'Se deschide motorul AI...',
    'close': 'Închide',
  },
  'hu': {
    'welcome': 'Üdvözöljük, Parancsnok',
    'deviceSupport': 'Kész az iOS és Android rendszerekhez',
    'bannerText': 'A LifePilot OS hatékonyan fut minden eszközön',
    'activeEngines': 'Aktív AI Motorok',
    'taskAutomation': 'Feladatautomatizálás',
    'contentStudio': 'Tartalom Stúdió',
    'documentCruncher': 'Dokumentumkezelő',
    'codeAssistant': 'Kód Asszisztens',
    'languageTitle': 'Nyelv Kiválasztása',
    'engineDetails': 'AI motor megnyitása...',
    'close': 'Bezárás',
  },
  'cs': {
    'welcome': 'Vítejte, Veliteli',
    'deviceSupport': 'Připraveno pro iOS a Android',
    'bannerText': 'LifePilot OS funguje efektivně na všech zařízeních',
    'activeEngines': 'Aktivní AI Motory',
    'taskAutomation': 'Automatizace Úkolů',
    'contentStudio': 'Obsahové Studio',
    'documentCruncher': 'Zpracování Dokumentů',
    'codeAssistant': 'Asistent Kódu',
    'languageTitle': 'Vybrat Jazyk',
    'engineDetails': 'Otevírání AI motoru...',
    'close': 'Zavřít',
  },
  'th': {
    'welcome': 'ยินดีต้อนรับ ท่านผู้บัญชาการ',
    'deviceSupport': 'พร้อมใช้งานบน iOS และ Android',
    'bannerText': 'LifePilot OS ทำงานได้อย่างมีประสิทธิภาพบนทุกอุปกรณ์',
    'activeEngines': 'เครื่องมือ AI ที่ใช้งานอยู่',
    'taskAutomation': 'การทำงานอัตโนมัติ',
    'contentStudio': 'สตูดิโอเนื้อหา',
    'documentCruncher': 'เครื่องมือจัดการเอกสาร',
    'codeAssistant': 'ผู้ช่วยเขียนโค้ด',
    'languageTitle': 'เลือกภาษา',
    'engineDetails': 'กำลังเปิดเครื่องมือ AI...',
    'close': 'ปิด',
  },
};

class LifePilotApp extends StatefulWidget {
  const LifePilotApp({Key? key}) : super(key: key);

  @override
  State<LifePilotApp> createState() => _LifePilotAppState();
}

class _LifePilotAppState extends State<LifePilotApp> {
  Locale _currentLocale = const Locale('ar');

  void _changeLanguage(String languageCode) {
    setState(() {
      _currentLocale = Locale(languageCode);
    });
  }

  String translate(String key) {
    return localizedValues[_currentLocale.languageCode]?[key] ??
        localizedValues['en']?[key] ??
        key;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifePilot OS',
      debugShowCheckedModeBanner: false,
      locale: _currentLocale,
      supportedLocales: localizedValues.keys.map((code) => Locale(code)).toList(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1016),
        primaryColor: const Color(0xFF6C63FF),
      ),
      home: HomeScreen(
        onLanguageChanged: _changeLanguage,
        currentLocale: _currentLocale.languageCode,
        translate: translate,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function(String) onLanguageChanged;
  final String currentLocale;
  final String Function(String) translate;

  const HomeScreen({
    Key? key,
    required this.onLanguageChanged,
    required this.currentLocale,
    required this.translate,
  }) : super(key: key);

  void _showLanguageSelector(BuildContext context) {
    final languages = {
      'ar': 'العربية (Arabic)',
      'en': 'English',
      'es': 'Español',
      'fr': 'Français',
      'de': 'Deutsch',
      'zh': '中文 (Chinese)',
      'ja': '日本語 (Japanese)',
      'ko': '한국어 (Korean)',
      'ru': 'Русский (Russian)',
      'pt': 'Português',
      'it': 'Italiano',
      'tr': 'Türkçe',
      'hi': 'हिन्दी (Hindi)',
      'id': 'Indonesian',
      'vi': 'Tiếng Việt',
      'pl': 'Polski',
      'nl': 'Nederlands',
      'uk': 'Українська',
      'sv': 'Svenska',
      'el': 'Ελληνικά',
      'he': 'עברית (Hebrew)',
      'ro': 'Română',
      'hu': 'Magyar',
      'cs': 'Čeština',
      'th': 'ไทย (Thai)',
    };

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1C24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate('languageTitle'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    String code = languages.keys.elementAt(index);
                    String name = languages.values.elementAt(index);
                    return ListTile(
                      title: Text(name, style: const TextStyle(color: Colors.white)),
                      trailing: currentLocale == code
                          ? const Icon(Icons.check, color: Color(0xFF6C63FF))
                          : null,
                      onTap: () {
                        onLanguageChanged(code);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openEngineDetails(BuildContext context, String engineName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1C24),
          title: Text(engineName, style: const TextStyle(color: Colors.white)),
          content: Text(
            translate('engineDetails'),
            style: const TextStyle(color: Colors.grey),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(translate('close'), style: const TextStyle(color: Color(0xFF6C63FF))),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () => _showLanguageSelector(context),
            tooltip: 'Select Language',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.logout, color: Colors.redAccent, size: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate('welcome'),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      translate('deviceSupport'),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8A2387), Color(0xFFE94057), Color(0xFFF27121)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                translate('bannerText'),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              translate('activeEngines'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildEngineCard(
                    context: context,
                    icon: Icons.check_circle_outline,
                    iconColor: Colors.blueAccent,
                    title: translate('taskAutomation'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.edit_note,
                    iconColor: Colors.pinkAccent,
                    title: translate('contentStudio'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.document_scanner,
                    iconColor: Colors.amber,
                    title: translate('documentCruncher'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.code,
                    iconColor: Colors.tealAccent,
                    title: translate('codeAssistant'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEngineCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return InkWell(
      onTap: () => _openEngineDetails(context, title),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C24),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 32),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
