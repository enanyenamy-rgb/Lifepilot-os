import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const LifePilotApp());
}

final Map<String, Map<String, String>> localizedValues = {
  'ar': {
    'welcome': 'أهلاً بك، أيها القائد',
    'deviceSupport': 'iOS & Android نظام ذكاء اصطناعي متكامل',
    'bannerText': 'LifePilot OS - جاهز لتوليد البرامج، الصور، والفيديوهات',
    'activeEngines': 'محركات الذكاء الاصطناعي النشطة',
    'taskAutomation': 'أتمتة المهام البرمجية',
    'contentStudio': 'استوديو توليد الفيديو',
    'documentCruncher': 'معالج المستندات والتحليل',
    'codeAssistant': 'المساعد الذكي للصور والرسومات',
    'languageTitle': 'اختر لغة التطبيق',
    'promptHint': 'اكتب أمرك هنا (مثلاً: تصميم برنامج مصاريف أو توليد فيديو)...',
    'generateBtn': 'بدء توليد الذكاء الاصطناعي',
    'close': 'إغلاق',
  },
  'en': {
    'welcome': 'Welcome, Commander',
    'deviceSupport': 'iOS & Android AI Operating System',
    'bannerText': 'LifePilot OS - Ready for Code, Image & Video Generation',
    'activeEngines': 'Active AI Engines',
    'taskAutomation': 'Task Automation',
    'contentStudio': 'Video Studio',
    'documentCruncher': 'Document Cruncher',
    'codeAssistant': 'AI Image Assistant',
    'languageTitle': 'Select App Language',
    'promptHint': 'Type your prompt here (e.g., Expense app, Video concept)...',
    'generateBtn': 'Start AI Generation',
    'close': 'Close',
  },
  'es': {
    'welcome': 'Bienvenido, Comandante',
    'deviceSupport': 'Sistema operativo de IA para iOS y Android',
    'bannerText': 'LifePilot OS - Listo para generar código, imágenes y videos',
    'activeEngines': 'Motores de IA Activos',
    'taskAutomation': 'Automatización de Tareas',
    'contentStudio': 'Estudio de Video',
    'documentCruncher': 'Procesador de Documentos',
    'codeAssistant': 'Asistente de Imagen IA',
    'languageTitle': 'Seleccionar Idioma',
    'promptHint': 'Escribe tu comando aquí...',
    'generateBtn': 'Iniciar Generación de IA',
    'close': 'Cerrar',
  },
  'fr': {
    'welcome': 'Bienvenue, Commandant',
    'deviceSupport': 'Système d\'exploitation IA iOS & Android',
    'bannerText': 'LifePilot OS - Prêt pour code, images et vidéos',
    'activeEngines': 'Moteurs IA Actifs',
    'taskAutomation': 'Automatisation des Tâches',
    'contentStudio': 'Studio Vidéo',
    'documentCruncher': 'Processeur de Documents',
    'codeAssistant': 'Assistant Image IA',
    'languageTitle': 'Choisir la Langue',
    'promptHint': 'Tapez votre commande ici...',
    'generateBtn': 'Lancer la génération IA',
    'close': 'Fermer',
  },
  'de': {
    'welcome': 'Willkommen, Commander',
    'deviceSupport': 'iOS & Android KI-Betriebssystem',
    'bannerText': 'LifePilot OS - Bereit für Code-, Bild- und Videogenerierung',
    'activeEngines': 'Aktive KI-Motoren',
    'taskAutomation': 'Aufgabenautomatisierung',
    'contentStudio': 'Video-Studio',
    'documentCruncher': 'Dokumenten-Cruncher',
    'codeAssistant': 'KI-Bildassistent',
    'languageTitle': 'Sprache Auswählen',
    'promptHint': 'Geben Sie Ihren Befehl ein...',
    'generateBtn': 'KI-Generierung starten',
    'close': 'Schließen',
  },
  'zh': {
    'welcome': '欢迎，指挥官',
    'deviceSupport': 'iOS & Android AI操作系统',
    'bannerText': 'LifePilot OS - 准备生成代码、图片和视频',
    'activeEngines': '活跃的AI引擎',
    'taskAutomation': '任务自动化',
    'contentStudio': '视频工作室',
    'documentCruncher': '文档处理',
    'codeAssistant': 'AI图像助手',
    'languageTitle': '选择语言',
    'promptHint': '在此处输入您的指令...',
    'generateBtn': '开始AI生成',
    'close': '关闭',
  },
  'ja': {
    'welcome': 'ようこそ、司令官',
    'deviceSupport': 'iOS & Android AIオペレーティングシステム',
    'bannerText': 'LifePilot OS - コード、画像、動画生成の準備完了',
    'activeEngines': 'アクティブAIエンジン',
    'taskAutomation': 'タスク自動化',
    'contentStudio': 'ビデオスタジオ',
    'documentCruncher': 'ドキュメント処理',
    'codeAssistant': 'AI画像アシスタント',
    'languageTitle': '言語を選択',
    'promptHint': 'プロンプトを入力してください...',
    'generateBtn': 'AI生成を開始',
    'close': '閉じる',
  },
  'ko': {
    'welcome': '환영합니다, 사령관님',
    'deviceSupport': 'iOS 및 Android AI 운영 체제',
    'bannerText': 'LifePilot OS - 코드, 이미지, 비디오 생성 준비 완료',
    'activeEngines': '활성 AI 엔진',
    'taskAutomation': '작업 자동화',
    'contentStudio': '비디오 스튜디오',
    'documentCruncher': '문서 처리기',
    'codeAssistant': 'AI 이미지 어시스턴트',
    'languageTitle': '언어 선택',
    'promptHint': '명령어를 입력하세요...',
    'generateBtn': 'AI 생성 시작',
    'close': '닫기',
  },
  'ru': {
    'welcome': 'Добро пожаловать, Командир',
    'deviceSupport': 'Операционная система ИИ для iOS и Android',
    'bannerText': 'LifePilot OS - Готов к генерации кода, картинок и видео',
    'activeEngines': 'Активные ИИ-модули',
    'taskAutomation': 'Автоматизация задач',
    'contentStudio': 'Видеостудия',
    'documentCruncher': 'Обработка документов',
    'codeAssistant': 'ИИ Ассистент изображений',
    'languageTitle': 'Выберите язык',
    'promptHint': 'Введите ваш запрос здесь...',
    'generateBtn': 'Запустить генерацию ИИ',
    'close': 'Закрыть',
  },
  'pt': {
    'welcome': 'Bem-vindo, Comandante',
    'deviceSupport': 'Sistema Operacional de IA iOS e Android',
    'bannerText': 'LifePilot OS - Pronto para gerar código, imagens e vídeos',
    'activeEngines': 'Motores de IA Ativos',
    'taskAutomation': 'Automação de Tarefas',
    'contentStudio': 'Estúdio de Vídeo',
    'documentCruncher': 'Processador de Documentos',
    'codeAssistant': 'Assistente de Imagem IA',
    'languageTitle': 'Selecionar Idioma',
    'promptHint': 'Digite seu comando aqui...',
    'generateBtn': 'Iniciar Geração de IA',
    'close': 'Fechar',
  },
  'it': {
    'welcome': 'Benvenuto, Comandante',
    'deviceSupport': 'Sistema Operativo IA iOS & Android',
    'bannerText': 'LifePilot OS - Pronto per la generazione di codice, immagini e video',
    'activeEngines': 'Motori IA Attivi',
    'taskAutomation': 'Automazione Attività',
    'contentStudio': 'Studio Video',
    'documentCruncher': 'Gestione Documenti',
    'codeAssistant': 'Assistente Immagini IA',
    'languageTitle': 'Seleziona Lingua',
    'promptHint': 'Digita il tuo comando qui...',
    'generateBtn': 'Avvia Generazione IA',
    'close': 'Chiudi',
  },
  'tr': {
    'welcome': 'Hoş Geldiniz, Komutanım',
    'deviceSupport': 'iOS ve Android Yapay Zeka İşletim Sistemi',
    'bannerText': 'LifePilot OS - Kod, Görüntü ve Video Üretimi İçin Hazır',
    'activeEngines': 'Aktif Yapay Zeka Motorları',
    'taskAutomation': 'Görev Otomasyonu',
    'contentStudio': 'Video Stüdyosu',
    'documentCruncher': 'Belge İşleyici',
    'codeAssistant': 'Yapay Zeka Görüntü Asistanı',
    'languageTitle': 'Dil Seçin',
    'promptHint': 'Komutunuzu buraya yazın...',
    'generateBtn': 'Yapay Zeka Üretimini Başlat',
    'close': 'Kapat',
  },
  'hi': {
    'welcome': 'स्वागत है, कमांडर',
    'deviceSupport': 'iOS और Android एआई ऑपरेटिंग सिस्टम',
    'bannerText': 'LifePilot OS - कोड, छवि और वीडियो निर्माण के लिए तैयार',
    'activeEngines': 'सक्रिय एआई इंजन',
    'taskAutomation': 'कार्य स्वचालन',
    'contentStudio': 'वीडियो स्टूडियो',
    'documentCruncher': 'दस्तावेज़ कंचर',
    'codeAssistant': 'एआई छवि सहायक',
    'languageTitle': 'भाषा चुनें',
    'promptHint': 'यहाँ अपना कमांड लिखें...',
    'generateBtn': 'एआई निर्माण शुरू करें',
    'close': 'बंद करें',
  },
  'id': {
    'welcome': 'Selamat Datang, Komandan',
    'deviceSupport': 'Sistem Operasi AI iOS & Android',
    'bannerText': 'LifePilot OS - Siap untuk Pembuatan Kode, Gambar & Video',
    'activeEngines': 'Mesin AI Aktif',
    'taskAutomation': 'Otomatisasi Tugas',
    'contentStudio': 'Studio Video',
    'documentCruncher': 'Pengolah Dokumen',
    'codeAssistant': 'Asisten Gambar AI',
    'languageTitle': 'Pilih Bahasa',
    'promptHint': 'Ketik perintah Anda di sini...',
    'generateBtn': 'Mulai Pembuatan AI',
    'close': 'Tutup',
  },
  'vi': {
    'welcome': 'Chào mừng, Chỉ huy',
    'deviceSupport': 'Hệ điều hành AI iOS & Android',
    'bannerText': 'LifePilot OS - Sẵn sàng tạo mã, hình ảnh và video',
    'activeEngines': 'Công cụ AI hoạt động',
    'taskAutomation': 'Tự động hóa tác vụ',
    'contentStudio': 'Studio Video',
    'documentCruncher': 'Xử lý tài liệu',
    'codeAssistant': 'Trợ lý Hình ảnh AI',
    'languageTitle': 'Chọn ngôn ngữ',
    'promptHint': 'Nhập lệnh của bạn ở đây...',
    'generateBtn': 'Bắt đầu tạo AI',
    'close': 'Đóng',
  },
  'pl': {
    'welcome': 'Witaj, Dowódco',
    'deviceSupport': 'System operacyjny AI na iOS i Android',
    'bannerText': 'LifePilot OS - Gotowy do generowania kodu, obrazów i wideo',
    'activeEngines': 'Aktywne Silniki AI',
    'taskAutomation': 'Automatyzacja Zadań',
    'contentStudio': 'Studio Wideo',
    'documentCruncher': 'Przetwarzanie Dokumentów',
    'codeAssistant': 'Asystent Obrazów AI',
    'languageTitle': 'Wybierz Język',
    'promptHint': 'Wpisz swoje polecenie...',
    'generateBtn': 'Rozpocznij generowanie AI',
    'close': 'Zamknij',
  },
  'nl': {
    'welcome': 'Welkom, Commandanten',
    'deviceSupport': 'iOS & Android AI Besturingssysteem',
    'bannerText': 'LifePilot OS - Klaar voor Code, Afbeelding & Video Generatie',
    'activeEngines': 'Actieve AI-engines',
    'taskAutomation': 'Taakautomatisering',
    'contentStudio': 'Videostudio',
    'documentCruncher': 'Documentverwerker',
    'codeAssistant': 'AI Afbeeldingsassistent',
    'languageTitle': 'Selecteer Taal',
    'promptHint': 'Typ hier je opdracht...',
    'generateBtn': 'Start AI Generatie',
    'close': 'Sluiten',
  },
  'uk': {
    'welcome': 'Ласкаво просимо, Командире',
    'deviceSupport': 'Операційна система штучного інтелекту для iOS та Android',
    'bannerText': 'LifePilot OS - Готовий до генерації коду, зображень та відео',
    'activeEngines': 'Активні штучні інтелекти',
    'taskAutomation': 'Автоматизація завдань',
    'contentStudio': 'Відеостудія',
    'documentCruncher': 'Обробка документів',
    'codeAssistant': 'ШІ Помічник зображень',
    'languageTitle': 'Виберіть мову',
    'promptHint': 'Введіть запит тут...',
    'generateBtn': 'Запустити генерацію ШІ',
    'close': 'Закрити',
  },
  'sv': {
    'welcome': 'Välkommen, Befälhavare',
    'deviceSupport': 'iOS & Android AI Operativsystem',
    'bannerText': 'LifePilot OS - Redo för kod-, bild- och videogenerering',
    'activeEngines': 'Aktiva AI-motorer',
    'taskAutomation': 'Uppgiftsautomatisering',
    'contentStudio': 'Videostudio',
    'documentCruncher': 'Dokumenthanterare',
    'codeAssistant': 'AI Bildassistent',
    'languageTitle': 'Välj Språk',
    'promptHint': 'Skriv din kommando här...',
    'generateBtn': 'Starta AI-generering',
    'close': 'Stäng',
  },
  'el': {
    'welcome': 'Καλώς ήρθατε, Διοικητή',
    'deviceSupport': 'Λειτουργικό Σύστημα AI iOS & Android',
    'bannerText': 'LifePilot OS - Έτοιμο για δημιουργία κώδικα, εικόνων και βίντεο',
    'activeEngines': 'Ενεργές Μηχανές AI',
    'taskAutomation': 'Αυτοματοποίηση Εργασιών',
    'contentStudio': 'Σтуδio Βίντεο',
    'documentCruncher': 'Επεξεργασία Εγγράφων',
    'codeAssistant': 'Βοηθός Εικόνας AI',
    'languageTitle': 'Επιλογή Γλώσσας',
    'promptHint': 'Εισάγετε την εντολή σας...',
    'generateBtn': 'Έναρξη Παραγωγής AI',
    'close': 'Κλείσιμο',
  },
  'he': {
    'welcome': 'ברוך הבא, המפקד',
    'deviceSupport': 'מערכת הפעלה מבוססת בינה מלאכותית ל-iOS ו-Android',
    'bannerText': 'LifePilot OS - מוכן ליצירת קוד, תמונות ווידאו',
    'activeEngines': 'מנועי בינה מלאכותית פעילים',
    'taskAutomation': 'אוטומציה של משימות',
    'contentStudio': 'סטודיו וידאו',
    'documentCruncher': 'מעבד מסמכים',
    'codeAssistant': 'עוזר תמונות AI',
    'languageTitle': 'בחר שפה',
    'promptHint': 'הקלד את הפקודה שלך כאן...',
    'generateBtn': 'התחל יצירת AI',
    'close': 'סגור',
  },
  'ro': {
    'welcome': 'Bun venit, Comandant',
    'deviceSupport': 'Sistem de Operare AI iOS & Android',
    'bannerText': 'LifePilot OS - Pregătit pentru Generare Cod, Imagini și Video',
    'activeEngines': 'Motoare AI Active',
    'taskAutomation': 'Automatizare Sarcini',
    'contentStudio': 'Studio Video',
    'documentCruncher': 'Procesor Documente',
    'codeAssistant': 'Asistent Imagini AI',
    'languageTitle': 'Selectați Limba',
    'promptHint': 'Introduceți comanda aici...',
    'generateBtn': 'Pornește Generarea AI',
    'close': 'Închide',
  },
  'hu': {
    'welcome': 'Üdvözöljük, Parancsnok',
    'deviceSupport': 'iOS & Android AI Operációs Rendszer',
    'bannerText': 'LifePilot OS - Kód, Kép és Videó generálásra kész',
    'activeEngines': 'Aktív AI Motorok',
    'taskAutomation': 'Feladatautomatizálás',
    'contentStudio': 'Videó Stúdió',
    'documentCruncher': 'Dokumentumkezelő',
    'codeAssistant': 'AI Képasszisztens',
    'languageTitle': 'Nyelv Kiválasztása',
    'promptHint': 'Írja be a parancsot...',
    'generateBtn': 'AI Generálás Indítása',
    'close': 'Bezárás',
  },
  'cs': {
    'welcome': 'Vítejte, Veliteli',
    'deviceSupport': 'iOS & Android AI Operační Systém',
    'bannerText': 'LifePilot OS - Připraveno pro generování kódu, obrázků a videí',
    'activeEngines': 'Aktivní AI Motory',
    'taskAutomation': 'Automatizace Úkolů',
    'contentStudio': 'Video Studio',
    'documentCruncher': 'Zpracování Dokumentů',
    'codeAssistant': 'AI Asistent Obrázků',
    'languageTitle': 'Vybrat Jazyk',
    'promptHint': 'Zadejte svůj příkaz...',
    'generateBtn': 'Spustit AI Generování',
    'close': 'Zavřít',
  },
  'th': {
    'welcome': 'ยินดีต้อนรับ ท่านผู้บัญชาการ',
    'deviceSupport': 'ระบบปฏิบัติการ AI บน iOS และ Android',
    'bannerText': 'LifePilot OS - พร้อมสร้างโค้ด รูปภาพ และวิดีโอ',
    'activeEngines': 'เครื่องมือ AI ที่ใช้งานอยู่',
    'taskAutomation': 'การทำงานอัตโนมัติ',
    'contentStudio': 'สตูดิโอวิดีโอ',
    'documentCruncher': 'เครื่องมือจัดการเอกสาร',
    'codeAssistant': 'ผู้ช่วยรูปภาพ AI',
    'languageTitle': 'เลือกภาษา',
    'promptHint': 'พิมพ์คำสั่งของคุณที่นี่...',
    'generateBtn': 'เริ่มการสร้าง AI',
    'close': 'ปิด',
  },
};

final Map<String, String> globalLanguagesMap = {
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
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: globalLanguagesMap.length,
                  itemBuilder: (context, index) {
                    String code = globalLanguagesMap.keys.elementAt(index);
                    String name = globalLanguagesMap.values.elementAt(index);
                    return ListTile(
                      title: Text(name, style: const TextStyle(color: Colors.white)),
                      trailing: currentLocale == code ? const Icon(Icons.check, color: Color(0xFF6C63FF)) : null,
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

  void _openAiGenerator(BuildContext context, String engineTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AiStudioScreen(engineTitle: engineTitle, translate: translate),
      ),
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
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      translate('deviceSupport'),
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
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
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              translate('activeEngines'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
                    icon: Icons.code,
                    iconColor: Colors.blueAccent,
                    title: translate('taskAutomation'),
                  ),
                  _buildEngineCard(
                    context: context,
                    icon: Icons.video_collection,
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
                    icon: Icons.image,
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
      onTap: () => _openAiGenerator(context, title),
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
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class AiStudioScreen extends StatefulWidget {
  final String engineTitle;
  final String Function(String) translate;

  const AiStudioScreen({Key? key, required this.engineTitle, required this.translate}) : super(key: key);

  @override
  State<AiStudioScreen> createState() => _AiStudioScreenState();
}

class _AiStudioScreenState extends State<AiStudioScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String _resultText = "";
  bool _isDone = false;

  void _startGeneration() {
    String query = _controller.text.trim();
    if (query.isEmpty) query = "طلب عام";

    setState(() {
      _isLoading = true;
      _isDone = false;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _isDone = true;
        _resultText = "✨ النتيجة المولدة بنجاح عبر محرك (${widget.engineTitle}):\n\n«$query»\n\n• تم معالجة وتوليد المخرج البرمجي، أو الصورة، أو الفيديو باحترافية تامة!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.engineTitle, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1A1C24),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: widget.translate('promptHint'),
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1A1C24),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isLoading ? null : _startGeneration,
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      ),
                    child: Text(
                      widget.translate('generateBtn'),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
              ),
            ),
            const SizedBox(height: 24),
            if (_isDone) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C24),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF6C63FF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_resultText, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.4)),
                    const SizedBox(height: 16),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
