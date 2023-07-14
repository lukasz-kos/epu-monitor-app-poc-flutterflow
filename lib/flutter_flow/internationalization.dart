import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? fiText = '',
  }) =>
      [enText, fiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'mti4f3lf': {
      'en': 'Home',
      'fi': '',
    },
  },
  // MainView
  {
    'nh7ecoou': {
      'en': 'Main View',
      'fi': '',
    },
    'g1k1055w': {
      'en': 'Home',
      'fi': '',
    },
  },
  // Miscellaneous
  {
    'cfclv0i4': {
      'en': '',
      'fi': '',
    },
    'w2e6r1kq': {
      'en': '',
      'fi': '',
    },
    'b7n56bqy': {
      'en': '',
      'fi': '',
    },
    '1vc6778l': {
      'en': '',
      'fi': '',
    },
    'r01c6o6v': {
      'en': '',
      'fi': '',
    },
    'j7s5ollv': {
      'en': '',
      'fi': '',
    },
    'id6bx2fp': {
      'en': '',
      'fi': '',
    },
    'wke2hjex': {
      'en': '',
      'fi': '',
    },
    '1nrspojy': {
      'en': '',
      'fi': '',
    },
    'dsa9ghho': {
      'en': '',
      'fi': '',
    },
    'wmwnl2x2': {
      'en': '',
      'fi': '',
    },
    'nn4e1gte': {
      'en': '',
      'fi': '',
    },
    'qo2bvvjp': {
      'en': '',
      'fi': '',
    },
    'od0j6y73': {
      'en': '',
      'fi': '',
    },
    'ywu2hhr4': {
      'en': '',
      'fi': '',
    },
    '2migdlx9': {
      'en': '',
      'fi': '',
    },
    'dr9zvv8r': {
      'en': '',
      'fi': '',
    },
    'f1svpqg4': {
      'en': '',
      'fi': '',
    },
    '37uivhzu': {
      'en': '',
      'fi': '',
    },
    '5mj9k0an': {
      'en': '',
      'fi': '',
    },
    '72iz4vbs': {
      'en': '',
      'fi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
