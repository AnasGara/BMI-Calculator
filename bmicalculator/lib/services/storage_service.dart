import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  static const String _languageKey = 'language';
  static const String _unitSystemKey = 'unit_system';
  static const String _historyKey = 'bmi_history';
  static const String _onboardingCompleteKey = 'onboarding_complete';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  String getLanguage() => _prefs.getString(_languageKey) ?? 'en';
  Future<void> setLanguage(String lang) => _prefs.setString(_languageKey, lang);

  String getUnitSystem() => _prefs.getString(_unitSystemKey) ?? 'metric';
  Future<void> setUnitSystem(String system) => _prefs.setString(_unitSystemKey, system);

  bool isOnboardingComplete() => _prefs.getBool(_onboardingCompleteKey) ?? false;
  Future<void> setOnboardingComplete(bool complete) => _prefs.setBool(_onboardingCompleteKey, complete);

  List<Map<String, dynamic>> getHistory() {
    final String? historyJson = _prefs.getString(_historyKey);
    if (historyJson == null) return [];
    return List<Map<String, dynamic>>.from(json.decode(historyJson));
  }

  Future<void> addHistory(Map<String, dynamic> entry) async {
    final history = getHistory();
    history.insert(0, entry);
    await _prefs.setString(_historyKey, json.encode(history));
  }

  Future<void> clearHistory() => _prefs.remove(_historyKey);
}
