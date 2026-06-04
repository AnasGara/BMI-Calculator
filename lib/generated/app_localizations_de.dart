// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'BMI-Rechner';

  @override
  String get history => 'Verlauf';

  @override
  String get settings => 'Einstellungen';

  @override
  String get calculate => 'Berechnen';

  @override
  String get height => 'Größe';

  @override
  String get weight => 'Gewicht';

  @override
  String get bmi => 'BMI';

  @override
  String get bmiResult => 'Ihr BMI-Ergebnis';

  @override
  String get underweight => 'Untergewicht';

  @override
  String get normal => 'Normalgewicht';

  @override
  String get overweight => 'Übergewicht';

  @override
  String get obese => 'Fettleibigkeit';

  @override
  String get saveToHistory => 'Im Verlauf speichern';

  @override
  String get clearHistory => 'Verlauf löschen';

  @override
  String get noHistory => 'Kein Verlauf vorhanden';

  @override
  String get language => 'Sprache';

  @override
  String get unitSystem => 'Einheitensystem';

  @override
  String get metric => 'Metrisch (cm/kg)';

  @override
  String get imperial => 'Imperial (ft/lbs)';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get version => 'Version';
}
