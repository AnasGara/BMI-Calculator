// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Calculadora IMC';

  @override
  String get history => 'Historial';

  @override
  String get settings => 'Ajustes';

  @override
  String get calculate => 'Calcular';

  @override
  String get height => 'Altura';

  @override
  String get weight => 'Peso';

  @override
  String get bmi => 'IMC';

  @override
  String get bmiResult => 'Tu resultado IMC';

  @override
  String get underweight => 'Bajo peso';

  @override
  String get normal => 'Peso normal';

  @override
  String get overweight => 'Sobrepeso';

  @override
  String get obese => 'Obesidad';

  @override
  String get saveToHistory => 'Guardar en historial';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get noHistory => 'Sin historial aún';

  @override
  String get language => 'Idioma';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get metric => 'Métrico (cm/kg)';

  @override
  String get imperial => 'Imperial (pies/libras)';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get version => 'Versión';
}
