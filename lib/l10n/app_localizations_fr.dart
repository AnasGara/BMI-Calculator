// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Calculateur IMC';

  @override
  String get history => 'Historique';

  @override
  String get settings => 'Paramètres';

  @override
  String get calculate => 'Calculer';

  @override
  String get height => 'Taille';

  @override
  String get weight => 'Poids';

  @override
  String get bmi => 'IMC';

  @override
  String get bmiResult => 'Votre résultat IMC';

  @override
  String get underweight => 'Insuffisance pondérale';

  @override
  String get normal => 'Poids normal';

  @override
  String get overweight => 'Surpoids';

  @override
  String get obese => 'Obésité';

  @override
  String get saveToHistory => 'Enregistrer dans l\'historique';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get noHistory => 'Pas encore d\'historique';

  @override
  String get language => 'Langue';

  @override
  String get unitSystem => 'Système d\'unités';

  @override
  String get metric => 'Métrique (cm/kg)';

  @override
  String get imperial => 'Impérial (pouces/livres)';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get version => 'Version';
}
