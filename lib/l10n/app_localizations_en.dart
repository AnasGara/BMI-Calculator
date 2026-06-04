// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BMI Calculator';

  @override
  String get history => 'History';

  @override
  String get settings => 'Settings';

  @override
  String get calculate => 'Calculate';

  @override
  String get height => 'Height';

  @override
  String get weight => 'Weight';

  @override
  String get bmi => 'BMI';

  @override
  String get bmiResult => 'Your BMI Result';

  @override
  String get underweight => 'Underweight';

  @override
  String get normal => 'Normal weight';

  @override
  String get overweight => 'Overweight';

  @override
  String get obese => 'Obese';

  @override
  String get saveToHistory => 'Save to History';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get noHistory => 'No history yet';

  @override
  String get language => 'Language';

  @override
  String get unitSystem => 'Unit System';

  @override
  String get metric => 'Metric (cm/kg)';

  @override
  String get imperial => 'Imperial (ft/in/lbs)';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get version => 'Version';
}
