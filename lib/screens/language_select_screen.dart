import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/storage_service.dart';
import '../widgets/language_card.dart';
import '../main.dart';
import 'unit_select_screen.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({super.key});

  final List<Map<String, String>> languages = const [
    {'name': 'English', 'code': 'en', 'flag': '🇺🇸'},
    {'name': 'Français', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'العربية', 'code': 'ar', 'flag': '🇸🇦'},
    {'name': 'Español', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'Deutsch', 'code': 'de', 'flag': '🇩🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'Select Language',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return LanguageCard(
                      languageName: lang['name']!,
                      flag: lang['flag']!,
                      onTap: () {
                        context.read<AppState>().setLanguage(lang['code']!);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const UnitSelectScreen()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
