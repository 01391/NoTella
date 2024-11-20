import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['it', 'en', 'de', 'ru', 'ro'];

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
    String? itText = '',
    String? enText = '',
    String? deText = '',
    String? ruText = '',
    String? roText = '',
  }) =>
      [itText, enText, deText, ruText, roText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // note
  {
    'tpw4y89v': {
      'it': 'Note',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'ruce271t': {
      'it': 'Note',
      'de': 'Notizen',
      'en': 'Notes',
      'ro': 'Note',
      'ru': 'Примечания',
    },
  },
  // editNota
  {
    '10gl7dnx': {
      'it': 'Dettagli Nota',
      'de': 'Details Hinweis',
      'en': 'Details Note',
      'ro': 'Detalii',
      'ru': 'Подробности Примечание',
    },
    'ktloxat2': {
      'it': 'Titolo',
      'de': 'Titel',
      'en': 'Title',
      'ro': 'Titlu',
      'ru': 'Заголовок',
    },
    'lxarzf0m': {
      'it': 'Descrizione',
      'de': 'Beschreibung',
      'en': 'Description',
      'ro': 'Descriere',
      'ru': 'Описание',
    },
    '69g4nijm': {
      'it': 'Aggiorna Nota',
      'de': 'Update-Hinweis',
      'en': 'Update Note',
      'ro': 'Nota de actualizare',
      'ru': 'Обновить примечание',
    },
    '51gmr6sh': {
      'it': 'Home',
      'de': 'Heim',
      'en': 'Home',
      'ro': 'Acasă',
      'ru': 'Дом',
    },
  },
  // completate
  {
    'qiuddre0': {
      'it': 'Completate',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    '3r5se5to': {
      'it': 'Completate',
      'de': 'Vollständig',
      'en': 'Completed',
      'ro': 'Complet',
      'ru': 'Полный',
    },
  },
  // addNota
  {
    '5jts0tjz': {
      'it': 'Aggiungi Nota',
      'de': 'Notiz hinzufügen',
      'en': 'Add Note',
      'ro': 'Adăugați o notă',
      'ru': 'Добавить примечание',
    },
    'hefiwiqx': {
      'it': 'Titolo..',
      'de': 'Titel..',
      'en': 'Title..',
      'ro': 'Titlu..',
      'ru': 'Заголовок..',
    },
    '6e7qltjp': {
      'it': 'Descrizione...',
      'de': 'Beschreibung...',
      'en': 'Description...',
      'ro': 'Descriere...',
      'ru': 'Описание...',
    },
    'emcb3iwk': {
      'it': 'Conferma',
      'de': 'Bestätigen',
      'en': 'Confirm',
      'ro': 'Confirma',
      'ru': 'Подтверждать',
    },
  },
  // deleteNota
  {
    'ap8qjy3u': {
      'it': 'Elimina',
      'de': 'Löschen',
      'en': 'Delete',
      'ro': 'Şterge',
      'ru': 'Удалить',
    },
  },
  // Miscellaneous
  {
    'he0vsuyq': {
      'it': 'Button',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    '1h076rta': {
      'it': 'TextField...',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'my32bl52': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    '8m9dx23p': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'rhpp27yn': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'umaayo7v': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'yff3rznd': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'hzdvl61q': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'g7bpun7n': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'dhn2irhm': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'pxenrk67': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    '3rjvvvcy': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'c6vloo6f': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'l3aok8ge': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'cr8bht62': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'ef99rn70': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'eiwc0swv': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'nd3780y1': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'zbph0kml': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'a5efz6jb': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'lgp0lxa0': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'x97vuubt': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'qkbx2s5y': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'q2di0gtv': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'jd26tx6f': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'macrzoy9': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
    'lfb7k42w': {
      'it': '',
      'de': '',
      'en': '',
      'ro': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
