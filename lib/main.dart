import 'package:flutter/material.dart';

class AppTranslations {
  final Locale locale;
  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Phone Universe',
      'welcomeMessage': 'The Ultimate Global Phone Hub & AI Intelligence',
      'searchHint': 'Search any brand, phone, specs, or benchmark...',
      'usedMarketTab': 'Live Market',
      'newPhonesTab': 'Global Models',
      'specsTab': 'Pro Benchmarks',
      'aiAssistantTab': 'AI Genius',
      'revealContact': 'Unlock Direct Contact (\$1)',
      'phoneDetails': 'Comprehensive Device Specs',
      'brandCategories': 'All World Brands & Series',
      'selectLanguage': 'Select Global Language (25+)',
      'globalDatabase': 'Integrated with GSMArena, DxOMARK & NanoReview',
    },
    'ar': {
      'appTitle': 'عالم الهواتف الذكية',
      'welcomeMessage': 'المنصة العالمية الشاملة وذكاء الهواتف الخارق',
      'searchHint': 'ابحث عن أي ماركة، هاتف، مواصفات، أو أداء...',
      'usedMarketTab': 'السوق الحي',
      'newPhonesTab': 'الموديلات العالمية',
      'specsTab': 'مقارنة المعامل',
      'aiAssistantTab': 'الخبير الذكي',
      'revealContact': 'فتح رقم التواصل المباشر (1\$)',
      'phoneDetails': 'المواصفات الشاملة للجهاز',
      'brandCategories': 'جميع الماركات والإصدارات العالمية',
      'selectLanguage': 'اختر لغة التطبيق (أكثر من 25 لغة)',
      'globalDatabase': 'مرتبط بأكبر قواعد البيانات العالمية ومقارنات المعامل',
    },
    'es': {
      'appTitle': 'Universo Teléfono IA',
      'welcomeMessage': 'El Centro Global Definitivo de Smartphones',
      'searchHint': 'Buscar marca, teléfono o especificaciones...',
      'usedMarketTab': 'Mercado En Vivo',
      'newPhonesTab': 'Modelos Globales',
      'specsTab': 'Pruebas Pro',
      'aiAssistantTab': 'Genio IA',
      'revealContact': 'Desbloquear Contacto (\$1)',
      'phoneDetails': 'Especificaciones del Dispositivo',
      'brandCategories': 'Todas las Marcas Mundiales',
      'selectLanguage': 'Seleccionar Idioma (25+)',
      'globalDatabase': 'Integrado con GSMArena, DxOMARK y NanoReview',
    },
    'fr': {
      'appTitle': 'Univers Téléphone IA',
      'welcomeMessage': 'Le Centre Mondial Ultime des Smartphones',
      'searchHint': 'Rechercher une marque, un téléphone...',
      'usedMarketTab': 'Marché Direct',
      'newPhonesTab': 'Modèles Mondiaux',
      'specsTab': 'Tests Pro',
      'aiAssistantTab': 'Génie IA',
      'revealContact': 'Déverrouiller le Contact (\$1)',
      'phoneDetails': 'Spécifications de l\'Appareil',
      'brandCategories': 'Toutes les Marques Mondiales',
      'selectLanguage': 'Sélectionner la Langue (25+)',
      'globalDatabase': 'Intégré avec GSMArena, DxOMARK & NanoReview',
    },
    'de': {
      'appTitle': 'KI Telefon Universum',
      'welcomeMessage': 'Das Ultimate Globale Smartphone & KI Hub',
      'searchHint': 'Suche Marke, Telefon oder Specs...',
      'usedMarketTab': 'Live Markt',
      'newPhonesTab': 'Globale Modelle',
      'specsTab': 'Pro Benchmarks',
      'aiAssistantTab': 'KI Genie',
      'revealContact': 'Kontakt Freischalten (\$1)',
      'phoneDetails': 'Umfassende Gerätedetails',
      'brandCategories': 'Alle Weltweiten Marken',
      'selectLanguage': 'Sprache Auswählen (25+)',
      'globalDatabase': 'Integriert mit GSMArena, DxOMARK & NanoReview',
    },
    'zh': {
      'appTitle': 'AI 手机宇宙',
      'welcomeMessage': '终极全球手机中心与人工智能',
      'searchHint': '搜索任何品牌、手机或参数...',
      'usedMarketTab': '实时市场',
      'newPhonesTab': '全球机型',
      'specsTab': '专业评测',
      'aiAssistantTab': 'AI 天才',
      'revealContact': '解锁直接联系方式 (\$1)',
      'phoneDetails': '设备综合参数',
      'brandCategories': '所有全球品牌系列',
      'selectLanguage': '选择语言 (25+)',
      'globalDatabase': '已整合 GSMArena、DxOMARK 和 NanoReview 数据',
    },
    'ja': {
      'appTitle': 'AIフォン・ユニバース',
      'welcomeMessage': '究極のグローバルスマートフォン＆AIハブ',
      'searchHint': 'ブランド、モデル、スペックを検索...',
      'usedMarketTab': 'ライブ市場',
      'newPhonesTab': 'グローバルモデル',
      'specsTab': 'プロベンチマーク',
      'aiAssistantTab': 'AI天才',
      'revealContact': '連絡先を解除 (\$1)',
      'phoneDetails': 'デバイス詳細仕様',
      'brandCategories': 'すべてのグローバルブランド',
      'selectLanguage': '言語を選択 (25+)',
      'globalDatabase': 'GSMArena、DxOMARK、NanoReviewと統合',
    },
    'ru': {
      'appTitle': 'ИИ Телефон Вселенная',
      'welcomeMessage': 'Максимальный глобальный хаб смартфонов и ШИ',
      'searchHint': 'Поиск бренда, телефона или характеристик...',
      'usedMarketTab': 'Живой рынок',
      'newPhonesTab': 'Мировые модели',
      'specsTab': 'Про Тесты',
      'aiAssistantTab': 'ШИ Гений',
      'revealContact': 'Открыть контакт (\$1)',
      'phoneDetails': 'Детали устройства',
      'brandCategories': 'Все мировые бренды',
      'selectLanguage': 'Выберите язык (25+)',
      'globalDatabase': 'Интегрировано с GSMArena, DxOMARK и NanoReview',
    },
    'tr': {
      'appTitle': 'Yapay Zeka Telefon Evreni',
      'welcomeMessage': 'En Üstün Küresel Telefon ve AI Merkezi',
      'searchHint': 'Marka, telefon veya özellik ara...',
      'usedMarketTab': 'Canlı Pazar',
      'newPhonesTab': 'Küresel Modeller',
      'specsTab': 'Pro Testler',
      'aiAssistantTab': 'AI Dahi',
      'revealContact': 'İletişimi Aç (\$1)',
      'phoneDetails': 'Cihaz Özellikleri',
      'brandCategories': 'Tüm Küresel Markalar',
      'selectLanguage': 'Dil Seç (25+)',
      'globalDatabase': 'GSMArena, DxOMARK ve NanoReview Entegreli',
    },
    'it': {
      'appTitle': 'Universo Telefono IA',
      'welcomeMessage': 'Il Centro Globale Definitivo per Smartphone',
      'searchHint': 'Cerca marca, telefono o specifiche...',
      'usedMarketTab': 'Mercato Live',
      'newPhonesTab': 'Modelli Globali',
      'specsTab': 'Test Pro',
      'aiAssistantTab': 'Genio IA',
      'revealContact': 'Sblocca Contatto (\$1)',
      'phoneDetails': 'Specifiche Dispositivo',
      'brandCategories': 'Tutti i Marchi Mondiali',
      'selectLanguage': 'Seleziona Lingua (25+)',
      'globalDatabase': 'Integrato con GSMArena, DxOMARK e NanoReview',
    },
    'pt': {
      'appTitle': 'Universo Telefone IA',
      'welcomeMessage': 'O Hub Global Definitivo de Smartphones e IA',
      'searchHint': 'Pesquise marca, telefone ou especificações...',
      'usedMarketTab': 'Mercado ao Vivo',
      'newPhonesTab': 'Modelos Globais',
      'specsTab': 'Testes Pro',
      'aiAssistantTab': 'Gênio IA',
      'revealContact': 'Desbloquear Contato (\$1)',
      'phoneDetails': 'Especificações do Aparelho',
      'brandCategories': 'Todas as Marcas Globais',
      'selectLanguage': 'Selecionar Idioma (25+)',
      'globalDatabase': 'Integrado com GSMArena, DxOMARK e NanoReview',
    },
    'ko': {
      'appTitle': 'AI 폰 유니버스',
      'welcomeMessage': '최고의 글로벌 스마트폰 및 AI 허브',
      'searchHint': '브랜드, 모델, 사양 검색...',
      'usedMarketTab': '라이브 마켓',
      'newPhonesTab': '글로벌 모델',
      'specsTab': '프로 벤치마크',
      'aiAssistantTab': 'AI 천재',
      'revealContact': '연락처 잠금 릴리스 (\$1)',
      'phoneDetails': '상세 사양',
      'brandCategories': '모든 글로벌 브랜드',
      'selectLanguage': '언어 선택 (25+)',
      'globalDatabase': 'GSMArena, DxOMARK 및 NanoReview 연동',
    },
    'hi': {
      'appTitle': 'AI फ़ोन यूनिवर्स',
      'welcomeMessage': 'सर्व-व्यापक वैश्विक स्मार्टफोन और AI केंद्र',
      'searchHint': 'कोई भी ब्रांड, फोन या स्पेसिफिकेशंस खोजें...',
      'usedMarketTab': 'लाइव मार्केट',
      'newPhonesTab': 'वैश्विक मॉडल',
      'specsTab': 'प्रो बेंचमार्क',
      'aiAssistantTab': 'AI जीनियस',
      'revealContact': 'संपर्क अनलॉक करें (\$1)',
      'phoneDetails': 'डिवाइस विवरण',
      'brandCategories': 'सभी वैश्विक ब्रांड',
      'selectLanguage': 'भाषा चुनें (25+)',
      'globalDatabase': 'GSMArena, DxOMARK और NanoReview से एकीकृत',
    },
    'id': {
      'appTitle': 'Semesta Ponsel AI',
      'welcomeMessage': 'Pusat Smartphone & Kecerdasan Buatan Global',
      'searchHint': 'Cari merek, ponsel, atau spesifikasi...',
      'usedMarketTab': 'Pasar Langsung',
      'newPhonesTab': 'Model Global',
      'specsTab': 'Uji Pro',
      'aiAssistantTab': 'Jenius AI',
      'revealContact': 'Buka Kontak (\$1)',
      'phoneDetails': 'Detail Perangkat',
      'brandCategories': 'Semua Merek Global',
      'selectLanguage': 'Pilih Bahasa (25+)',
      'globalDatabase': 'Terintegrasi dengan GSMArena, DxOMARK & NanoReview',
    },
    'nl': {
      'appTitle': 'AI Telefoon Universum',
      'welcomeMessage': 'De Ultieme Wereldwijde Smartphone & AI Hub',
      'searchHint': 'Zoek merk, telefoon of specificaties...',
      'usedMarketTab': 'Live Markt',
      'newPhonesTab': 'Wereldwijde Modellen',
      'specsTab': 'Pro Benchmarks',
      'aiAssistantTab': 'AI Genie',
      'revealContact': 'Ontgrendel Contact (\$1)',
      'phoneDetails': 'Apparaat Specificaties',
      'brandCategories': 'Alle Wereldwijde Merken',
      'selectLanguage': 'Selecteer Taal (25+)',
      'globalDatabase': 'Geïntegreerd met GSMArena, DxOMARK & NanoReview',
    },
    'pl': {
      'appTitle': 'Wszechświat Telefonów AI',
      'welcomeMessage': 'Ostateczne Globalne Centrum Smartfonów i AI',
      'searchHint': 'Szukaj marki, telefonu lub specyfikacji...',
      'usedMarketTab': 'Rynek na Żywo',
      'newPhonesTab': 'Modele Globalne',
      'specsTab': 'Testy Pro',
      'aiAssistantTab': 'Geniusz AI',
      'revealContact': 'Odblokuj Kontakt (\$1)',
      'phoneDetails': 'Szczegóły Urządzenia',
      'brandCategories': 'Wszystkie Marki Globalne',
      'selectLanguage': 'Wybierz Język (25+)',
      'globalDatabase': 'Zintegrowane z GSMArena, DxOMARK i NanoReview',
    },
    'vi': {
      'appTitle': 'Vũ Trụ Điện Thoại AI',
      'welcomeMessage': 'Trung tâm Smartphone & Trí tuệ Nhân tạo Toàn cầu',
      'searchHint': 'Tìm kiếm thương hiệu, điện thoại, thông số...',
      'usedMarketTab': 'Chợ Trực Tuyến',
      'newPhonesTab': 'Mẫu Toàn Cầu',
      'specsTab': 'Đánh Giá Pro',
      'aiAssistantTab': 'Thiên Tài AI',
      'revealContact': 'Mở Khóa Liên Hệ (\$1)',
      'phoneDetails': 'Chi Tiết Thiết Bị',
      'brandCategories': 'Tất Cả Thương Hiệu Toàn Cầu',
      'selectLanguage': 'Chọn Ngôn Ngữ (25+)',
      'globalDatabase': 'Tích hợp với GSMArena, DxOMARK & NanoReview',
    },
    'th': {
      'appTitle': 'จักรวาลโทรศัพท์ AI',
      'welcomeMessage': 'ศูนย์กลางสมาร์ทโฟนและ AI ระดับโลกขั้นสูงสุด',
      'searchHint': 'ค้นหาแบรนด์ รุ่น หรือสเปค...',
      'usedMarketTab': 'ตลาดสด',
      'newPhonesTab': 'รุ่นระดับโลก',
      'specsTab': 'ผลทดสอบ Pro',
      'aiAssistantTab': 'AI อัจฉริยะ',
      'revealContact': 'ปลดล็อกการติดต่อ (\$1)',
      'phoneDetails': 'รายละเอียดอุปกรณ์',
      'brandCategories': 'แบรนด์ระดับโลกทั้งหมด',
      'selectLanguage': 'เลือกภาษา (25+)',
      'globalDatabase': 'เชื่อมต่อกับ GSMArena, DxOMARK และ NanoReview',
    },
    'sv': {
      'appTitle': 'AI Telefon Universum',
      'welcomeMessage': 'Det Ultima Globala Smartphone & AI-centret',
      'searchHint': 'Sök märke, telefon eller specifikationer...',
      'usedMarketTab': 'Live Marknad',
      'newPhonesTab': 'Globala Modeller',
      'specsTab': 'Pro Tester',
      'aiAssistantTab': 'AI Geni',
      'revealContact': 'Lås upp Kontakt (\$1)',
      'phoneDetails': 'Enhetsdetaljer',
      'brandCategories': 'Alla Globala Märken',
      'selectLanguage': 'Välj Språk (25+)',
      'globalDatabase': 'Integrerad med GSMArena, DxOMARK & NanoReview',
    },
    'el': {
      'appTitle': 'AI Phone Universe',
      'welcomeMessage': 'Ο Απόλυτος Παγκόσμιος Κόμβος Smartphone & AI',
      'searchHint': 'Αναζήτηση μάρκας, τηλεφώνου, χαρακτηριστικών...',
      'usedMarketTab': 'Ζωντανή Αγορά',
      'newPhonesTab': 'Παγκόσμια Μοντέλα',
      'specsTab': 'Pro Μετρήσεις',
      'aiAssistantTab': 'AI Genius',
      'revealContact': 'Ξεκλείδωμα Επαφής (\$1)',
      'phoneDetails': 'Λεπτομέρειες Συσκευής',
      'brandCategories': 'Όλες οι Παγκόσμιες Μάρκες',
      'selectLanguage': 'Επιλογή Γλώσσας (25+)',
      'globalDatabase': 'Ενσωματωμένο με GSMArena, DxOMARK & NanoReview',
    },
    'he': {
      'appTitle': 'עולם הטלפונים AI',
      'welcomeMessage': 'מרכז הסמארטפונים והבינה המלאכותית הגלובלי האולטימטיבי',
      'searchHint': 'חפש מותג, טלפון או מפרט...',
      'usedMarketTab': 'שוק חי',
      'newPhonesTab': 'דגמים גלובליים',
      'specsTab': 'בנצ׳מרק מקצועي',
      'aiAssistantTab': 'גאון AI',
      'revealContact': 'פתח איש קשר (\$1)',
      'phoneDetails': 'מפרט המכשיר',
      'brandCategories': 'כל המותגים העולמיים',
      'selectLanguage': 'בחר שפה (25+)',
      'globalDatabase': 'משולב עם GSMArena, DxOMARK ו-NanoReview',
    },
    'uk': {
      'appTitle': 'ШІ Телефон Всесвіт',
      'welcomeMessage': 'Найвищий глобальний хаб смартфонів та штучного інтелекту',
      'searchHint': 'Пошук бренду, телефону, характеристик...',
      'usedMarketTab': 'Живий ринок',
      'newPhonesTab': 'Світові моделі',
      'specsTab': 'Про Тести',
      'aiAssistantTab': 'ШІ Геній',
      'revealContact': 'Відкрити контакт (\$1)',
      'phoneDetails': 'Деталі пристрою',
      'brandCategories': 'Усі світові бренди',
      'selectLanguage': 'Виберіть мову (25+)',
      'globalDatabase': 'Інтегровано з GSMArena, DxOMARK та NanoReview',
    },
    'fa': {
      'appTitle': 'جهان گوشی هوش مصنوعی',
      'welcomeMessage': 'مرکز نهایی هوش مصنوعی و تلفن همراه جهانی',
      'searchHint': 'جستجوی هر برند، گوشی یا مشخصات...',
      'usedMarketTab': 'بازار زنده',
      'newPhonesTab': 'مدل‌های جهانی',
      'specsTab': 'بنچمارک حرفه‌ای',
      'aiAssistantTab': 'نابغه هوش مصنوعی',
      'revealContact': 'باز کردن مخاطب (\$1)',
      'phoneDetails': 'جزئیات دستگاه',
      'brandCategories': 'تمام برندهای جهانی',
      'selectLanguage': 'انتخاب زبان (25+)',
      'globalDatabase': 'متصل به GSMArena، DxOMARK و NanoReview',
    },
    'ur': {
      'appTitle': 'AI فون کائنات',
      'welcomeMessage': 'حتمی عالمی اسمارٹ فون اور AI مرکز',
      *D: 'کوئی بھی برانْد، فون یا خصوصیات تلاش کریں...',
      'searchHint': 'کوئی بھی برانڈ، فون یا خصوصیات تلاش کریں...',
      'usedMarketTab': 'لائیو مارکیٹ',
      'newPhonesTab': 'عالمی ماڈلز',
      'specsTab': 'پرو بینچ مارکس',
      'aiAssistantTab': 'AI جینیئس',
      'revealContact': 'رابطہ کھولें (\$1)',
      'phoneDetails': 'ڈیوائس کی تفصیلات',
      'brandCategories': 'تمام عالمی برانڈز',
      'selectLanguage': 'زبان منتخب کریں (25+)',
      'globalDatabase': 'GSMArena، DxOMARK اور NanoReview سے مربوط',
    },
    'bn': {
      'appTitle': 'এআই ফোন ইউনিভার্স',
      'welcomeMessage': 'চূড়ান্ত গ্লোবাল স্মার্টফোন ও এআই হাব',
      'searchHint': 'যেকোনো ব্র্যান্ড, ফোন বা স্পেসিফিকেশন খুঁজুন...',
      'usedMarketTab': 'লাইভ বাজার',
      'newPhonesTab': 'গ্লোবাল মডেল',
      'specsTab': 'প্রো বেঞ্চমার্ক',
      'aiAssistantTab': 'এআই জিনিয়াস',
      'revealContact': 'যোগাযোগ আনলক করুন (\$1)',
      'phoneDetails': 'ডিভাইসের বিবরণ',
      'brandCategories': 'সকল বৈশ্বিক ব্র্যান্ড',
      'selectLanguage': 'ভাষা নির্বাচন করুন (25+)',
      'globalDatabase': 'GSMArena, DxOMARK এবং NanoReview এর সাথে যুক্ত',
    },
  };

  String get(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']![key]!;
  }
}

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => [
    'en', 'ar', 'es', 'fr', 'de', 'zh', 'ja', 'ru', 'tr', 'it', 
    'pt', 'ko', 'hi', 'id', 'nl', 'pl', 'vi', 'th', 'sv', 'el', 
    'he', 'uk', 'fa', 'ur', 'bn'
  ].contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) async => AppTranslations(locale);

  @override
  bool shouldReload(AppTranslationsDelegate old) => false;
}

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
      title: 'AI Phone Universe',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF6366F1),
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF10B981),
          surface: Color(0xFF1E293B),
        ),
      ),
      locale: _currentLocale,
      supportedLocales: const [
        Locale('en', ''), Locale('ar', ''), Locale('es', ''), Locale('fr', ''),
        Locale('de', ''), Locale('zh', ''), Locale('ja', ''), Locale('ru', ''),
        Locale('tr', ''), Locale('it', ''), Locale('pt', ''), Locale('ko', ''),
        Locale('hi', ''), Locale('id', ''), Locale('nl', ''), Locale('pl', ''),
        Locale('vi', ''), Locale('th', ''), Locale('sv', ''), Locale('el', ''),
        Locale('he', ''), Locale('uk', ''), Locale('fa', ''), Locale('ur', ''),
        Locale('bn', '')
      ],
      localizationsDelegates: const [AppTranslationsDelegate()],
      home: MainScreen(onLanguageChanged: _changeLanguage),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  const MainScreen({super.key, required this.onLanguageChanged});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _showLanguageSelector(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));
    
    final List<Map<String, String>> languages = [
      {'name': 'English (English)', 'code': 'en'},
      {'name': 'العربية (Arabic)', 'code': 'ar'},
      {'name': 'Español (Spanish)', 'code': 'es'},
      {'name': 'Français (French)', 'code': 'fr'},
      {'name': 'Deutsch (German)', 'code': 'de'},
      {'name': '中文 (Chinese)', 'code': 'zh'},
      {'name': '日本語 (Japanese)', 'code': 'ja'},
      {'name': 'Русский (Russian)', 'code': 'ru'},
      {'name': 'Türkçe (Turkish)', 'code': 'tr'},
      {'name': 'Italiano (Italian)', 'code': 'it'},
      {'name': 'Português (Portuguese)', 'code': 'pt'},
      {'name': '한국어 (Korean)', 'code': 'ko'},
      {'name': 'हिन्दी (Hindi)', 'code': 'hi'},
      {'name': 'Bahasa Indonesia (Indonesian)', 'code': 'id'},
      {'name': 'Nederlands (Dutch)', 'code': 'nl'},
      {'name': 'Polski (Polish)', 'code': 'pl'},
      {'name': 'Tiếng Việt (Vietnamese)', 'code': 'vi'},
      {'name': 'ไทย (Thai)', 'code': 'th'},
      {'name': 'Svenska (Swedish)', 'code': 'sv'},
      {'name': 'Ελληνικά (Greek)', 'code': 'el'},
      {'name': 'עברית (Hebrew)', 'code': 'he'},
      {'name': 'Українська (Ukrainian)', 'code': 'uk'},
      {'name': 'فارسی (Persian)', 'code': 'fa'},
      {'name': 'اردو (Urdu)', 'code': 'ur'},
      {'name': 'বাংলা (Bengali)', 'code': 'bn'},
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.get('selectLanguage'),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Divider(color: Colors.white10),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return ListTile(
                      title: Text(lang['name']!, style: const TextStyle(color: Colors.white)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF818CF8)),
                      onTap: () {
                        widget.onLanguageChanged(Locale(lang['code']!));
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

  @override
  Widget build(BuildContext context) {
    final t = AppTranslations.of(context) ?? AppTranslations(const Locale('en'));

    final List<Widget> pages = [
      HomeScreen(t: t),
      NewPhonesScreen(t: t),
      SpecsScreen(t: t),
      AiAssistantScreen(t: t),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: const Color(0xFF1E293B),
          selectedItemColor: const Color(0xFF818CF8),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.storefront_rounded), label: t.get('usedMarketTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.new_releases_rounded), label: t.get('newPhonesTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.phone_iphone_rounded), label: t.get('specsTab')),
            BottomNavigationBarItem(icon: const Icon(Icons.auto_awesome_rounded), label: t.get('aiAssistantTab')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(t.get('appTitle'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language_rounded, color: Color(0xFF818CF8)),
            onPressed: () => _showLanguageSelector(context),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppTranslations t;
  const HomeScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> usedPhones = [
      {'name': 'iPhone 15 Pro Max', 'price': '\$850', 'cond': 'Like New - Local', 'battery': '95%'},
      {'name': 'Samsung Galaxy S24 Ultra', 'price': '\$790', 'cond': 'Excellent - Local', 'battery': '92%'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF9333EA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bolt_rounded, color: Colors.amber, size: 34),
                const SizedBox(height: 10),
                Text(t.get('appTitle'), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(t.get('welcomeMessage'), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(t.get('globalDatabase'), style: const TextStyle(color: Colors.amberAccent, fontSize: 11)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: t.get('searchHint'),
              prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF818CF8)),
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 24),
          Text(t.get('usedMarketTab'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          ...usedPhones.map((phone) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(phone['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                      Text(phone['price'], style: const TextStyle(color: Color(0xFF34D399), fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(phone['cond'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF059669),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.lock_open_rounded, size: 18),
                      label: Text(t.get('revealContact')),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF1E293B),
                            title: const Text('Secure Payment', style: TextStyle(color: Colors.white)),
                            content: const Text('Pay \$1 to reveal seller contact details securely.', style: TextStyle(color: Colors.white70)),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK', style: TextStyle(color: Color(0xFF818CF8)))),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class NewPhonesScreen extends StatelessWidget {
  final AppTranslations t;
  NewPhonesScreen({super.key, required this.t});

  final List<Map<String, dynamic>> brands = [
    {
      'brand': 'Samsung',
      'icon': Icons.phone_android,
      'models': [
        {'name': 'Galaxy S25 Ultra', 'specs': 'Snapdragon 8 Gen 4, 200MP, 5000mAh', 'price': '\$1299'},
        {'name': 'Galaxy S25+', 'specs': 'Exynos / Snapdragon, 50MP, 4900mAh', 'price': '\$999'},
        {'name': 'Galaxy Z Fold 6', 'specs': 'Foldable AMOLED, AI Multitasking', 'price': '\$1799'},
        {'name': 'Galaxy Z Flip 6', 'specs': 'FlexWindow, 50MP Camera, 4000mAh', 'price': '\$1099'},
        {'name': 'Galaxy A55 5G', 'specs': 'Exynos 1480, 50MP Camera, 5000mAh', 'price': '\$420'},
        {'name': 'Galaxy A35 5G', 'specs': 'Exynos 1380, Super AMOLED, 5000mAh', 'price': '\$320'},
      ]
    },
    {
      'brand': 'Apple',
      'icon': Icons.phone_iphone,
      'models': [
        {'name': 'iPhone 16 Pro Max', 'specs': 'A18 Pro Chip, 48MP Triple Cam, Titanium', 'price': '\$1399'},
        {'name': 'iPhone 16 Pro', 'specs': 'A18 Pro Chip, 5x Telephoto, ProMotion', 'price': '\$1099'},
        {'name': 'iPhone 16', 'specs': 'A18 Chip, Action Button, Dual Camera', 'price': '\$799'},
        {'name': 'iPhone 15 Pro Max', 'specs': 'A17 Pro, Titanium Build, 5x Zoom', 'price': '\$1199'},
        {'name': 'iPhone 15', 'specs': 'A16 Bionic, Dynamic Island, USB-C', 'price': '\$699'},
      ]
    },
    {
      'brand': 'Xiaomi & Poco',
      'icon': Icons.devices_other,
      'models': [
        {'name': 'Xiaomi 14 Ultra', 'specs': 'Snapdragon 8 Gen 3, Leica Quad Cam', 'price': '\$1099'},
        {'name': 'Xiaomi 14 Pro', 'specs': 'Snapdragon 8 Gen 3, AMOLED 120Hz', 'price': '\$899'},
        {'name': 'Poco X8 Pro', 'specs': 'High Performance Gaming, 120Hz OLED', 'price': '\$380'},
        {'name': 'Poco F6 Pro', 'specs': 'Snapdragon 8 Gen 2, 120W Fast Charge', 'price': '\$499'},
      ]
    },
    {
      'brand': 'Honor & Huawei',
      'icon': Icons.smartphone,
      'models': [
        {'name': 'Honor Magic 6 Pro', 'specs': 'Snapdragon 8 Gen 3, 5600mAh Battery', 'price': '\$999'},
        {'name': 'Honor X9d', 'specs': 'Ultra Durable Screen, Large Battery', 'price': '\$310'},
        {'name': 'Huawei Pura 70 Ultra', 'specs': 'Kirin 9010, 1-inch Retractable Camera', 'price': '\$1299'},
        {'name': 'Huawei Mate 60 Pro', 'specs': 'Satellite Calling, Kunlan Glass', 'price': '\$999'},
      ]
    },
    {
      'brand': 'Oppo & OnePlus',
      'icon': Icons.phone_android_rounded,
      'models': [
        {'name': 'Oppo Find X7 Ultra', 'specs': 'Dual Periscope Zoom, Snapdragon 8 Gen 3', 'price': '\$1199'},
        {'name': 'Oppo Reno 12 Pro', 'specs': 'Dimensity 7300-Energy, AI Portrait', 'price': '\$480'},
        {'name': 'OnePlus 12', 'specs': 'Snapdragon 8 Gen 3, Hasselblad Camera', 'price': '\$799'},
        {'name': 'OnePlus Nord 4', 'specs': 'Metal Unibody, Snapdragon 7+ Gen 3', 'price': '\$450'},
      ]
    },
    {
      'brand': 'Vivo & Realme',
      'icon': Icons.phonelink_ring,
      'models': [
        {'name': 'Vivo X100 Pro', 'specs': 'Zeiss Apo Telephoto, Dimensity 9300', 'price': '\$999'},
        {'name': 'Vivo V30 Pro', 'specs': 'Studio Portrait Lighting, 5000mAh', 'price': '\$450'},
        {'name': 'Realme GT 6', 'specs': 'Snapdragon 8s Gen 3, 6000 nits Screen', 'price': '\$599'},
        {'name': 'Realme 12 Pro+', 'specs': 'Periscope Telephoto, Luxury Watch Design', 'price': '\$399'},
      ]
    },
    {
      'brand': 'Google Pixel & Motorola',
      'icon': Icons.devices,
      'models': [
        {'name': 'Google Pixel 9 Pro XL', 'specs': 'Tensor G4, Advanced AI, 16GB RAM', 'price': '\$1099'},
        {'name': 'Google Pixel 8a', 'specs': 'Tensor G3, 7 Years Updates, OLED', 'price': '\$499'},
        {'name': 'Motorola Edge 50 Ultra', 'specs': 'Snapdragon 8s Gen 3, Pantone Validated', 'price': '\$999'},
        {'name': 'Moto Razr 50 Ultra', 'specs': 'Huge External Cover Screen, Foldable', 'price': '\$999'},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(t.get('newPhonesTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 6),
        Text(t.get('brandCategories'), style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 16),
        ...brands.map((brandData) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(brandData['icon'], color: const Color(0xFF818CF8), size: 24),
                  const SizedBox(width: 10),
                  Text(brandData['brand'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const Divider(color: Colors.white10, height: 20),
              ...(brandData['models'] as List).map((model) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model['name'], style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                          const SizedBox(height: 3),
                          Text(model['specs'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(model['price'], style: const TextStyle(color: Color(0xFF34D399), fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
              )),
            ],
          ),
        )),
      ],
    );
  }
}

class SpecsScreen extends StatelessWidget {
  final AppTranslations t;
  const SpecsScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(t.get('specsTab'), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Global Benchmarks Hub', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
              const SizedBox(height: 10),
              Text(t.get('globalDatabase'), style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 16),
              const LinearProgressIndicator(value: 0.95, color: Color(0xFF818CF8), backgroundColor: Colors.white10),
              const SizedBox(height: 10),
              const Text('Processor, Camera (DxOMARK), and Battery Performance Index updated in real-time.', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}

class AiAssistantScreen extends StatelessWidget {
  final AppTranslations t;
  const AiAssistantScreen({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_awesome_rounded, size: 50, color: Color(0xFF818CF8)),
                  SizedBox(height: 16),
                  Text('AI Phone Expert & Advisor', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Ask me anything about global specifications, benchmarks, or finding the best phone for your budget.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: t.get('searchHint'),
                    filled: true,
                    fillColor: const Color(0xFF1E293B),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.send_rounded),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
