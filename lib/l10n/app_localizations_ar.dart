// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حاسبة مؤشر كتلة الجسم';

  @override
  String get history => 'السجل';

  @override
  String get settings => 'الإعدادات';

  @override
  String get calculate => 'احسب';

  @override
  String get height => 'الطول';

  @override
  String get weight => 'الوزن';

  @override
  String get bmi => 'مؤشر كتلة الجسم';

  @override
  String get bmiResult => 'نتيجة مؤشر كتلة الجسم';

  @override
  String get underweight => 'نقص الوزن';

  @override
  String get normal => 'وزن طبيعي';

  @override
  String get overweight => 'زيادة الوزن';

  @override
  String get obese => 'سمنة';

  @override
  String get saveToHistory => 'حفظ في السجل';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get noHistory => 'لا يوجد سجل بعد';

  @override
  String get language => 'اللغة';

  @override
  String get unitSystem => 'نظام الوحدات';

  @override
  String get metric => 'متري (سم/كجم)';

  @override
  String get imperial => 'إمبراطوري (قدم/رطل)';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get version => 'الإصدار';
}
