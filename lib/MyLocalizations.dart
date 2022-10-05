import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return MyLocalizations;
    });
  }

  static MyLocalizations? of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  static final Map<String, Map<String, String>> _values = {
    'en': {
      'title': 'Localisation Demo',
      "info": "Enter your Information below",
      "name": "Enter your name",
      "name_hint": "Name",
      "date_hint": "Date",
      "message": "Leave your Message",
      "message_hint": "Message"
    },
    'fr': {
      'title': 'Démo de localisation',
      "info": "Entrez vos informations ci-dessous",
      "name": "Entrez votre nom",
      "name_hint": "Nom",
      "date_hint": "Date",
      "message": "Laissez votre message",
      "message_hint": "Message"
    }
  };

  String? get title {
    return _values[locale.languageCode]!['title'];
  }

  String find(String key) {
    return _values[locale.languageCode]![key] ?? '';
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  // @override
  // Future<MyLocalizations> load(Locale locale) {
  //   return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  // }
  @override
  Future<MyLocalizations> load(Locale locale) => MyLocalizations.load(locale);

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
