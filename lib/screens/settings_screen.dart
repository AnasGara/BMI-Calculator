import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmicalculator/generated/app_localizations.dart';
import '../main.dart';
import 'privacy_policy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _SectionHeader(title: l10n.language),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.language),
            trailing: DropdownButton<String>(
              value: appState.languageCode,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'fr', child: Text('Français')),
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
                DropdownMenuItem(value: 'es', child: Text('Español')),
                DropdownMenuItem(value: 'de', child: Text('Deutsch')),
              ],
              onChanged: (val) {
                if (val != null) appState.setLanguage(val);
              },
            ),
          ),
          const Divider(),
          _SectionHeader(title: l10n.unitSystem),
          SwitchListTile(
            secondary: const Icon(Icons.scale),
            title: Text(appState.unitSystem == 'metric' ? l10n.metric : l10n.imperial),
            value: appState.unitSystem == 'metric',
            onChanged: (val) {
              appState.setUnitSystem(val ? 'metric' : 'imperial');
            },
          ),
          const Divider(),
          _SectionHeader(title: 'App Info'),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.privacyPolicy),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.termsOfUse),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsOfUseScreen())),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
