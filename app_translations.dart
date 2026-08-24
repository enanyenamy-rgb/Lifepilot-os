import 'package:flutter/material.dart';

class AppTranslations {
  final Locale locale;
  AppTranslations(this.locale);

  static AppTranslations? of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  // قاموس الكلمات والترجمات لكل لغات العالم
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Phone',
      'welcomeMessage': 'Discover smart specs & global local markets',
      'searchHint': 'Search any smartphone...',
      'usedMarketTab': 'Used Market',
      'specsTab': 'Phone Specs',
      'revealContact': 'Unlock Contact (\$1)',
    },
    'ar': {
      'appTitle': 'آي فون (AI Phone)',
      'welcomeMessage': 'اكتشف المواصفات الذكية والأسواق المحلية والعالمية',
      'searchHint': 'ابحث عن أي هاتف ذكي...',
      'usedMarketTab': 'سوق المستعمل',
      'specsTab': 'مواصفات الهواتف',
      'revealContact': 'كشف رقم التواصل (1\$)',
    },
    // يمكنك إضافة أي لغة أخرى هنا بسهولة بنفس الطريقة (مثل 'fr', 'es', إلخ)
  };

  String get appTitle {
    return _localizedValues[locale.languageCode]?['appTitle'] ?? _localizedValues['en']!['appTitle']!;
  }

  String get welcomeMessage {
    return _localizedValues[locale.languageCode]?['welcomeMessage'] ?? _localizedValues['en']!['welcomeMessage']!;
  }

  String get searchHint {
    return _localizedValues[locale.languageCode]?['searchHint'] ?? _localizedValues['en']!['searchHint']!;
  }

  String get usedMarketTab {
    return _localizedValues[locale.languageCode]?['usedMarketTab'] ?? _localizedValues['en']!['usedMarketTab']!;
  }

  String get specsTab {
    return _localizedValues[locale.languageCode]?['specsTab'] ?? _localizedValues['en']!['specsTab']!;
  }

  String get revealContact {
    return _localizedValues[locale.languageCode]?['revealContact'] ?? _localizedValues['en']!['revealContact']!;
  }
}

// مندوب الترجمة لتفعيل اللغات في التطبيق
class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  const AppTranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) async {
    return AppTranslations(locale);
  }

  @override
  bool shouldReload(AppTranslationsDelegate old) => false;
}
